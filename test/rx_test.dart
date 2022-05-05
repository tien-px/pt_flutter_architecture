//ignore_for_file: close_sinks
import 'dart:async';

import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';
import 'package:test/test.dart';

List<Stream<int>> _createTestStreams() {
  /// creates streams that emit after a certain amount of milliseconds,
  /// the List of intervals (in ms)
  const intervals = [22, 50, 30, 40, 60];
  final ticker =
      Stream<int>.periodic(const Duration(milliseconds: 1), (index) => index)
          .skip(1)
          .take(300)
          .asBroadcastStream();

  return [
    ticker
        .where((index) => index % intervals[0] == 0)
        .map((index) => index ~/ intervals[0] - 1),
    ticker
        .where((index) => index % intervals[1] == 0)
        .map((index) => index ~/ intervals[1] - 1),
    ticker
        .where((index) => index % intervals[2] == 0)
        .map((index) => index ~/ intervals[2] - 1),
    ticker
        .where((index) => index % intervals[3] == 0)
        .map((index) => index ~/ intervals[3] - 1),
    ticker
        .where((index) => index % intervals[4] == 0)
        .map((index) => index ~/ intervals[4] - 1)
  ];
}

void main() {
  group('withLatestFrom', () {
    test('Rx.withLatestFrom', () async {
      const expectedOutput = [0, 0, 1, 1, 2];
      final streams = _createTestStreams();
      await expectLater(streams.first.withLatestFromS(streams[1]).take(5),
          emitsInOrder(expectedOutput));
    });
  });
}
