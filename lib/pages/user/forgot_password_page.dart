import 'package:flutter/material.dart';

import 'package:darkord_flutter/widgets/user/forgot_password_form.dart';

import '../../helpers/index.dart';
import '../../layouts/basic_layout.dart';
import '../../widgets/footer.dart';
import '../../widgets/logo.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.calcNonScrollablePageHeight(),
        ),
        child: const IntrinsicHeight(
          child: Column(
            children: [
              SizedBox(height: 64),
              Logo(),
              SizedBox(height: 64),
              ForgotPasswordForm(),
              SizedBox(height: 64),
              Expanded(
                child: Center(),
              ),
              Footer(),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
