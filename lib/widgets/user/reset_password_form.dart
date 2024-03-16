import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../riverpod/user/reset_password_form.dart';
import '../../validators/validation_message.dart';
import '../../widgets/code_field.dart';
import '../password_field.dart';

import 'reset_password_button.dart';

class ResetPasswordForm extends ConsumerWidget {
  final String emailAddr;

  const ResetPasswordForm({super.key, required this.emailAddr});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final formGroup = ref.watch(resetPasswordFormProvider);
    formGroup.control('email_addr').value = emailAddr;

    return ReactiveForm(
      formGroup: formGroup,
      child: Column(
        children: [
          ReactiveTextField(
            formControlName: 'email_addr',
            readOnly: true,
            canRequestFocus: false,
            enableInteractiveSelection: false,
            style: DefaultTextStyle.of(context).style.copyWith(
                  color: Colors.grey[350]?.withOpacity(0.75),
                ),
            decoration: InputDecoration(
              filled: true,
              icon: Icon(Icons.mail, color: Colors.grey[350]),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              isDense: true,
              label: Text(
                localizations.emailAddr,
                style: DefaultTextStyle.of(context).style.copyWith(
                      color: Colors.grey[350],
                    ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          CodeField(
            formGroup: formGroup,
            formControlName: 'verification_code',
            validationMessages: {
              ValidationMessage.required: (error) {
                return localizations.verificationCodeRequired;
              },
              ValidationMessage.minLength: (error) {
                return localizations.verificationCodeLength;
              },
              ValidationMessage.maxLength: (error) {
                return localizations.verificationCodeLength;
              }
            },
            label: Row(
              children: [
                const SizedBox(width: 8),
                Icon(Icons.vpn_key, color: Colors.grey[350]),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    text: localizations.verificationCode,
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
              ],
            ),
          ),
          const SizedBox(height: 32),
          PasswordField(
            formControlName: 'password',
            validationMessages: {
              ValidationMessage.required: (error) {
                return localizations.passwordRequired;
              },
              ValidationMessage.minLength: (error) {
                return localizations.passwordMinLength;
              },
              ValidationMessageExt.containsNumber: (error) {
                return localizations.passwordContainsNumber;
              },
              ValidationMessageExt.containsUpper: (error) {
                return localizations.passwordContainsUpper;
              },
              ValidationMessageExt.containsLower: (error) {
                return localizations.passwordContainsLower;
              },
              ValidationMessageExt.containsSpecialChar: (error) {
                return localizations.passwordContainsSpecialChar;
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
          const SizedBox(height: 32),
          PasswordField(
            formControlName: 'retype_password',
            validationMessages: {
              ValidationMessage.required: (error) {
                return localizations.retypePasswordRequired;
              },
              ValidationMessage.mustMatch: (error) {
                return localizations.passwordMustSame;
              },
            },
            label: RichText(
              text: TextSpan(
                text: localizations.retypePassword,
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
                onPressed: () => context.pop(),
                child: Text(
                  localizations.backToLogin,
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
          ResetPasswordButton(formGroup: formGroup),
        ],
      ),
    );
  }
}
