import 'package:pt_flutter_architecture/src/models/validation_result.dart';
import 'rule.dart';

/// A [Rule] subclass validating if the length of input is less than [maxLength].
class MaxLengthRule<T extends dynamic> extends Rule<T> {
  final int maxLength;

  MaxLengthRule(this.maxLength, {String? validationMessage})
      : assert(T == List || T == Map || T == String || T == dynamic),
        super(validationMessage);

  @override
  ValidationResult onValidate(T value) {
    if (value.length <= maxLength) {
      return ValidationResult.valid();
    }
    return ValidationResult.invalid(validationMessage ?? "length should be less than $maxLength");
  }
}
