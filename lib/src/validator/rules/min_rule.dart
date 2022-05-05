import 'package:pt_flutter_architecture/src/models/validation_result.dart';

import 'number_rule.dart';

/// A [Rule] subclass which validates if the value
/// passed is at least a specific number.
class MinRule<T> extends NumberRule<T> {
  /// Value passed should be at least [minValue]
  final num minValue;

  MinRule(
    this.minValue, {
    String? validationMessage,
  }) : super(validationMessage: validationMessage);

  @override
  ValidationResult onValidate(T value) {
    final result = super.onValidate(value);
    if (result.invalid) {
      return result;
    }
    var numValue = double.parse(value.toString());
    if (numValue < minValue) {
      return ValidationResult.invalid(validationMessage ?? "should be greater than $minValue");
    }
    return ValidationResult.valid();
  }
}
