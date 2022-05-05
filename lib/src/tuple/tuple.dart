/// # Tuple data structure
///
/// - [Tuple2], [Tuple3]...
///
/// ## Usage example
///
/// ```dart
/// const t = const Tuple2<String, int>('a', 10);
///
/// print(t.i1); // prints 'a'
/// print(t.i2); // prints '10'
/// ```
///
/// ```dart
/// const t1 = const Tuple2<String, int>('a', 10);
/// final t2 = t1.withItem1('c');
/// // t2 is a new [Tuple2] object with i1 is 'c' and i2 is 10.
/// ```
library tuple;

import 'package:quiver/core.dart';

/// Represents a 2-tuple, or pair.
class Tuple2<T1, T2> {
  /// Returns the first item of the tuple
  final T1 i1;

  /// Returns the second item of the tuple
  final T2 i2;

  /// Creates a new tuple value with the specified items.
  const Tuple2(this.i1, this.i2);

  /// Create a new tuple value with the specified list [items].
  factory Tuple2.fromList(List items) {
    if (items.length != 2) {
      throw ArgumentError('items must have length 2');
    }

    return Tuple2<T1, T2>(items[0] as T1, items[1] as T2);
  }

  /// Returns a tuple with the first item set to the specified value.
  Tuple2<T1, T2> withItem1(T1 v) => Tuple2<T1, T2>(v, i2);

  /// Returns a tuple with the second item set to the specified value.
  Tuple2<T1, T2> withItem2(T2 v) => Tuple2<T1, T2>(i1, v);

  /// Creates a [List] containing the items of this [Tuple2].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([i1, i2], growable: growable);

  @override
  String toString() => '[$i1, $i2]';

  @override
  bool operator ==(Object other) =>
      other is Tuple2 && other.i1 == i1 && other.i2 == i2;

  @override
  int get hashCode => hash2(i1.hashCode, i2.hashCode);
}

/// Represents a 3-tuple, or triple.
class Tuple3<T1, T2, T3> {
  /// Returns the first item of the tuple
  final T1 i1;

  /// Returns the second item of the tuple
  final T2 i2;

  /// Returns the third item of the tuple
  final T3 i3;

  /// Creates a new tuple value with the specified items.
  const Tuple3(this.i1, this.i2, this.i3);

  /// Create a new tuple value with the specified list [items].
  factory Tuple3.fromList(List items) {
    if (items.length != 3) {
      throw ArgumentError('items must have length 3');
    }

    return Tuple3<T1, T2, T3>(items[0] as T1, items[1] as T2, items[2] as T3);
  }

  /// Returns a tuple with the first item set to the specified value.
  Tuple3<T1, T2, T3> withItem1(T1 v) => Tuple3<T1, T2, T3>(v, i2, i3);

  /// Returns a tuple with the second item set to the specified value.
  Tuple3<T1, T2, T3> withItem2(T2 v) => Tuple3<T1, T2, T3>(i1, v, i3);

  /// Returns a tuple with the third item set to the specified value.
  Tuple3<T1, T2, T3> withItem3(T3 v) => Tuple3<T1, T2, T3>(i1, i2, v);

  /// Creates a [List] containing the items of this [Tuple3].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([i1, i2, i3], growable: growable);

  @override
  String toString() => '[$i1, $i2, $i3]';

  @override
  bool operator ==(Object other) =>
      other is Tuple3 &&
          other.i1 == i1 &&
          other.i2 == i2 &&
          other.i3 == i3;

  @override
  int get hashCode => hash3(i1.hashCode, i2.hashCode, i3.hashCode);
}

/// Represents a 4-tuple, or quadruple.
class Tuple4<T1, T2, T3, T4> {
  /// Returns the first item of the tuple
  final T1 i1;

  /// Returns the second item of the tuple
  final T2 i2;

  /// Returns the third item of the tuple
  final T3 i3;

  /// Returns the fourth item of the tuple
  final T4 i4;

