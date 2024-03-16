import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../validators/index.dart';

part 'forgot_password_form.g.dart';

@Riverpod(keepAlive: true)
FormGroup forgotPasswordForm(ForgotPasswordFormRef ref) {
  return FormGroup({
    'email_addr': FormControl(
      validators: [
        Validators.required,
        ValidatorsExt.trimmed(Validators.email),
      ],
    ),
  });
}
