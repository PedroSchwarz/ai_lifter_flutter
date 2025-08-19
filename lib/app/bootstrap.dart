import 'package:flutter/material.dart';
import 'package:lifter/app/dependencies/locators.dart';

Future<void> bootstrap(Widget Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await Locator().setup();

  runApp(builder());
}
