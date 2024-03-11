import 'package:flutter/material.dart';

import '../../helpers/index.dart';
import '../../layouts/basic_layout.dart';
import '../../widgets/footer.dart';
import '../../widgets/logo.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: SizedBox(
        height: calcNonScrollablePageHeight(context),
        child: const Column(
          children: [
            SizedBox(height: 64),
            Logo(),
            SizedBox(height: 64),
            // TODO: Implement forgot password form
            SizedBox(height: 64),
            Expanded(
              child: Center(),
            ),
            Footer(),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
