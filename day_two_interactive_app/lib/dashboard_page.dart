import 'package:day_one_flutter_basic/counter_page.dart';
import 'package:day_one_flutter_basic/home_page.dart';
import 'package:day_one_flutter_basic/profile_page.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("Build !!!");

    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: [HomePage(), ProfilePage(), CounterPage()],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        selectedIndex: pageIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "home"),
          NavigationDestination(icon: Icon(Icons.person), label: "profile"),
          NavigationDestination(icon: Icon(Icons.numbers), label: "Counter"),
        ],
      ),
    );
  }
}
