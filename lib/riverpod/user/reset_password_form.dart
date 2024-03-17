import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../validators/index.dart';

part 'reset_password_form.g.dart';

@riverpod
(KeepAliveLink, FormGroup) resetPasswordForm(ResetPasswordFormRef ref) {
  return (
    ref.keepAlive(),
    FormGroup(
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
    ),
  );
}
