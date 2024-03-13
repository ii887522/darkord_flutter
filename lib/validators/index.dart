import 'package:reactive_forms/reactive_forms.dart';

import 'trimmed_validator.dart';

extension ValidatorsExt on Validators {
  static Validator<dynamic> trimmed(Validator<dynamic> inner) {
    return TrimmedValidator(inner);
  }
}
