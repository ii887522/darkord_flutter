import 'package:flutter/material.dart';

import 'package:reactive_forms/reactive_forms.dart';

class SubmitButton extends StatelessWidget {
  final Widget label;
  final Widget icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool isLoading;
  final void Function()? onPressed;

  const SubmitButton({
    super.key,
    required this.label,
    required this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.isLoading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: label,
      icon: isLoading
          ? Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(2),
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            )
          : icon,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
      onPressed:
          ReactiveForm.of(context)!.valid && !isLoading ? onPressed : null,
    );
  }
}
