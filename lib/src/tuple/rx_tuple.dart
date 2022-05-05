/// # RxTuple data structure
///
/// - [RxTuple2], [RxTuple3]...
///
/// ## Usage example
///
/// ```dart
/// const t = const RxTuple2<String, int>('a', 10);
///
/// print(t.i1); // prints 'a'
/// print(t.i2); // prints '10'
/// ```
///
/// ```dart
/// const t1 = const RxTuple2<String, int>('a', 10);
/// final t2 = t1.withItem1('c');
/// // t2 is a new [RxTuple2] object with i1 is 'c' and i2 is 10.
/// ```
library tuple;

import 'package:quiver/core.dart';

/// Represents a tuple.
class RxTuple<T, T1> {
  /// Returns the original event
  final T o;

  /// Returns the first item of the tuple
  final T1 i;

  /// Creates a new tuple value with the specified items.
  const RxTuple(this.o, this.i);

  /// Create a new tuple value with the specified list [items].
  factory RxTuple.fromList(List items) {
    if (items.length != 2) {
      throw ArgumentError('items must have length 2');
    }

    return RxTuple<T, T1>(items[0] as T, items[1] as T1);
  }

  /// Returns a tuple with the first item set to the specified value.
  RxTuple<T, T1> withItem1(T1 v) => RxTuple<T, T1>(o, v);

  /// Creates a [List] containing the items of this [RxTuple2].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([o, o, i], growable: growable);

  @override
  String toString() => '[$o, $i]';

  @override
  bool operator ==(Object other) =>
      other is RxTuple && other.o == o && other.i == i;

  @override
  int get hashCode => hash2(o.hashCode, i.hashCode);
}

/// Represents a 2-tuple, or pair.
class RxTuple2<T, T1, T2> {
  /// Returns the original event
  final T o;

  /// Returns the first item of the tuple
  final T1 i1;

  /// Returns the second item of the tuple
  final T2 i2;

  /// Creates a new tuple value with the specified items.
  const RxTuple2(this.o, this.i1, this.i2);

  /// Create a new tuple value with the specified list [items].
  factory RxTuple2.fromList(List items) {
    if (items.length != 3) {
      throw ArgumentError('items must have length 2');
    }

    return RxTuple2<T, T1, T2>(items[0] as T, items[1] as T1, items[2] as T2);
  }

  /// Returns a tuple with the first item set to the specified value.
  RxTuple2<T, T1, T2> withItem1(T1 v) => RxTuple2<T, T1, T2>(o, v, i2);

  /// Returns a tuple with the second item set to the specified value.
  RxTuple2<T, T1, T2> withItem2(T2 v) => RxTuple2<T, T1, T2>(o, i1, v);

  /// Creates a [List] containing the items of this [RxTuple2].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([o, o, i1, i2], growable: growable);

  @override
  String toString() => '[$o, $i1, $i2]';

  @override
  bool operator ==(Object other) =>
      other is RxTuple2 &&
      other.o == o &&
      other.o == o &&
      other.i1 == i1 &&
      other.i2 == i2;

  @override
  int get hashCode => hash3(o.hashCode, i1.hashCode, i2.hashCode);
}

/// Represents a 3-tuple, or triple.
class RxTuple3<T, T1, T2, T3> {
  /// Returns the original event
  final T o;

  /// Returns the first item of the tuple
  final T1 i1;

  /// Returns the second item of the tuple
  final T2 i2;

  /// Returns the third item of the tuple
  final T3 i3;

  /// Creates a new tuple value with the specified items.
  const RxTuple3(this.o, this.i1, this.i2, this.i3);

  /// Create a new tuple value with the specified list [items].
  factory RxTuple3.fromList(List items) {
    if (items.length != 4) {
      throw ArgumentError('items must have length 3');
    }

    return RxTuple3<T, T1, T2, T3>(
        items[0] as T, items[1] as T1, items[2] as T2, items[3] as T3);
  }

  /// Returns a tuple with the first item set to the specified value.
  RxTuple3<T, T1, T2, T3> withItem1(T1 v) =>
      RxTuple3<T, T1, T2, T3>(o, v, i2, i3);

  /// Returns a tuple with the second item set to the specified value.
  RxTuple3<T, T1, T2, T3> withItem2(T2 v) =>
      RxTuple3<T, T1, T2, T3>(o, i1, v, i3);

