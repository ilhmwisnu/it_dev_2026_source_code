import 'package:day_one_flutter_basic/tile_mahasiswa_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> data = [
    {
      "name": "Ilham Wisnu",
      "nim": "202410101001",
      "ipk": 3.85,
      "angkatan": "2024",
    },
    {
      "name": "Budi Santoso",
      "nim": "202410101002",
      "ipk": 3.72,
      "angkatan": "2024",
    },
    {
      "name": "Siti Nurhaliza",
      "nim": "202410101003",
      "ipk": 3.91,
      "angkatan": "2024",
    },
    {
      "name": "Andi Pratama",
      "nim": "202410101004",
      "ipk": 3.45,
      "angkatan": "2024",
    },
    {
      "name": "Dewi Lestari",
      "nim": "202410101005",
      "ipk": 3.68,
      "angkatan": "2024",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      appBar: AppBar(
        title: Text(
          "Daftar Mahasiswa",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        backgroundColor: Color(0xFF3F52B4),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              "/detail-page",
              arguments: data[index],
            );
          },
          child: TileMahasiswa(
            name: data[index]["name"],
            nim: data[index]['nim'],
            ipk: data[index]["ipk"],
          ),
        ),
      ),
    );
  }
}