  /// Creates a new tuple value with the specified items.
  const Tuple4(this.i1, this.i2, this.i3, this.i4);

  /// Create a new tuple value with the specified list [items].
  factory Tuple4.fromList(List items) {
    if (items.length != 4) {
      throw ArgumentError('items must have length 4');
    }

    return Tuple4<T1, T2, T3, T4>(
        items[0] as T1, items[1] as T2, items[2] as T3, items[3] as T4);
  }

  /// Returns a tuple with the first item set to the specified value.
  Tuple4<T1, T2, T3, T4> withItem1(T1 v) =>
      Tuple4<T1, T2, T3, T4>(v, i2, i3, i4);

  /// Returns a tuple with the second item set to the specified value.
  Tuple4<T1, T2, T3, T4> withItem2(T2 v) =>
      Tuple4<T1, T2, T3, T4>(i1, v, i3, i4);

  /// Returns a tuple with the third item set to the specified value.
  Tuple4<T1, T2, T3, T4> withItem3(T3 v) =>
      Tuple4<T1, T2, T3, T4>(i1, i2, v, i4);

  /// Returns a tuple with the fourth item set to the specified value.
  Tuple4<T1, T2, T3, T4> withItem4(T4 v) =>
      Tuple4<T1, T2, T3, T4>(i1, i2, i3, v);

  /// Creates a [List] containing the items of this [Tuple4].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([i1, i2, i3, i4], growable: growable);

  @override
  String toString() => '[$i1, $i2, $i3, $i4]';

  @override
  bool operator ==(Object other) =>
      other is Tuple4 &&
          other.i1 == i1 &&
          other.i2 == i2 &&
          other.i3 == i3 &&
          other.i4 == i4;

  @override
  int get hashCode =>
      hash4(i1.hashCode, i2.hashCode, i3.hashCode, i4.hashCode);
}

/// Represents a 5-tuple, or quintuple.
class Tuple5<T1, T2, T3, T4, T5> {
  /// Returns the first item of the tuple
  final T1 i1;

  /// Returns the second item of the tuple
  final T2 i2;

  /// Returns the third item of the tuple
  final T3 i3;

  /// Returns the fourth item of the tuple
  final T4 i4;

  /// Returns the fifth item of the tuple
  final T5 i5;

  /// Creates a new tuple value with the specified items.
  const Tuple5(this.i1, this.i2, this.i3, this.i4, this.i5);

  /// Create a new tuple value with the specified list [items].
  factory Tuple5.fromList(List items) {
    if (items.length != 5) {
      throw ArgumentError('items must have length 5');
    }

    return Tuple5<T1, T2, T3, T4, T5>(items[0] as T1, items[1] as T2,
        items[2] as T3, items[3] as T4, items[4] as T5);
  }

  /// Returns a tuple with the first item set to the specified value.
  Tuple5<T1, T2, T3, T4, T5> withItem1(T1 v) =>
      Tuple5<T1, T2, T3, T4, T5>(v, i2, i3, i4, i5);

  /// Returns a tuple with the second item set to the specified value.
  Tuple5<T1, T2, T3, T4, T5> withItem2(T2 v) =>
      Tuple5<T1, T2, T3, T4, T5>(i1, v, i3, i4, i5);

  /// Returns a tuple with the third item set to the specified value.
  Tuple5<T1, T2, T3, T4, T5> withItem3(T3 v) =>
      Tuple5<T1, T2, T3, T4, T5>(i1, i2, v, i4, i5);

  /// Returns a tuple with the fourth item set to the specified value.
  Tuple5<T1, T2, T3, T4, T5> withItem4(T4 v) =>
      Tuple5<T1, T2, T3, T4, T5>(i1, i2, i3, v, i5);

  /// Returns a tuple with the fifth item set to the specified value.
  Tuple5<T1, T2, T3, T4, T5> withItem5(T5 v) =>
      Tuple5<T1, T2, T3, T4, T5>(i1, i2, i3, i4, v);

