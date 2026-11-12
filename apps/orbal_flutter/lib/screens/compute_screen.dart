import 'package:flutter/material.dart';

class ComputeScreen extends StatelessWidget {
  const ComputeScreen({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [
    const Text('ORBAL COMPUTE', style: TextStyle(fontSize: 11, letterSpacing: 1.4, fontWeight: FontWeight.w800, color: Colors.black54)),
    const SizedBox(height: 12),
    const Text('Contribute computing power.', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
    const SizedBox(height: 14),
    Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
      Row(children: [Icon(Icons.cloud_off_outlined), SizedBox(width: 8), Text('Not connected', style: TextStyle(fontWeight: FontWeight.bold))]),
      SizedBox(height: 12),
      Text('No provider adapter is configured. Orbal will not start CPU, RAM, GPU or network workloads until a provider agreement and a safe node implementation are in place.'),
    ]))),
    const SizedBox(height: 14),
    const Text('Planned controls', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    const SizedBox(height: 8),
    const _Feature(icon: Icons.tune, title: 'Resource limits', detail: 'Contributor-selected CPU, memory and temperature limits.'),
    const _Feature(icon: Icons.pause_circle_outline, title: 'Pause and stop', detail: 'A clear control to pause jobs or disconnect the node.'),
    const _Feature(icon: Icons.verified_user_outlined, title: 'Verified workloads', detail: 'Only approved, isolated workloads with provider-verified usage.'),
    const _Feature(icon: Icons.receipt_long_outlined, title: 'Transparent earnings', detail: 'Show gross revenue, fees, the 50/50 split and adjustments.'),
  ]);
}

class _Feature extends StatelessWidget {
  const _Feature({required this.icon, required this.title, required this.detail});
  final IconData icon; final String title; final String detail;
  @override
  Widget build(BuildContext context) => ListTile(contentPadding: EdgeInsets.zero, leading: Icon(icon), title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)), subtitle: Text(detail));
}
