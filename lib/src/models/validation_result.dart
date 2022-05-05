enum ValidationStatus { valid, invalid }

class ValidationResult {
  ValidationStatus status;
  String message;

  factory ValidationResult.valid() {
    return ValidationResult(ValidationStatus.valid);
  }

  factory ValidationResult.invalid(String message) {
    return ValidationResult(ValidationStatus.invalid, message);
  }

  bool get invalid => status == ValidationStatus.invalid;
  bool get valid => status == ValidationStatus.valid;

  ValidationResult(this.status, [this.message = ""]);

  @override
  String toString() {
    return '[ValidationResult] isValid: $valid, message: "$message"';
  }
}