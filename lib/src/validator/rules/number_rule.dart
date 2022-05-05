import 'package:pt_flutter_architecture/src/models/validation_result.dart';

import 'rule.dart';

/// A [Rule] subclass which validates if the value passed is a number.
class NumberRule<T> extends Rule<T> {
  /// The default constructor
  NumberRule({String? validationMessage}) : super(validationMessage);

  @override
  ValidationResult onValidate(T value) {
    num? numValue;
    if (!(value is num)) {
      numValue = double.tryParse(value.toString());
    }
    if (numValue == null) {
      return ValidationResult.invalid(validationMessage ?? "not a number");
    }
    return ValidationResult.valid();
  }
}
