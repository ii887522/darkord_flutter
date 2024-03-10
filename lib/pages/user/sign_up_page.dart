import 'package:darkord_flutter/widgets/footer.dart';
import 'package:flutter/material.dart';
import '../../layouts/basic_layout.dart';
import '../../widgets/logo.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      child: SizedBox(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom,
        child: const Column(
          children: [
            SizedBox(height: 64),
            Logo(),
            SizedBox(height: 64),
            // TODO: Implement sign up form
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