  /// Creates a [List] containing the items of this [Tuple5].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([i1, i2, i3, i4, i5], growable: growable);

  @override
  String toString() => '[$i1, $i2, $i3, $i4, $i5]';

  @override
  bool operator ==(Object other) =>
      other is Tuple5 &&
          other.i1 == i1 &&
          other.i2 == i2 &&
          other.i3 == i3 &&
          other.i4 == i4 &&
          other.i5 == i5;

  @override
  int get hashCode => hashObjects([
    i1.hashCode,
    i2.hashCode,
    i3.hashCode,
    i4.hashCode,
    i5.hashCode
  ]);
}

/// Represents a 6-tuple, or sextuple.
class Tuple6<T1, T2, T3, T4, T5, T6> {
  /// Returns the first item of the tuple
  final T1 i1;

  /// Returns the second item of the tuple
  final T2 i2;

  /// Returns the third item of the tuple
  final T3 i3;

  /// Returns the fourth item of the tuple
  final T4 i4;

  /// Returns the fifth item of the tuple
  final T5 i5;

  /// Returns the sixth item of the tuple
  final T6 i6;

  /// Creates a new tuple value with the specified items.
  const Tuple6(
      this.i1, this.i2, this.i3, this.i4, this.i5, this.i6);

  /// Create a new tuple value with the specified list [items].
  factory Tuple6.fromList(List items) {
    if (items.length != 6) {
      throw ArgumentError('items must have length 6');
    }

    return Tuple6<T1, T2, T3, T4, T5, T6>(items[0] as T1, items[1] as T2,
        items[2] as T3, items[3] as T4, items[4] as T5, items[5] as T6);
  }

  /// Returns a tuple with the first item set to the specified value.
  Tuple6<T1, T2, T3, T4, T5, T6> withItem1(T1 v) =>
      Tuple6<T1, T2, T3, T4, T5, T6>(v, i2, i3, i4, i5, i6);

  /// Returns a tuple with the second item set to the specified value.
  Tuple6<T1, T2, T3, T4, T5, T6> withItem2(T2 v) =>
      Tuple6<T1, T2, T3, T4, T5, T6>(i1, v, i3, i4, i5, i6);

  /// Returns a tuple with the third item set to the specified value.
  Tuple6<T1, T2, T3, T4, T5, T6> withItem3(T3 v) =>
      Tuple6<T1, T2, T3, T4, T5, T6>(i1, i2, v, i4, i5, i6);

  /// Returns a tuple with the fourth item set to the specified value.
  Tuple6<T1, T2, T3, T4, T5, T6> withItem4(T4 v) =>
      Tuple6<T1, T2, T3, T4, T5, T6>(i1, i2, i3, v, i5, i6);

  /// Returns a tuple with the fifth item set to the specified value.
  Tuple6<T1, T2, T3, T4, T5, T6> withItem5(T5 v) =>
      Tuple6<T1, T2, T3, T4, T5, T6>(i1, i2, i3, i4, v, i6);

  /// Returns a tuple with the sixth item set to the specified value.
  Tuple6<T1, T2, T3, T4, T5, T6> withItem6(T6 v) =>
      Tuple6<T1, T2, T3, T4, T5, T6>(i1, i2, i3, i4, i5, v);

  /// Creates a [List] containing the items of this [Tuple5].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([i1, i2, i3, i4, i5, i6], growable: growable);

  @override
  String toString() => '[$i1, $i2, $i3, $i4, $i5, $i6]';

  @override
  bool operator ==(Object other) =>
      other is Tuple6 &&
          other.i1 == i1 &&
          other.i2 == i2 &&
          other.i3 == i3 &&
          other.i4 == i4 &&
          other.i5 == i5 &&
          other.i6 == i6;

  @override
  int get hashCode => hashObjects([
    i1.hashCode,
    i2.hashCode,
    i3.hashCode,
    i4.hashCode,
    i5.hashCode,
    i6.hashCode
  ]);
}

