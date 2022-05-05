import 'package:pt_flutter_architecture/src/models/validation_result.dart';
import 'rule.dart';

/// A [Rule] subclass validating the input matches a [regex].
class RegexRule extends Rule<String> {
  RegexRule(this.regex, {String? validationMessage}) : super(validationMessage);

  final String regex;

  @override
  ValidationResult onValidate(String value) {
    var regExp = RegExp(regex);
    if (!regExp.hasMatch(value)) {
      return ValidationResult.invalid(validationMessage ?? "not a valid pattern");
    }
    return ValidationResult.valid();
  }
}
