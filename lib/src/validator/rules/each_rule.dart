import 'package:pt_flutter_architecture/src/models/validation_result.dart';
import 'rule.dart';

/// A [Rule] subclass which runs validation on the list of [Rule]
/// and does not stop if any of them fail.
class EachRule<T> extends Rule<T> {
  /// The list of [Rule] to be validated for.
  final List<Rule<T>> _ruleList;

  /// A function which concatenates all the Validation Messages.
  final ValidationResult Function(List<ValidationResult>) concatenator;

  /// The default constructor
  EachRule(
    this._ruleList, {
    String? validationMessage,
    this.concatenator = joinWithNewLine,
  }) : super(validationMessage);

  static ValidationResult joinWithNewLine(
      List<ValidationResult> validationMessages) {
    return ValidationResult.invalid(validationMessages
        .where((result) {
          return result.invalid;
        })
        .map((e) => e.message)
        .join('\n'));
  }

  @override
  ValidationResult onValidate(T value) {
    var eachRulesValidationMessage = _ruleList
        .map((Rule<T> rule) {
          return rule.validate(value);
        })
        .where((ValidationResult result) => result.invalid)
        .toList();

    if (eachRulesValidationMessage.isEmpty) {
      return ValidationResult.valid();
    }

    return concatenator(eachRulesValidationMessage);
  }
}
