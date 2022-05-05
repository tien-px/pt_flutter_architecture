//ignore_for_file: close_sinks
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

extension RxViewModelValidation on RxViewModel {
  Stream<ValidationResult> validation<T>(Stream<T> inputTrigger,
      ValidationResult Function(T) validate, Stream<void> startTrigger) {
    return Rx.combineLatest2<T, void, T>(
        inputTrigger, startTrigger, (input, start) => input)
        .map((input) => validate(input))
        .asBroadcastStream();
  }

  Stream<bool> checkIfValid(List<Stream<ValidationResult>> streams) {
    return Rx.combineLatestList<ValidationResult>(streams)
        .map((validations) =>
    validations.where((validation) => validation.invalid).isEmpty)
        .startWith(false);
  }

  Stream<bool> assignAndCheckIfValid(
      Map<Stream<ValidationResult>, RxString> validations,
      DisposeBag bag) {
    validations.forEach((stream, output) {
      stream
          .map((validation) => validation.message)
          .assign(output)
          .disposedBy(bag);
    });
    return checkIfValid(validations.keys.toList());
  }
}