import 'package:flutter/material.dart';

import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_pinput/reactive_pinput.dart';

import '../helpers/reactive_forms_helper.dart';

class CodeField extends StatelessWidget {
  final FormGroup formGroup;
  final String formControlName;
  final Map<String, String Function(Object)>? validationMessages;
  final int length;
  final Widget label;

  const CodeField({
    super.key,
    required this.formGroup,
    required this.formControlName,
    this.validationMessages,
    this.length = 6,
    this.label = const Center(),
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 48,
      height: 48,
      textStyle: DefaultTextStyle.of(context).style.copyWith(
            color: Colors.grey[350],
            fontSize: 16,
          ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[350]!),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Theme.of(context).colorScheme.primary,
        width: 2,
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Theme.of(context).colorScheme.error,
        width: 2,
      ),
    );

    return Column(
      children: [
        label,
        ReactivePinPut(
          formControlName: formControlName,
          showErrors: showErrors,
          validationMessages: validationMessages,
          length: length,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          errorPinTheme: errorPinTheme,
          forceErrorState: formGroup.control(formControlName).invalid,
          errorTextStyle: DefaultTextStyle.of(context).style.copyWith(
                fontSize: 12,
                color: Theme.of(context).colorScheme.error,
              ),
          cursor: Text(
            'I',
            style: DefaultTextStyle.of(context).style.copyWith(
                  fontSize: 24,
                  color: Colors.grey[350],
                ),
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}
