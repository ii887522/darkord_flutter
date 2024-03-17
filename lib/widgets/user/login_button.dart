import 'package:flutter/material.dart';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../consts/user.dart';
import '../../helpers/index.dart';
import '../submit_button.dart';

class LoginButton extends StatefulWidget {
  final KeepAliveLink keepAliveLink;
  final FormGroup formGroup;

  const LoginButton({
    super.key,
    required this.keepAliveLink,
    required this.formGroup,
  });

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SubmitButton(
      icon: const Icon(Icons.login),
      label: Text(localizations.login),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      isLoading: isLoading,
      onPressed: () async {
        final userPool = CognitoUserPool(cognitoUserPoolId, cognitoClientId);
        final emailAddr = widget.formGroup.control('email_addr').value.trim();
        final user = CognitoUser(emailAddr, userPool);

        try {
          setState(() => isLoading = true);

          final resp = await user.authenticateUser(
            AuthenticationDetails(
              username: emailAddr,
              password: widget.formGroup.control('password').value,
            ),
          );

          widget.keepAliveLink.close();
          if (!context.mounted) return;

          // TODO: Navigate to direct message list page
          context.pushReplacement('/user/direct-msgs');
        } on CognitoUserNewPasswordRequiredException catch (err) {
          // TODO: handle New Password challenge
          debugPrint('handle New Password challenge');
        } on CognitoUserMfaRequiredException catch (err) {
          // TODO: handle SMS_MFA challenge
          debugPrint('handle SMS_MFA challenge');
        } on CognitoUserSelectMfaTypeException catch (err) {
          // TODO: handle SELECT_MFA_TYPE challenge
          debugPrint('handle SELECT_MFA_TYPE challenge');
        } on CognitoUserMfaSetupException catch (err) {
          final resp = await user.associateSoftwareToken();
          // user.verifySoftwareToken(totpCode: totpCode)
        } on CognitoUserTotpRequiredException catch (err) {
          // TODO: handle SOFTWARE_TOKEN_MFA challenge
          debugPrint('handle SOFTWARE_TOKEN_MFA challenge');
        } on CognitoUserCustomChallengeException catch (err) {
          // TODO: handle CUSTOM_CHALLENGE challenge
          debugPrint('handle CUSTOM_CHALLENGE challenge');
        } on CognitoUserConfirmationNecessaryException catch (err) {
          // TODO: handle User Confirmation Necessary
          debugPrint('handle User Confirmation Necessary');
        } catch (err) {
          if (!context.mounted) return;

          context.notify(
            content: Text(localizations.loginWrongCredentials),
            backgroundColor: Theme.of(context).colorScheme.error,
          );
        } finally {
          if (context.mounted) setState(() => isLoading = false);
        }

        // debugPrint(
        //   'sessionAccessToken: ${session?.getAccessToken().getJwtToken()}',
        // );
      },
    );
  }
}
