import 'package:pt_flutter_architecture/src/models/validation_result.dart';
import 'rule.dart';

/// A [Rule] subclass validating if the input is one of the element in the [rejectionList].
class NotInRule<T> extends Rule<T> {
  final List<T> rejectionList;

  NotInRule(this.rejectionList, {String? validationMessage})
      : super(validationMessage);

  @override
  ValidationResult onValidate(T value) {
    return rejectionList.contains(value)
        ? ValidationResult.invalid(validationMessage ?? "in list of rejected values")
        : ValidationResult.valid();
  }
}
