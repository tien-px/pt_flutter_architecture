import 'package:pt_flutter_architecture/src/models/validation_result.dart';
import 'number_rule.dart';

/// A [Rule] subclass which validates if the value
/// passed is at most a specific number.
class MaxRule<T> extends NumberRule<T> {
  /// Value passed should be at most [maxValue]
  final num maxValue;

  /// The default constructor
  MaxRule(
    this.maxValue, {
    String? validationMessage,
  }) : super(validationMessage: validationMessage);

  @override
  ValidationResult onValidate(T value) {
    final result = super.onValidate(value);
    if (result.invalid) {
      return result;
    }

    var numValue = double.parse(value.toString());
    if (numValue > maxValue) {
      return ValidationResult.invalid(validationMessage ?? "should be lesser than $maxValue");
    }

    return ValidationResult.valid();
  }
}
