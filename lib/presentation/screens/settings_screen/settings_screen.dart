import 'package:flutter/material.dart';

import 'components/settings_components.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const SettingsSection(
            title: 'App Settings',
            children: [
              SettingsTile(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                subtitle: 'Toggle dark mode on/off',
                trailing: Icon(Icons.toggle_on),
              ),
              SettingsTile(
                icon: Icons.notifications_outlined,
                title: 'Push Notifications',
                subtitle: 'Enable push notifications',
                trailing: Icon(Icons.toggle_on),
              ),
            ],
          ),
          const SettingsSection(
            title: 'App Information',
            children: [
              SettingsTile(
                icon: Icons.info_outline,
                title: 'Version',
                subtitle: '1.0.0',
              ),
              SettingsTile(
                icon: Icons.update,
                title: 'Check for Updates',
                subtitle: 'Current version is up to date',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
