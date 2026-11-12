import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: const [
    Text('SETTINGS', style: TextStyle(fontSize: 11, letterSpacing: 1.4, fontWeight: FontWeight.w800, color: Colors.black54)),
    SizedBox(height: 12),
    Text('Account & safety', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
    SizedBox(height: 14),
    Card(child: Column(children: [
      ListTile(leading: Icon(Icons.lock_outline), title: Text('Security'), subtitle: Text('Authentication setup is pending.')),
      Divider(height: 1),
      ListTile(leading: Icon(Icons.privacy_tip_outlined), title: Text('Privacy'), subtitle: Text('No device resources are used by this prototype.')),
      Divider(height: 1),
      ListTile(leading: Icon(Icons.info_outline), title: Text('About Orbal'), subtitle: Text('Compute marketplace and internal rewards prototype.')),
    ])),
  ]);
}
