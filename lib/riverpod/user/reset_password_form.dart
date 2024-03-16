import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../validators/index.dart';

part 'reset_password_form.g.dart';

@Riverpod(keepAlive: true)
FormGroup resetPasswordForm(ResetPasswordFormRef ref) {
  return FormGroup(
    {
      'email_addr': FormControl(),
      'verification_code': FormControl(
        validators: [
          Validators.required,
          Validators.minLength(6),
          Validators.maxLength(6),
        ],
      ),
      'password': FormControl(
        validators: [
          Validators.required,
          Validators.minLength(8),
          ValidatorsExt.containsNumber,
          ValidatorsExt.containsUpper,
          ValidatorsExt.containsLower,
          ValidatorsExt.containsSpecialChar,
        ],
      ),
      'retype_password': FormControl(validators: [Validators.required]),
    },
    validators: [Validators.mustMatch('password', 'retype_password')],
  );
}
