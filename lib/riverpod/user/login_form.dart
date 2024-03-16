import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../validators/index.dart';

part 'login_form.g.dart';

@Riverpod(keepAlive: true)
FormGroup loginForm(LoginFormRef ref) {
  return FormGroup({
    'email_addr': FormControl(
      validators: [
        Validators.required,
        ValidatorsExt.trimmed(Validators.email),
      ],
    ),
    'password': FormControl(validators: [Validators.required]),
  });
}
