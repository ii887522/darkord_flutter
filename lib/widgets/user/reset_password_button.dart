import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../consts/user.dart';
import '../../helpers/index.dart';
import '../submit_button.dart';

class ResetPasswordButton extends StatefulWidget {
  final KeepAliveLink keepAliveLink;
  final FormGroup formGroup;

  const ResetPasswordButton({
    super.key,
    required this.keepAliveLink,
    required this.formGroup,
  });

  @override
  State<ResetPasswordButton> createState() => _ResetPasswordButtonState();
}

class _ResetPasswordButtonState extends State<ResetPasswordButton> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SubmitButton(
      icon: const Icon(Icons.restart_alt),
      label: Text(localizations.resetPassword),
      backgroundColor: Colors.orange,
      foregroundColor: Colors.black,
      isLoading: isLoading,
      onPressed: () async {
        final userPool = CognitoUserPool(
          cognitoUserPoolId,
          cognitoClientId,
        );

        final emailAddr = widget.formGroup.control('email_addr').value.trim();
        final user = CognitoUser(emailAddr, userPool);

        try {
          setState(() => isLoading = true);

          await user.confirmPassword(
            widget.formGroup.control('verification_code').value,
            widget.formGroup.control('password').value,
          );

          widget.keepAliveLink.close();
          if (!context.mounted) return;

          context.notify(
            content: Text(localizations.resetPasswordSuccess),
            backgroundColor: Colors.green,
          );

          context.pop();
        } catch (err) {
          if (!context.mounted) return;

          context.notify(
            content: Text(localizations.resetPasswordFailed),
            backgroundColor: Theme.of(context).colorScheme.error,
          );
        } finally {
          if (context.mounted) setState(() => isLoading = false);
        }
      },
    );
  }
}
