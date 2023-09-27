import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/pages/settings/bloc/settings_controller.dart';
import 'app/core/view/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(MyApp(settingsController: settingsController));
}
