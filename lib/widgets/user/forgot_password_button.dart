import 'package:flutter/material.dart';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../consts/user.dart';
import '../../helpers/index.dart';
import '../submit_button.dart';

class ForgotPasswordButton extends StatefulWidget {
  final KeepAliveLink keepAliveLink;
  final FormGroup formGroup;

  const ForgotPasswordButton({
    super.key,
    required this.keepAliveLink,
    required this.formGroup,
  });

  @override
  State<ForgotPasswordButton> createState() => _ForgotPasswordButtonState();
}

class _ForgotPasswordButtonState extends State<ForgotPasswordButton> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SubmitButton(
      icon: const Icon(Icons.send),
      label: Text(localizations.requestResetPassword),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      isLoading: isLoading,
      onPressed: () async {
        final userPool = CognitoUserPool(
          cognitoUserPoolId,
          cognitoClientId,
        );

        final emailAddr = widget.formGroup.control('email_addr').value;
        final user = CognitoUser(emailAddr, userPool);

        try {
          setState(() => isLoading = true);
          await user.forgotPassword();
          widget.keepAliveLink.close();
          if (!context.mounted) return;

          context.notify(
            content: Text(localizations.forgotPasswordSuccess),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 10),
          );

          context.pushReplacement('/user/reset-password/$emailAddr');
        } catch (err) {
          if (!context.mounted) return;

          context.notify(
            content: Text(localizations.forgotPasswordFailed),
            backgroundColor: Theme.of(context).colorScheme.error,
          );
        } finally {
          if (context.mounted) setState(() => isLoading = false);
        }
      },
    );
  }
}
