import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});
  @override
  Widget build(BuildContext context) => ListView(padding: const EdgeInsets.all(20), children: [
    const Text('ORBAL WALLET', style: TextStyle(fontSize: 11, letterSpacing: 1.4, fontWeight: FontWeight.w800, color: Colors.black54)),
    const SizedBox(height: 12),
    const Text('Your ORB ledger.', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
    const SizedBox(height: 14),
    Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
      Text('AVAILABLE BALANCE', style: TextStyle(fontSize: 11, letterSpacing: 1.2, color: Colors.black54)),
      SizedBox(height: 8),
      Text('0 ORB', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900)),
      Text('Internal prototype unit · no cash value promised', style: TextStyle(color: Colors.black54, fontSize: 12)),
    ]))),
    const SizedBox(height: 14),
    Card(child: Padding(padding: const EdgeInsets.all(18), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
      Text('CONVERSION RULE', style: TextStyle(fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Text('When a contributor has USD 10 of verified available earnings, the proposed rule converts that USD 10 into 1 ORB and debits the USD earnings ledger by the same amount.'),
      SizedBox(height: 10),
      Text('This is an internal accounting rule, not a promise that ORB can be sold or redeemed for USD 10.', style: TextStyle(color: Colors.black54, fontSize: 12)),
    ]))),
    const SizedBox(height: 14),
    const Text('Recent activity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    const SizedBox(height: 8),
    const Card(child: ListTile(leading: Icon(Icons.receipt_long_outlined), title: Text('No transactions yet'), subtitle: Text('Verified provider events will appear here after integration.'))),
  ]);
}
