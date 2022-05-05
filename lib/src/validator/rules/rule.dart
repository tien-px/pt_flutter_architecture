import 'package:meta/meta.dart';
import 'package:pt_flutter_architecture/src/models/validation_result.dart';
import 'package:pt_flutter_architecture/src/validator/validator.dart';

/// An abstract class designed to use with [Validator].
///
/// All the rules must extend this class as it specifies the blueprint
/// on how the [Validator] is expecting the [Rule] classes to be.
abstract class Rule<T> {
  /// The default constructor, taking custom [validationMessage].
  Rule(this.validationMessage);

  /// A custom validation message to be used with the rule.
  ///
  /// This can be passed to the default constructor if the user wants to
  /// show a custom validation message over the default ones for the rule.
  final String? validationMessage;

  /// Returns validation message if validation fails.
  ValidationResult validate(T value) {
    return onValidate(value);
  }

  /// Returns the validation message by the child class extending [Rule].
  ///
  /// Override it in the child class to define the validation logic for it.
  @protected
  ValidationResult onValidate(T value);
}
