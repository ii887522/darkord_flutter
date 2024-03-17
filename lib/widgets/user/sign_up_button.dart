import 'dart:io';

import 'package:flutter/material.dart';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../consts/user.dart';
import '../../helpers/index.dart';
import '../submit_button.dart';

class SignUpButton extends StatefulWidget {
  final KeepAliveLink keepAliveLink;
  final FormGroup formGroup;

  const SignUpButton({
    super.key,
    required this.keepAliveLink,
    required this.formGroup,
  });

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SubmitButton(
      icon: const Icon(Icons.app_registration),
      label: Text(localizations.signUp),
      backgroundColor: Colors.green,
      foregroundColor: Colors.black,
      isLoading: isLoading,
      onPressed: () async {
        final userPool = CognitoUserPool(
          cognitoUserPoolId,
          cognitoClientId,
        );

        try {
          setState(() => isLoading = true);

          await userPool.signUp(
            widget.formGroup.control('email_addr').value.trim(),
            widget.formGroup.control('password').value,
            userAttributes: [
              AttributeArg(
                name: 'preferred_username',
                value: widget.formGroup.control('username').value.trim(),
              ),
              AttributeArg(
                name: 'email',
                value: widget.formGroup.control('email_addr').value.trim(),
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

          widget.keepAliveLink.close();
          if (!context.mounted) return;

          context.notify(
            content: Text(localizations.signUpSuccess),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 10),
          );

          context.pop();
        } catch (err) {
          if (!context.mounted) return;

          context.notify(
            content: Text(localizations.signUpFailed),
            backgroundColor: Theme.of(context).colorScheme.error,
          );
        } finally {
          if (context.mounted) setState(() => isLoading = false);
        }
      },
    );
  }
}
