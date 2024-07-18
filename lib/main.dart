import 'package:flutter/material.dart';

import '/core/core.dart';
import 'app.dart';

void main() {
  /// Initialize [Service Locator]
  configureDependencies();

  ///
  runApp(
    ///
    const App(),
  );
}
