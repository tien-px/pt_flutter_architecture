import 'package:pt_flutter_architecture/src/models/validation_result.dart';
import 'rule.dart';

/// A [Rule] subclass which validates if any of the list of [Rule]
/// passed to it are passing.
class AnyRule<T> extends Rule<T> {
  /// The list of [Rule] to be validated for.
  final List<Rule<T>> _ruleList;

  /// The default constructor
  AnyRule(this._ruleList, {String? validationMessage})
      : super(validationMessage);

  @override
  ValidationResult onValidate(T value) {
    ValidationResult? validResult;
    _ruleList.reversed.any((rule) {
      validResult = rule.validate(value);
      return validResult?.valid ?? false;
    });
    return validResult ?? ValidationResult.invalid(validationMessage ?? "not match any rules");
  }
}