/// Represents a 7-tuple, or septuple.
class Tuple7<T1, T2, T3, T4, T5, T6, T7> {
  /// Returns the first item of the tuple
  final T1 i1;

  /// Returns the second item of the tuple
  final T2 i2;

  /// Returns the third item of the tuple
  final T3 i3;

  /// Returns the fourth item of the tuple
  final T4 i4;

  /// Returns the fifth item of the tuple
  final T5 i5;

  /// Returns the sixth item of the tuple
  final T6 i6;

  /// Returns the seventh item of the tuple
  final T7 i7;

  /// Creates a new tuple value with the specified items.
  const Tuple7(this.i1, this.i2, this.i3, this.i4, this.i5,
      this.i6, this.i7);

  /// Create a new tuple value with the specified list [items].
  factory Tuple7.fromList(List items) {
    if (items.length != 7) {
      throw ArgumentError('items must have length 7');
    }

    return Tuple7<T1, T2, T3, T4, T5, T6, T7>(
        items[0] as T1,
        items[1] as T2,
        items[2] as T3,
        items[3] as T4,
        items[4] as T5,
        items[5] as T6,
        items[6] as T7);
  }

  /// Returns a tuple with the first item set to the specified value.
  Tuple7<T1, T2, T3, T4, T5, T6, T7> withItem1(T1 v) =>
      Tuple7<T1, T2, T3, T4, T5, T6, T7>(
          v, i2, i3, i4, i5, i6, i7);

  /// Returns a tuple with the second item set to the specified value.
  Tuple7<T1, T2, T3, T4, T5, T6, T7> withItem2(T2 v) =>
      Tuple7<T1, T2, T3, T4, T5, T6, T7>(
          i1, v, i3, i4, i5, i6, i7);

  /// Returns a tuple with the third item set to the specified value.
  Tuple7<T1, T2, T3, T4, T5, T6, T7> withItem3(T3 v) =>
      Tuple7<T1, T2, T3, T4, T5, T6, T7>(
          i1, i2, v, i4, i5, i6, i7);

  /// Returns a tuple with the fourth item set to the specified value.
  Tuple7<T1, T2, T3, T4, T5, T6, T7> withItem4(T4 v) =>
      Tuple7<T1, T2, T3, T4, T5, T6, T7>(
          i1, i2, i3, v, i5, i6, i7);

  /// Returns a tuple with the fifth item set to the specified value.
  Tuple7<T1, T2, T3, T4, T5, T6, T7> withItem5(T5 v) =>
      Tuple7<T1, T2, T3, T4, T5, T6, T7>(
          i1, i2, i3, i4, v, i6, i7);

  /// Returns a tuple with the sixth item set to the specified value.
  Tuple7<T1, T2, T3, T4, T5, T6, T7> withItem6(T6 v) =>
      Tuple7<T1, T2, T3, T4, T5, T6, T7>(
          i1, i2, i3, i4, i5, v, i7);

  /// Returns a tuple with the seventh item set to the specified value.
  Tuple7<T1, T2, T3, T4, T5, T6, T7> withItem7(T7 v) =>
      Tuple7<T1, T2, T3, T4, T5, T6, T7>(
          i1, i2, i3, i4, i5, i6, v);

  /// Creates a [List] containing the items of this [Tuple5].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([i1, i2, i3, i4, i5, i6, i7],
          growable: growable);

  @override
  String toString() =>
      '[$i1, $i2, $i3, $i4, $i5, $i6, $i7]';

  @override
  bool operator ==(Object other) =>
      other is Tuple7 &&
          other.i1 == i1 &&
          other.i2 == i2 &&
          other.i3 == i3 &&
          other.i4 == i4 &&
          other.i5 == i5 &&
          other.i6 == i6 &&
          other.i7 == i7;

  @override
  int get hashCode => hashObjects([
    i1.hashCode,
    i2.hashCode,
    i3.hashCode,
    i4.hashCode,
    i5.hashCode,
    i6.hashCode,
    i7.hashCode
  ]);
}