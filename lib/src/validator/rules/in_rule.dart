import 'package:pt_flutter_architecture/src/models/validation_result.dart';

import 'rule.dart';

/// A [Rule] subclass validating if the input is one of the element in the [acceptedList].
class InRule<T> extends Rule<T> {
  final List<T> acceptedList;

  InRule(this.acceptedList, {String? validationMessage})
      : super(validationMessage);

  @override
  ValidationResult onValidate(T value) {
    return acceptedList.contains(value)
        ? ValidationResult.valid()
        : ValidationResult.invalid(
            validationMessage ?? "is not in list of accepted values");
  }
}