  /// Returns a tuple with the third item set to the specified value.
  RxTuple3<T, T1, T2, T3> withItem3(T3 v) =>
      RxTuple3<T, T1, T2, T3>(o, i1, i2, v);

  /// Creates a [List] containing the items of this [RxTuple3].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([o, i1, i2, i3], growable: growable);

  @override
  String toString() => '[$o, $i1, $i2, $i3]';

  @override
  bool operator ==(Object other) =>
      other is RxTuple3 &&
      other.o == o &&
      other.i1 == i1 &&
      other.i2 == i2 &&
      other.i3 == i3;

  @override
  int get hashCode => hash4(o.hashCode, i1.hashCode, i2.hashCode, i3.hashCode);
}

/// Represents a 4-tuple, or quadruple.
class RxTuple4<T, T1, T2, T3, T4> {
  /// Returns the original event
  final T o;

  /// Returns the first item of the tuple
  final T1 i1;

  /// Returns the second item of the tuple
  final T2 i2;

  /// Returns the third item of the tuple
  final T3 i3;

  /// Returns the fourth item of the tuple
  final T4 i4;

  /// Creates a new tuple value with the specified items.
  const RxTuple4(this.o, this.i1, this.i2, this.i3, this.i4);

  /// Create a new tuple value with the specified list [items].
  factory RxTuple4.fromList(List items) {
    if (items.length != 5) {
      throw ArgumentError('items must have length 4');
    }

    return RxTuple4<T, T1, T2, T3, T4>(items[0] as T, items[1] as T1,
        items[2] as T2, items[3] as T3, items[4] as T4);
  }

  /// Returns a tuple with the first item set to the specified value.
  RxTuple4<T, T1, T2, T3, T4> withItem1(T1 v) =>
      RxTuple4<T, T1, T2, T3, T4>(o, v, i2, i3, i4);

  /// Returns a tuple with the second item set to the specified value.
  RxTuple4<T, T1, T2, T3, T4> withItem2(T2 v) =>
      RxTuple4<T, T1, T2, T3, T4>(o, i1, v, i3, i4);

  /// Returns a tuple with the third item set to the specified value.
  RxTuple4<T, T1, T2, T3, T4> withItem3(T3 v) =>
      RxTuple4<T, T1, T2, T3, T4>(o, i1, i2, v, i4);

  /// Returns a tuple with the fourth item set to the specified value.
  RxTuple4<T, T1, T2, T3, T4> withItem4(T4 v) =>
      RxTuple4<T, T1, T2, T3, T4>(o, i1, i2, i3, v);

  /// Creates a [List] containing the items of this [RxTuple4].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([o, i1, i2, i3, i4], growable: growable);

  @override
  String toString() => '[$o, $i1, $i2, $i3, $i4]';

  @override
  bool operator ==(Object other) =>
      other is RxTuple4 &&
      other.o == o &&
      other.i1 == i1 &&
      other.i2 == i2 &&
      other.i3 == i3 &&
      other.i4 == i4;

  @override
  int get hashCode => hashObjects(
      [o.hashCode, i1.hashCode, i2.hashCode, i3.hashCode, i4.hashCode]);
}

/// Represents a 5-tuple, or quintuple.
class RxTuple5<T, T1, T2, T3, T4, T5> {
  /// Returns the original event
  final T o;

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
  const RxTuple5(this.o, this.i1, this.i2, this.i3, this.i4, this.i5);

  /// Create a new tuple value with the specified list [items].
  factory RxTuple5.fromList(List items) {
    if (items.length != 6) {
      throw ArgumentError('items must have length 5');
    }

    return RxTuple5<T, T1, T2, T3, T4, T5>(items[0] as T, items[1] as T1,
        items[2] as T2, items[3] as T3, items[4] as T4, items[5] as T5);
  }

  /// Returns a tuple with the first item set to the specified value.
  RxTuple5<T, T1, T2, T3, T4, T5> withItem1(T1 v) =>
      RxTuple5<T, T1, T2, T3, T4, T5>(o, v, i2, i3, i4, i5);

  /// Returns a tuple with the second item set to the specified value.
  RxTuple5<T, T1, T2, T3, T4, T5> withItem2(T2 v) =>
      RxTuple5<T, T1, T2, T3, T4, T5>(o, i1, v, i3, i4, i5);

