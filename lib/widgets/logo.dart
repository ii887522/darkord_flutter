import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../helpers/index.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    const logoWidth = 128.0;
    const logoHeight = 128.0;

    final localizations = AppLocalizations.of(context)!;

    return Column(
      children: [
        Image.asset(
          'assets/images/favicon.png',
          width: logoWidth,
          height: logoHeight,
          cacheWidth: context.calcCacheWidth(logoWidth),
          cacheHeight: context.calcCacheHeight(logoHeight),
        ),
        Text(
          localizations.title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
