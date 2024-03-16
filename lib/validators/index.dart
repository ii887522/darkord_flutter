import 'package:reactive_forms/reactive_forms.dart';

import 'trimmed_validator.dart';
import 'validation_message.dart';

extension ValidatorsExt on Validators {
  static Validator<dynamic> trimmed(Validator<dynamic> inner) {
    return TrimmedValidator(inner);
  }

  static Validator<dynamic> get containsNumber {
    return Validators.pattern(
      r'\d',
      validationMessage: ValidationMessageExt.containsNumber,
    );
  }

  static Validator<dynamic> get containsUpper {
    return Validators.pattern(
      r'[A-Z]',
      validationMessage: ValidationMessageExt.containsUpper,
    );
  }

  static Validator<dynamic> get containsLower {
    return Validators.pattern(
      r'[a-z]',
      validationMessage: ValidationMessageExt.containsLower,
    );
  }

  static Validator<dynamic> get containsSpecialChar {
    return Validators.pattern(
      r'\^|\$|\*|\.|\[|\]|\{|\}|\(|\)|\?|\-|"|!|@|#|%|&|/|\\|,|>|<|:|;|\||_|~|`|\+|=|\s'
      r"|'",
      validationMessage: ValidationMessageExt.containsSpecialChar,
    );
  }
}
