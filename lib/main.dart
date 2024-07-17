import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/classification_page.dart';
import 'src/app_state.dart';
import 'src/ecg_page.dart';
import 'src/placeholder_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'iSaku Redesigned App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 1;
  bool shadowColor = false;
  double? scrolledUnderElevation;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const ECGPage();
        break;
      case 1:
        page = const ClassificationPage();
        break;
      case 2:
        page = const PlaceholderPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        // appBar: AppBar(
        //   title: const Text('i.saku'),
        //   shadowColor:
        //       shadowColor ? Theme.of(context).colorScheme.shadow : null,
        //   backgroundColor: Color(0xFF409FEF),
        //   foregroundColor: Colors.white,
        //   actions: const [
        //     Icon(Icons.upgrade),
        //     Icon(Icons.notifications),
        //     Icon(Icons.help),
        //   ],
        // ),
        bottomNavigationBar: NavigationBar(
          // extended: constraints.maxWidth >= 600,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.monitor_heart),
              label: 'ECG',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_tree),
              label: 'Classification',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
        body: Container(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: page,
        ),
      );
    });
  }
}
