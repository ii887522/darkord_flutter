import 'package:darkord_flutter/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import '../../layouts/basic_layout.dart';
import '../../widgets/logo.dart';
import '../../widgets/user/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return BasicLayout(
      child: SizedBox(
        height: MediaQuery.of(context).size.height -
            MediaQuery.of(context).padding.top -
            MediaQuery.of(context).padding.bottom,
        child: Column(
          children: [
            const SizedBox(height: 64),
            const Logo(),
            const SizedBox(height: 64),
            const LoginForm(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  localizations.noAccountQuestion,
                  style: TextStyle(color: Colors.grey[350]),
                ),
                const SizedBox(width: 4),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: const Size(0, 0),
                  ),
                  onPressed: () => context.push('/user/sign-up'),
                  child: Text(
                    localizations.signUp,
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.green,
                      decorationColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 64),
            const Expanded(
              child: Center(),
            ),
            const Footer(),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
