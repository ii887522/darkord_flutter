import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(const App());
  }, (error, stackTrace) {
    debugPrint('Error: $error');
    debugPrintStack(stackTrace: stackTrace);
  });
}
