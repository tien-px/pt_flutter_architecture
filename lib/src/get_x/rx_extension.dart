import 'dart:async';

import 'package:get/get.dart' as GetX;
import 'package:pt_flutter_architecture/src/tuple/rx_tuple.dart';
import 'package:rxdart/rxdart.dart';

/// Returns a `PublishSubject`
PublishSubject<T> subject<T>() {
  return PublishSubject<T>();
}

/// Creates an empty broadcast stream.
Stream<T> empty<T>() {
  return Stream<T>.empty();
}

/// A future that waits for its streams to finish.
waitForEmit() async {
  await Future.delayed(Duration(milliseconds: 1000));
}

emit(Subject stream, [Object? object, int milliseconds = 1000]) async {
  stream.emit(object);
  await Future.delayed(Duration(milliseconds: milliseconds));
}

extension GetRxExtensions<T> on Stream<T> {
  /// Assigns each element from a publisher to a property on an object.
  StreamSubscription<T> assign([GetX.RxObjectMixin<T>? object]) {
    if (object == null) {
      return this.listen(null);
    }
    return this.listen((value) => object.value = value);
  }
}

extension RxExtensions on StreamController {
  /// Sends a data [object].
  ///
  /// Listeners receive this event in a later microtask.
  void emit([Object? object]) {
    return this.add(object);
  }
}

extension RxStreamExtensions<T> on Stream<T> {
  /// Emits the void value on the output Stream every time the source
  Stream<void> mapToVoid() => mapTo<void>(null);

  /// Transforms a [Stream] so that will only emit items from the source
  /// sequence whenever the time span defined by [duration] milliseconds passes, without the
  /// source sequence emitting another item.
  ///
  /// This time span start after the last debounced event was emitted.
  ///
  /// debounceTime filters out items emitted by the source [Stream] that are
  /// rapidly followed by another emitted item.
  ///
  /// [Interactive marble diagram](http://rxmarbles.com/#debounceTime)
  ///
  /// ### Example
  ///
  ///     Stream.fromIterable([1, 2, 3, 4])
  ///       .debounceS(1000)
  ///       .listen(print); // prints 4
  Stream<T> debounceS(int milliseconds) =>
      debounceTime(Duration(milliseconds: milliseconds));

  /// Emits a value from the source [Stream], then ignores subsequent source values
  /// for a [duration] in milliseconds, then repeats this process.
  ///
  /// If leading is true, then the first item in each window is emitted.
  ///
  /// ### Example
  ///
  ///     Stream.fromIterable([1, 2, 3])
  ///       .throttleS(1000);
  Stream<T> throttleS(int milliseconds) =>
      throttleTime(Duration(milliseconds: milliseconds));

  /// Adds a subscription to this stream.
  StreamSubscription<T> subscribe({
    void Function(T)? onData,
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    return this.listen(onData,
        onDone: onDone, onError: onError, cancelOnError: cancelOnError);
  }
}

extension RxBehaviorSubject<T> on T {
  /// Returns a `BehaviorSubject` with [this] `T` as current [seedValue] and is emitted immediately.
  BehaviorSubject<T> get subject => BehaviorSubject<T>.seeded(this);
}

extension RxFilterExt<T> on Stream<T> {
  /// Creates a new stream from this stream that discards some elements
  Stream<T> filterS(bool test(T t)) => where(test);
}

extension RxWithLatestFromExt<T> on Stream<T> {
  /// Creates a Stream that emits when the source stream emits, combining the
  /// latest values from the two streams using the provided function.
  ///
  /// If the latestFromStream has not emitted any values, this stream will not
  /// emit either.
  ///
  /// [Interactive marble diagram](http://rxmarbles.com/#withLatestFrom)
  Stream<A> withLatestFromS<A>(Stream<A> latestFromStream) =>
      withLatestFrom<A, A>(latestFromStream, (t, s) => s);

  /// Creates a Stream that emits when the source stream emits, combining the
  /// latest values from the two streams using the provided function.
  ///
  /// If the latestFromStream has not emitted any values, this stream will not
  /// emit either.
  ///
  /// It returns RxTuple with origin data.
  ///
  /// [Interactive marble diagram](http://rxmarbles.com/#withLatestFrom)
  Stream<RxTuple<T, A>> withLatestFromWithOrigin<A>(
          Stream<A> latestFromStream) =>
      withLatestFrom<A, RxTuple<T, A>>(
          latestFromStream, (t, s) => RxTuple(t, s));

  /// Creates a Stream that emits when the source stream emits, combining the
  /// latest values from the three streams using the provided function.
  ///
  /// If any of latestFromStreams has not emitted any values, this stream will
  /// not emit either.
  ///
  /// [Interactive marble diagram](http://rxmarbles.com/#withLatestFrom)
  Stream<RxTuple2<T, A, B>> withLatestFrom2S<A, B>(
          Stream<A> latestFromStream1, Stream<B> latestFromStream2) =>
      withLatestFrom2<A, B, RxTuple2<T, A, B>>(latestFromStream1,
          latestFromStream2, (t, a, b) => RxTuple2<T, A, B>(t, a, b));

