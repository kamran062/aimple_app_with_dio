import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main_screen_provider.dart';
import '../../utils/textstyles.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',style: AppTextStyles.headingStyle,),
        centerTitle: true,

      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Dark Mode'),
            trailing: Switch(
              value: settingsProvider.settings.isDarkModeEnabled,
              onChanged: (value) {
                settingsProvider.toggleDarkMode();
              },
            ),
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Switch(
              value: settingsProvider.settings.areNotificationsEnabled,
              onChanged: (value) {
                settingsProvider.toggleNotifications();
              },
            ),
          ),
        ],
      ),
    );
  }
}
