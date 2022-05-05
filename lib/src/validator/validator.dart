import 'package:pt_flutter_architecture/src/models/validation_result.dart';
import 'rules/rule.dart';

/// A class primarily designed to retrieve validation messages based on [Rule]s.
///
/// The [Validator] class takes a List of [Rule]. The value supplied to the
/// [Validator] is supplied to the [Rule]s in the order they were registered.
/// The error message of the first [Rule] that fails is returned back.
/// If all the [Rule]s pass, then null is returned.
class Validator<T> {
  Validator({
    required List<Rule<T>> rules,
  }) {
    rulesList = rules;
  }

  /// List of all registered rules.
  List<Rule<T>> rulesList = <Rule<T>>[];

  /// Registers a single [Rule] with the [Validator].
  Validator<T> add(Rule<T> rule) {
    rulesList.add(rule);
    return this;
  }

  /// Registers a List of [Rule] with the [Validator].
  Validator<T> addAll(List<Rule<T>> rule) {
    rulesList.addAll(rule);
    return this;
  }

  ValidationResult call(T value) => validateToResult(value);

  /// Validates and returns [ValidationResult] an error message(if any).
  ValidationResult validateToResult(T value) {
    ValidationResult? validationResult;
    rulesList.any((Rule<T> rule) {
      validationResult = rule.validate(value);
      return validationResult?.invalid ?? false;
    });
    return validationResult ?? ValidationResult.valid();
  }

  /// Validates and returns an error message(if any).
  String? validate(T? value) {
    ValidationResult validationResult = ValidationResult.valid();
    rulesList.any((Rule<T> rule) {
      validationResult = rule.validate(value!);
      return validationResult.invalid;
    });
    return validationResult.valid ? null : validationResult.message;
  }
}