  /// Returns a tuple with the third item set to the specified value.
  RxTuple5<T, T1, T2, T3, T4, T5> withItem3(T3 v) =>
      RxTuple5<T, T1, T2, T3, T4, T5>(o, i1, i2, v, i4, i5);

  /// Returns a tuple with the fourth item set to the specified value.
  RxTuple5<T, T1, T2, T3, T4, T5> withItem4(T4 v) =>
      RxTuple5<T, T1, T2, T3, T4, T5>(o, i1, i2, i3, v, i5);

  /// Returns a tuple with the fifth item set to the specified value.
  RxTuple5<T, T1, T2, T3, T4, T5> withItem5(T5 v) =>
      RxTuple5<T, T1, T2, T3, T4, T5>(o, i1, i2, i3, i4, v);

  /// Creates a [List] containing the items of this [RxTuple5].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([o, i1, i2, i3, i4, i5], growable: growable);

  @override
  String toString() => '[$o, $i1, $i2, $i3, $i4, $i5]';

  @override
  bool operator ==(Object other) =>
      other is RxTuple5 &&
      other.o == o &&
      other.i1 == i1 &&
      other.i2 == i2 &&
      other.i3 == i3 &&
      other.i4 == i4 &&
      other.i5 == i5;

  @override
  int get hashCode => hashObjects([
        o.hashCode,
        i1.hashCode,
        i2.hashCode,
        i3.hashCode,
        i4.hashCode,
        i5.hashCode
      ]);
}

/// Represents a 6-tuple, or sextuple.
class RxTuple6<T, T1, T2, T3, T4, T5, T6> {
  /// Returns the original event
  final T o;

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
  const RxTuple6(this.o, this.i1, this.i2, this.i3, this.i4, this.i5, this.i6);

  /// Create a new tuple value with the specified list [items].
  factory RxTuple6.fromList(List items) {
    if (items.length != 7) {
      throw ArgumentError('items must have length 6');
    }

    return RxTuple6<T, T1, T2, T3, T4, T5, T6>(
        items[0] as T,
        items[1] as T1,
        items[2] as T2,
        items[3] as T3,
        items[4] as T4,
        items[5] as T5,
        items[6] as T6);
  }

  /// Returns a tuple with the first item set to the specified value.
  RxTuple6<T, T1, T2, T3, T4, T5, T6> withItem1(T1 v) =>
      RxTuple6<T, T1, T2, T3, T4, T5, T6>(o, v, i2, i3, i4, i5, i6);

  /// Returns a tuple with the second item set to the specified value.
  RxTuple6<T, T1, T2, T3, T4, T5, T6> withItem2(T2 v) =>
      RxTuple6<T, T1, T2, T3, T4, T5, T6>(o, i1, v, i3, i4, i5, i6);

  /// Returns a tuple with the third item set to the specified value.
  RxTuple6<T, T1, T2, T3, T4, T5, T6> withItem3(T3 v) =>
      RxTuple6<T, T1, T2, T3, T4, T5, T6>(o, i1, i2, v, i4, i5, i6);

  /// Returns a tuple with the fourth item set to the specified value.
  RxTuple6<T, T1, T2, T3, T4, T5, T6> withItem4(T4 v) =>
      RxTuple6<T, T1, T2, T3, T4, T5, T6>(o, i1, i2, i3, v, i5, i6);

  /// Returns a tuple with the fifth item set to the specified value.
  RxTuple6<T, T1, T2, T3, T4, T5, T6> withItem5(T5 v) =>
      RxTuple6<T, T1, T2, T3, T4, T5, T6>(o, i1, i2, i3, i4, v, i6);

  /// Returns a tuple with the sixth item set to the specified value.
  RxTuple6<T, T1, T2, T3, T4, T5, T6> withItem6(T6 v) =>
      RxTuple6<T, T1, T2, T3, T4, T5, T6>(o, i1, i2, i3, i4, i5, v);

  /// Creates a [List] containing the items of this [RxTuple5].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([o, i1, i2, i3, i4, i5, i6], growable: growable);

  @override
  String toString() => '[$o, $i1, $i2, $i3, $i4, $i5, $i6]';

