import 'dart:io';

import 'package:flutter/material.dart';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../consts/user.dart';
import '../../helpers/reactive_forms_helper.dart';
import '../../validators/index.dart';
import '../../widgets/password_field.dart';
import '../../widgets/submit_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ReactiveFormBuilder(
      form: () => FormGroup(
        {
          'username': FormControl(validators: [Validators.required]),
          'email_addr': FormControl(
            validators: [
              Validators.required,
              ValidatorsExt.trimmed(Validators.email),
            ],
          ),
          'password': FormControl(validators: [Validators.required]),
          'retype_password': FormControl(validators: [Validators.required]),
          'about_me': FormControl(),
        },
        validators: [Validators.mustMatch('password', 'retype_password')],
      ),
      builder: (context, formGroup, child) {
        return Column(
          children: [
            ReactiveTextField(
              formControlName: 'username',
              showErrors: showErrors,
              validationMessages: {
                ValidationMessage.required: (error) {
                  return localizations.usernameRequired;
                },
              },
              autofocus: true,
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
            SubmitButton(
              icon: const Icon(Icons.app_registration),
              label: Text(localizations.signUp),
              backgroundColor: Colors.green,
              foregroundColor: Colors.black,
              onPressed: () async {
                final userPool = CognitoUserPool(
                  cognitoUserPoolId,
                  cognitoClientId,
                );

                try {
                  await userPool.signUp(
                    formGroup.control('email_addr').value.trim(),
                    formGroup.control('password').value,
                    userAttributes: [
                      AttributeArg(
                        name: 'preferred_username',
                        value: formGroup.control('username').value.trim(),
                      ),
                      AttributeArg(
                        name: 'email',
                        value: formGroup.control('email_addr').value.trim(),
                      ),

                      // Reserved for future
                      const AttributeArg(name: 'zoneinfo', value: ''),

                      AttributeArg(
                        name: 'locale',
                        value: Platform.localeName.replaceFirst('_', '-'),
                      ),
                      AttributeArg(
                        name: 'updated_at',
                        value: DateTime.now().millisecondsSinceEpoch.toString(),
                      ),
                    ],
                  );

                  if (!context.mounted) return;
                  context.pushReplacement('/user/login');
                } catch (err) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(localizations.signUpFailed),
                      action: SnackBarAction(
                        label: localizations.close,
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                      backgroundColor: Theme.of(context).colorScheme.error,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
