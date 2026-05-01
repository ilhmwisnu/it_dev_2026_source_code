import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  void add() {
    counter++;
    notifyListeners();
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print("BUILD SET STATE");
    return Scaffold(
      floatingActionButton: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            child: Text("SET STATE", style: TextStyle(fontSize: 8)),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterProvider>().add();
            },
            child: Text("PROVIDER", style: TextStyle(fontSize: 8)),
          ),
        ],
      ),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (context, value, child) => Text(value.counter.toString()),
        ), 
      ),
    );
  }
}
