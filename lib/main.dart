import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (details) {
      _catchUnhandledExceptions(details.exception, details.stack);
    };

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(const ProviderScope(child: App()));
  }, _catchUnhandledExceptions);
}

void _catchUnhandledExceptions(Object error, StackTrace? stackTrace) {
  debugPrintStack(stackTrace: stackTrace, label: error.toString());
}
