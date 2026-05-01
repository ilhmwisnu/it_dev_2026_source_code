import 'package:day_one_flutter_basic/add_mahasiswa_page.dart';
import 'package:day_one_flutter_basic/counter_page.dart';
import 'package:day_one_flutter_basic/dashboard_page.dart';
import 'package:day_one_flutter_basic/detail_mahasiswa_page.dart';
import 'package:day_one_flutter_basic/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CounterProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        initialRoute: '/',
        routes: {
          "/": (context) => Dashboard(),
          "/detail-page": (context) => DetailMahasiswaPage(),
          "/add-mahasiswa": (context) => AddMahasiswaPage(),
        },
      ),
    );
  }
}