  @override
  bool operator ==(Object other) =>
      other is RxTuple6 &&
      other.o == o &&
      other.i1 == i1 &&
      other.i2 == i2 &&
      other.i3 == i3 &&
      other.i4 == i4 &&
      other.i5 == i5 &&
      other.i6 == i6;

  @override
  int get hashCode => hashObjects([
        o.hashCode,
        i1.hashCode,
        i2.hashCode,
        i3.hashCode,
        i4.hashCode,
        i5.hashCode,
        i6.hashCode
      ]);
}

/// Represents a 7-tuple, or septuple.
class RxTuple7<T, T1, T2, T3, T4, T5, T6, T7> {
  /// Returns the original event
  final T o;

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
  const RxTuple7(
      this.o, this.i1, this.i2, this.i3, this.i4, this.i5, this.i6, this.i7);

  /// Create a new tuple value with the specified list [items].
  factory RxTuple7.fromList(List items) {
    if (items.length != 8) {
      throw ArgumentError('items must have length 7');
    }

    return RxTuple7<T, T1, T2, T3, T4, T5, T6, T7>(
        items[0] as T,
        items[1] as T1,
        items[2] as T2,
        items[3] as T3,
        items[4] as T4,
        items[5] as T5,
        items[6] as T6,
        items[7] as T7);
  }

  /// Returns a tuple with the first item set to the specified value.
  RxTuple7<T, T1, T2, T3, T4, T5, T6, T7> withItem1(T1 v) =>
      RxTuple7<T, T1, T2, T3, T4, T5, T6, T7>(o, v, i2, i3, i4, i5, i6, i7);

  /// Returns a tuple with the second item set to the specified value.
  RxTuple7<T, T1, T2, T3, T4, T5, T6, T7> withItem2(T2 v) =>
      RxTuple7<T, T1, T2, T3, T4, T5, T6, T7>(o, i1, v, i3, i4, i5, i6, i7);

  /// Returns a tuple with the third item set to the specified value.
  RxTuple7<T, T1, T2, T3, T4, T5, T6, T7> withItem3(T3 v) =>
      RxTuple7<T, T1, T2, T3, T4, T5, T6, T7>(o, i1, i2, v, i4, i5, i6, i7);

  /// Returns a tuple with the fourth item set to the specified value.
  RxTuple7<T, T1, T2, T3, T4, T5, T6, T7> withItem4(T4 v) =>
      RxTuple7<T, T1, T2, T3, T4, T5, T6, T7>(o, i1, i2, i3, v, i5, i6, i7);

  /// Returns a tuple with the fifth item set to the specified value.
  RxTuple7<T, T1, T2, T3, T4, T5, T6, T7> withItem5(T5 v) =>
      RxTuple7<T, T1, T2, T3, T4, T5, T6, T7>(o, i1, i2, i3, i4, v, i6, i7);

  /// Returns a tuple with the sixth item set to the specified value.
  RxTuple7<T, T1, T2, T3, T4, T5, T6, T7> withItem6(T6 v) =>
      RxTuple7<T, T1, T2, T3, T4, T5, T6, T7>(o, i1, i2, i3, i4, i5, v, i7);

  /// Returns a tuple with the seventh item set to the specified value.
  RxTuple7<T, T1, T2, T3, T4, T5, T6, T7> withItem7(T7 v) =>
      RxTuple7<T, T1, T2, T3, T4, T5, T6, T7>(o, i1, i2, i3, i4, i5, i6, v);

  /// Creates a [List] containing the items of this [RxTuple5].
  ///
  /// The elements are in item order. The list is variable-length
  /// if [growable] is true.
  List toList({bool growable = false}) =>
      List.from([o, i1, i2, i3, i4, i5, i6, i7], growable: growable);

  @override
  String toString() => '[$o, $i1, $i2, $i3, $i4, $i5, $i6, $i7]';

  @override
  bool operator ==(Object other) =>
      other is RxTuple7 &&
      other.o == o &&
      other.i1 == i1 &&
      other.i2 == i2 &&
      other.i3 == i3 &&
      other.i4 == i4 &&
      other.i5 == i5 &&
      other.i6 == i6 &&
      other.i7 == i7;

  @override
  int get hashCode => hashObjects([
        o.hashCode,
        i1.hashCode,
        i2.hashCode,
        i3.hashCode,
        i4.hashCode,
        i5.hashCode,
        i6.hashCode,
        i7.hashCode
      ]);
}
