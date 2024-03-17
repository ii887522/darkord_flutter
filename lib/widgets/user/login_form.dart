import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../helpers/reactive_forms_helper.dart';
import '../../riverpod/user/login_form.dart';
import '../../widgets/password_field.dart';
import '../../widgets/user/login_button.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final (keepAliveLink, formGroup) = ref.watch(loginFormProvider);

    return ReactiveForm(
      formGroup: formGroup,
      child: Column(
        children: [
          ReactiveTextField(
            formControlName: 'email_addr',
            showErrors: showErrors,
            validationMessages: {
              ValidationMessage.required: (error) {
                return localizations.emailAddrRequired;
              },
              ValidationMessage.email: (error) {
                return localizations.emailAddrInvalid;
              },
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            style: DefaultTextStyle.of(context).style.copyWith(
                  color: Colors.grey[350],
                ),
            decoration: InputDecoration(
              filled: true,
              icon: Icon(Icons.mail, color: Colors.grey[350]),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              isDense: true,
              label: RichText(
                text: TextSpan(
                  text: localizations.emailAddr,
                  style: DefaultTextStyle.of(context).style.copyWith(
                        color: Colors.grey[350],
                      ),
                  children: [
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          PasswordField(
            formControlName: 'password',
            validationMessages: {
              ValidationMessage.required: (error) {
                return localizations.passwordRequired;
              },
            },
            label: RichText(
              text: TextSpan(
                text: localizations.password,
                style: DefaultTextStyle.of(context).style.copyWith(
                      color: Colors.grey[350],
                    ),
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero,
                ),
                onPressed: () => context.push('/user/forgot-password'),
                child: Text(
                  localizations.forgotPasswordLink,
                  style: DefaultTextStyle.of(context).style.copyWith(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.error,
                        decorationColor: Theme.of(context).colorScheme.error,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 64),
          LoginButton(keepAliveLink: keepAliveLink, formGroup: formGroup),
        ],
      ),
    );
  }
}
