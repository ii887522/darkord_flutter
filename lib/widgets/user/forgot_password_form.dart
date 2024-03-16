import 'package:flutter/material.dart';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../consts/user.dart';
import '../../helpers/index.dart';
import '../../helpers/reactive_forms_helper.dart';
import '../../validators/index.dart';
import '../../widgets/submit_button.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ReactiveFormBuilder(
      form: () => FormGroup({
        'email_addr': FormControl(
          validators: [
            Validators.required,
            ValidatorsExt.trimmed(Validators.email),
          ],
        ),
      }),
      builder: (context, formGroup, child) {
        return Column(
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
              icon: const Icon(Icons.send),
              label: Text(localizations.requestResetPassword),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              onPressed: () async {
                final userPool = CognitoUserPool(
                  cognitoUserPoolId,
                  cognitoClientId,
                );

                final user = CognitoUser(
                  formGroup.control('email_addr').value,
                  userPool,
                );

                try {
                  await user.forgotPassword();
                } catch (err) {
                  if (!context.mounted) return;

                  context.notify(
                    content: Text(localizations.forgotPasswordFailed),
                    backgroundColor: Theme.of(context).colorScheme.error,
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
