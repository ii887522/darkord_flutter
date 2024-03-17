import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../helpers/reactive_forms_helper.dart';
import '../../riverpod/user/sign_up_form.dart';
import '../../validators/validation_message.dart';
import '../../widgets/password_field.dart';
import '../user/sign_up_button.dart';

class SignUpForm extends ConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final (keepAliveLink, formGroup) = ref.watch(signUpFormProvider);

    return ReactiveForm(
      formGroup: formGroup,
      child: Column(
        children: [
          ReactiveTextField(
            formControlName: 'username',
            showErrors: showErrors,
            validationMessages: {
              ValidationMessage.required: (error) {
                return localizations.usernameRequired;
              },
            },
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            style: DefaultTextStyle.of(context).style.copyWith(
                  color: Colors.grey[350],
                ),
            decoration: InputDecoration(
              filled: true,
              icon: Icon(Icons.badge, color: Colors.grey[350]),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              isDense: true,
              label: RichText(
                text: TextSpan(
                  text: localizations.username,
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
          const SizedBox(height: 32),
          ReactiveTextField(
            formControlName: 'about_me',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.multiline,
            style: DefaultTextStyle.of(context).style.copyWith(
                  color: Colors.grey[350],
                ),
            decoration: InputDecoration(
              filled: true,
              icon: Icon(Icons.description, color: Colors.grey[350]),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              isDense: true,
              label: Text(
                localizations.aboutMe,
                style: DefaultTextStyle.of(context).style.copyWith(
                      color: Colors.grey[350],
                    ),
              ),
              hintText: localizations.aboutMeHint,
              alignLabelWithHint: true,
            ),
            minLines: 4,
            maxLines: null,
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
          SignUpButton(keepAliveLink: keepAliveLink, formGroup: formGroup),
        ],
      ),
    );
  }
}
