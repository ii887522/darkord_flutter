import 'package:flutter/material.dart';
import '../../widgets/auth/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: ResizeImage(
                  AssetImage('assets/images/favicon.png'),
                  width: 128,
                  height: 128,
                ),
              ),
              Text(
                'Darkord',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
