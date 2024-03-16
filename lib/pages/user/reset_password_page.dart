import 'package:flutter/material.dart';

import '../../helpers/index.dart';
import '../../layouts/basic_layout.dart';
import '../../widgets/footer.dart';
import '../../widgets/logo.dart';
import '../../widgets/user/reset_password_form.dart';

class ResetPasswordPage extends StatelessWidget {
  final String emailAddr;

  const ResetPasswordPage({super.key, required this.emailAddr});

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.calcNonScrollablePageHeight(),
        ),
        child: IntrinsicHeight(
          child: Column(
            children: [
              const SizedBox(height: 64),
              const Logo(),
              const SizedBox(height: 64),
              ResetPasswordForm(emailAddr: emailAddr),
              const SizedBox(height: 64),
              const Expanded(
                child: Center(),
              ),
              const Footer(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
