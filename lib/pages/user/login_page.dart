import 'package:darkord_flutter/layouts/basic_layout.dart';
import 'package:darkord_flutter/widgets/user/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/logo.dart';

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
                  onPressed: () {
                    // TODO: Navigate to sign up page
                  },
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
            const Expanded(
              child: Center(),
            ),
            Text(
              '${localizations.version} 1.0.0',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            Text(
              '${localizations.copyright} © ${DateTime.now().year} ii887522',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
