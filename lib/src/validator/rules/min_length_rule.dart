import 'package:pt_flutter_architecture/src/models/validation_result.dart';
import 'rule.dart';

/// A [Rule] subclass validating if the input length is more than [minLength].
class MinLengthRule<T extends dynamic> extends Rule<T> {
  final int minLength;

  MinLengthRule(this.minLength, {String? validationMessage})
      : assert(T == List || T == Map || T == String || T == dynamic),
        super(validationMessage);

  @override
  ValidationResult onValidate(T value) {
    if (value.length < minLength) {
      return ValidationResult.invalid(validationMessage ?? "length should be more than $minLength");
    }
    return ValidationResult.valid();
  }
}
