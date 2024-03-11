import 'package:flutter/material.dart';

double calcNonScrollablePageHeight(BuildContext context) {
  return MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;
}

int calcCacheWidth(BuildContext context, double width) {
  return (width * MediaQuery.of(context).devicePixelRatio).toInt();
}

int calcCacheHeight(BuildContext context, double height) {
  return calcCacheWidth(context, height);
}
