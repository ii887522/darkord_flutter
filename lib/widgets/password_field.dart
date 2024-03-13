import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../helpers/reactive_forms_helper.dart';

class PasswordField extends StatefulWidget {
  final String formControlName;
  final Map<String, String Function(Object)>? validationMessages;
  final Widget? label;

  const PasswordField({
    super.key,
    required this.formControlName,
    this.validationMessages,
    this.label,
  });

  @override
  State<StatefulWidget> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var showPassword = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return ReactiveTextField(
      formControlName: widget.formControlName,
      showErrors: showErrors,
      validationMessages: widget.validationMessages,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: !showPassword,
      style: DefaultTextStyle.of(context).style.copyWith(
            color: Colors.grey[350],
          ),
      decoration: InputDecoration(
        filled: true,
        icon: Icon(Icons.password, color: Colors.grey[350]),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        isDense: true,
        label: widget.label,
        suffixIcon: IconButton(
          icon: Icon(
            showPassword ? Icons.visibility : Icons.visibility_off,
            semanticLabel: showPassword
                ? localizations.passwordShowing
                : localizations.passwordHiding,
          ),
          onPressed: () => setState(() => showPassword = !showPassword),
        ),
      ),
    );
  }
}