  /// Creates a Stream that emits when the source stream emits, combining the
  /// latest values from the four streams using the provided function.
  ///
  /// If any of latestFromStreams has not emitted any values, this stream will
  /// not emit either.
  ///
  /// [Interactive marble diagram](http://rxmarbles.com/#withLatestFrom)
  Stream<RxTuple3<T, A, B, C>> withLatestFrom3S<A, B, C>(
          Stream<A> latestFromStream1,
          Stream<B> latestFromStream2,
          Stream<C> latestFromStream3) =>
      withLatestFrom3<A, B, C, RxTuple3<T, A, B, C>>(
          latestFromStream1,
          latestFromStream2,
          latestFromStream3,
          (t, a, b, c) => RxTuple3<T, A, B, C>(t, a, b, c));

  /// Creates a Stream that emits when the source stream emits, combining the
  /// latest values from the five streams using the provided function.
  ///
  /// If any of latestFromStreams has not emitted any values, this stream will
  /// not emit either.
  ///
  /// [Interactive marble diagram](http://rxmarbles.com/#withLatestFrom)
  Stream<RxTuple4<T, A, B, C, D>> withLatestFrom4S<A, B, C, D>(
          Stream<A> latestFromStream1,
          Stream<B> latestFromStream2,
          Stream<C> latestFromStream3,
          Stream<D> latestFromStream4) =>
      withLatestFrom4<A, B, C, D, RxTuple4<T, A, B, C, D>>(
          latestFromStream1,
          latestFromStream2,
          latestFromStream3,
          latestFromStream4,
          (t, a, b, c, d) => RxTuple4<T, A, B, C, D>(t, a, b, c, d));

  /// Creates a Stream that emits when the source stream emits, combining the
  /// latest values from the six streams using the provided function.
  ///
  /// If any of latestFromStreams has not emitted any values, this stream will
  /// not emit either.
  ///
  /// [Interactive marble diagram](http://rxmarbles.com/#withLatestFrom)
  Stream<RxTuple5<T, A, B, C, D, E>> withLatestFrom5S<A, B, C, D, E>(
          Stream<A> latestFromStream1,
          Stream<B> latestFromStream2,
          Stream<C> latestFromStream3,
          Stream<D> latestFromStream4,
          Stream<E> latestFromStream5) =>
      withLatestFrom5<A, B, C, D, E, RxTuple5<T, A, B, C, D, E>>(
          latestFromStream1,
          latestFromStream2,
          latestFromStream3,
          latestFromStream4,
          latestFromStream5,
          (t, a, b, c, d, e) => RxTuple5<T, A, B, C, D, E>(t, a, b, c, d, e));

  /// Creates a Stream that emits when the source stream emits, combining the
  /// latest values from the seven streams using the provided function.
  ///
  /// If any of latestFromStreams has not emitted any values, this stream will
  /// not emit either.
  ///
  /// [Interactive marble diagram](http://rxmarbles.com/#withLatestFrom)
  Stream<RxTuple6<T, A, B, C, D, E, F>> withLatestFrom6S<A, B, C, D, E, F>(
          Stream<A> latestFromStream1,
          Stream<B> latestFromStream2,
          Stream<C> latestFromStream3,
          Stream<D> latestFromStream4,
          Stream<E> latestFromStream5,
          Stream<F> latestFromStream6) =>
      withLatestFrom6<A, B, C, D, E, F, RxTuple6<T, A, B, C, D, E, F>>(
          latestFromStream1,
          latestFromStream2,
          latestFromStream3,
          latestFromStream4,
          latestFromStream5,
          latestFromStream6,
          (t, a, b, c, d, e, f) =>
              RxTuple6<T, A, B, C, D, E, F>(t, a, b, c, d, e, f));

  /// Creates a Stream that emits when the source stream emits, combining the
  /// latest values from the eight streams using the provided function.
  ///
  /// If any of latestFromStreams has not emitted any values, this stream will
  /// not emit either.
  ///
  /// [Interactive marble diagram](http://rxmarbles.com/#withLatestFrom)
  Stream<RxTuple7<T, A, B, C, D, E, F, G>> withLatestFrom7S<A, B, C, D, E, F,
              G>(
          Stream<A> latestFromStream1,
          Stream<B> latestFromStream2,
          Stream<C> latestFromStream3,
          Stream<D> latestFromStream4,
          Stream<E> latestFromStream5,
          Stream<F> latestFromStream6,
          Stream<G> latestFromStream7) =>
      withLatestFrom7<A, B, C, D, E, F, G, RxTuple7<T, A, B, C, D, E, F, G>>(
          latestFromStream1,
          latestFromStream2,
          latestFromStream3,
          latestFromStream4,
          latestFromStream5,
          latestFromStream6,
          latestFromStream7,
          (t, a, b, c, d, e, f, g) =>
              RxTuple7<T, A, B, C, D, E, F, G>(t, a, b, c, d, e, f, g));
}
