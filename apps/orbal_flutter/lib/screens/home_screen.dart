import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const Text('COMPUTE NETWORK · PREVIEW', style: TextStyle(fontSize: 11, letterSpacing: 1.5, fontWeight: FontWeight.w800, color: Colors.black54)),
      const SizedBox(height: 14),
      const Text('Your compute.\nYour contribution.', style: TextStyle(fontSize: 34, height: 1.05, fontWeight: FontWeight.w900, letterSpacing: -1.5)),
      const SizedBox(height: 20),
      Card(child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('ORB BALANCE', style: TextStyle(fontSize: 11, letterSpacing: 1.3, color: Colors.black54, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('0.000000 ORB', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        const Text('No ORB has been issued. Provider integration is not connected.', style: TextStyle(color: Colors.black54)),
      ]))),
      const SizedBox(height: 12),
      Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [Icon(Icons.info_outline), SizedBox(width: 8), Text('Prototype status', style: TextStyle(fontWeight: FontWeight.bold))]),
        const SizedBox(height: 10),
        const Text('Orbal Compute is not connected to a compute provider. This app does not use your device resources or generate earnings yet.'),
        const SizedBox(height: 14),
        LinearProgressIndicator(value: 0, backgroundColor: Color(0xFFE8E9E2), color: Color(0xFF171915)),
        const SizedBox(height: 8),
        const Text('Provider setup required', style: TextStyle(fontSize: 12, color: Colors.black54)),
      ]))),
      const SizedBox(height: 12),
      const Text('PROPOSED REVENUE RULE', style: TextStyle(fontSize: 11, letterSpacing: 1.2, fontWeight: FontWeight.w800, color: Colors.black54)),
      const SizedBox(height: 8),
      const Row(children: [Expanded(child: _SplitCard(title: 'Contributor', value: '50%')), SizedBox(width: 10), Expanded(child: _SplitCard(title: 'Orbal', value: '50%'))]),
      const SizedBox(height: 10),
      const Text('Illustrative accounting only. Shares apply to verified net compute revenue under a future approved provider agreement.', style: TextStyle(fontSize: 12, color: Colors.black54)),
    ],
  );
}

class _SplitCard extends StatelessWidget {
  const _SplitCard({required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) => Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: Colors.black54)), const SizedBox(height: 6), Text(value, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900))])));
}
