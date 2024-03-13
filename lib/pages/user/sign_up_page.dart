import 'package:flutter/material.dart';

import 'package:darkord_flutter/widgets/user/sign_up_form.dart';

import '../../helpers/index.dart';
import '../../layouts/basic_layout.dart';
import '../../widgets/footer.dart';
import '../../widgets/logo.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: calcNonScrollablePageHeight(context),
        ),
        child: const IntrinsicHeight(
          child: Column(
            children: [
              SizedBox(height: 64),
              Logo(),
              SizedBox(height: 64),
              SignUpForm(),
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
