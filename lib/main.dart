import 'package:flutter/material.dart';

import '/core/core.dart';

import 'app.dart';

void main() async {
  ///
  WidgetsFlutterBinding.ensureInitialized();

  ///
  configureDependencies();

  ///
  runApp(
    ///
    const App(),
  );
}
