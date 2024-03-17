import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../validators/index.dart';

part 'sign_up_form.g.dart';

@riverpod
(KeepAliveLink, FormGroup) signUpForm(SignUpFormRef ref) {
  return (
    ref.keepAlive(),
    FormGroup(
      {
        'username': FormControl(validators: [Validators.required]),
        'email_addr': FormControl(
          validators: [
            Validators.required,
            ValidatorsExt.trimmed(Validators.email),
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
        'about_me': FormControl(),
      },
      validators: [Validators.mustMatch('password', 'retype_password')],
    ),
  );
}
