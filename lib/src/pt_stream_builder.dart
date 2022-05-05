import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

/// Signature for a function that builds a widget from a value.
typedef ValueBuilderFn<T> = Widget Function(BuildContext context, T value);

/// Signature for a function that builds a widget from an exception.
typedef ErrorBuilderFn = Widget Function(
    BuildContext context, Object error, StackTrace? stackTrace);

/// Signature for a function that reports a flutter error, e.g. [FlutterError.reportError].
typedef ErrorReporterFn = void Function(FlutterErrorDetails details);

class PTStreamBuilder<T> extends StatefulWidget {
  /// The builder that should be called when no data is available.
  final WidgetBuilder? waiting;

  /// The default value builder.
  final ValueBuilderFn<T> builder;

  /// The builder that should be called when an error was thrown by the future
  /// or stream.
  final ErrorBuilderFn? error;

  /// The builder that should be called when the stream is closed.
  final ValueBuilderFn<T>? closed;

  /// If provided, this is the future the widget listens to.
  final Future<T>? future;

  /// If provided, this is the stream the widget listens to.
  final Stream<T>? stream;

  /// The initial value used before one is available.
  final T? initial;

  /// Whether or not the current value should be retained when the [stream] or
  /// [future] instances change.
  final bool retain;

  /// Whether or not to suppress printing errors to the console.
  final bool silent;

  /// Whether or not to pause the stream subscription.
  final bool pause;

  /// If provided, overrides the function that prints errors to the console.
  final ErrorReporterFn reportError;

  /// Creates a widget that builds depending on the state of a [Future] or [Stream].
  const PTStreamBuilder({
    Key? key,
    this.waiting,
    required this.builder,
    this.error,
    this.closed,
    this.future,
    this.stream,
    this.initial,
    this.retain = false,
    this.pause = false,
    bool? silent,
    ErrorReporterFn? reportError,
  })  : silent = silent ?? error != null,
        reportError = reportError ?? FlutterError.reportError,
        assert(!((future != null) && (stream != null)),
            'PTStreamBuilder should be given either a stream or future'),
        assert(future == null || closed == null,
            'PTStreamBuilder should not be given both a future and closed builder'),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _PTStreamBuilderState<T>();
}

class _PTStreamBuilderState<T> extends State<PTStreamBuilder<T>> {
  T? _lastValue;
  Object? _lastError;
  StackTrace? _lastStackTrace;
  bool _hasFired = false;
  bool _isClosed = false;
  StreamSubscription? _subscription;

  void _cancel() {
    if (!widget.retain) {
      _lastValue = null;
      _lastError = null;
      _lastStackTrace = null;
      _hasFired = false;
    }
    _isClosed = false;
    _subscription?.cancel();
    _subscription = null;
  }

  void _handleError(Object error, StackTrace? stackTrace) {
    _lastError = error;
    _lastStackTrace = stackTrace;
    if (widget.error != null && mounted) {
      setState(() {});
    }
    if (!widget.silent) {
      widget.reportError(FlutterErrorDetails(
        exception: error,
        stack: stackTrace ?? StackTrace.empty,
        context: ErrorDescription('While updating PTStreamBuilder'),
      ));
    }
  }

  void _initFuture() {
    _cancel();
    final Future<T> future = widget.future!;
    future.then((T value) {
      if (future != widget.future || !mounted) return; // Skip if future changed
      setState(() {
        _lastValue = value;
        _hasFired = true;
      });
    }, onError: _handleError);
  }

  void _updatePause() {
    if (_subscription != null) {
      if (widget.pause && !_subscription!.isPaused) {
        _subscription!.pause();
      } else if (!widget.pause && _subscription!.isPaused) {
        _subscription!.resume();
      }
    }
  }

  void _initStream() {
    _cancel();
    final Stream<T> stream = widget.stream!;
    var skipFirst = false;
    if (stream is ValueStream<T> && stream.hasValue) {
      skipFirst = true;
      _hasFired = true;
      _lastValue = stream.value;
    }
    _subscription = stream.listen(
      (T event) {
        if (skipFirst) {
          skipFirst = false;
          return;
        }
        setState(() {
          _hasFired = true;
          _lastValue = event;
        });
      },
      onDone: () {
        _isClosed = true;
        if (widget.closed != null) {
          setState(() {});
        }
      },
      onError: _handleError,
    );
  }

  @override
  void initState() {
    super.initState();

    if (widget.future != null) {
      _initFuture();
    } else if (widget.stream != null) {
      _initStream();
      _updatePause();
    }
  }

  @override
  void didUpdateWidget(PTStreamBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.future != null) {
      if (widget.future != oldWidget.future) _initFuture();
    } else if (widget.stream != null) {
      if (widget.stream != oldWidget.stream) _initStream();
    } else {
      _cancel();
    }

    _updatePause();
  }

  @override
  Widget build(BuildContext context) {
    if (_lastError != null && widget.error != null) {
      return widget.error!(context, _lastError!, _lastStackTrace);
    }

    if (_isClosed && widget.closed != null) {
      return _hasFired
          ? widget.closed!(context, _lastValue!)
          : widget.initial == null
              ? Container()
              : widget.builder(context, widget.initial!);
    }

    if (!_hasFired && widget.waiting != null) {
      return widget.waiting!(context);
    }

    return _hasFired
        ? widget.builder(context, _lastValue!)
        : widget.initial == null
            ? Container()
            : widget.builder(context, widget.initial!);
  }

  @override
  void dispose() {
    _cancel();
    super.dispose();
  }
}
