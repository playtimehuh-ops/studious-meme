import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/compute_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/settings_screen.dart';

class OrbalApp extends StatelessWidget {
  const OrbalApp({super.key});

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF171915);
    const lime = Color(0xFFD7F36B);
    return MaterialApp(
      title: 'Orbal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: lime, brightness: Brightness.light),
        scaffoldBackgroundColor: const Color(0xFFF6F5F0),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF6F5F0), foregroundColor: ink, elevation: 0),
        cardTheme: CardThemeData(color: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: const BorderSide(color: Color(0xFFD9DBD2)))),
      ),
      home: const OrbalShell(),
    );
  }
}

class OrbalShell extends StatefulWidget {
  const OrbalShell({super.key});
  @override
  State<OrbalShell> createState() => _OrbalShellState();
}

class _OrbalShellState extends State<OrbalShell> {
  int index = 0;
  static const pages = [HomeScreen(), ComputeScreen(), WalletScreen(), SettingsScreen()];
  static const labels = ['Home', 'Compute', 'Wallet', 'Settings'];
  static const icons = [Icons.dashboard_outlined, Icons.memory, Icons.account_balance_wallet_outlined, Icons.settings_outlined];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('ORBΛL', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.4))),
    body: SafeArea(child: IndexedStack(index: index, children: pages)),
    bottomNavigationBar: NavigationBar(
      selectedIndex: index,
      onDestinationSelected: (value) => setState(() => index = value),
      destinations: List.generate(4, (i) => NavigationDestination(icon: Icon(icons[i]), label: labels[i])),
    ),
  );
}
