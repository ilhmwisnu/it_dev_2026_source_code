import 'package:flutter/material.dart';

class DetailMahasiswaPage extends StatelessWidget {
  const DetailMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        (ModalRoute.of(context)?.settings.arguments ?? {"name": "Budi"}) as Map;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data['name']),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Home"),
            ),
          ],
        ),
      ),
    );
  }
}
