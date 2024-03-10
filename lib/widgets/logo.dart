import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    const logoWidth = 128.0;
    const logoHeight = 128.0;

    return Column(
      children: [
        Image.asset(
          'assets/images/favicon.png',
          width: logoWidth,
          height: logoHeight,
          cacheWidth:
              (logoWidth * MediaQuery.of(context).devicePixelRatio).toInt(),
          cacheHeight:
              (logoHeight * MediaQuery.of(context).devicePixelRatio).toInt(),
        ),
        Text(
          'Darkord',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
