import 'package:flutter/material.dart';

import 'package:reactive_forms/reactive_forms.dart';

class SubmitButton extends StatelessWidget {
  final Widget label;
  final Widget icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final void Function()? onPressed;

  const SubmitButton({
    super.key,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: label,
      icon: icon,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      onPressed: ReactiveForm.of(context)!.valid ? onPressed : null,
    );
  }
}
