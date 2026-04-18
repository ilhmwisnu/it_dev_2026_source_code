import 'package:day_one_flutter_basic/tile_mahasiswa_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Map<String, dynamic>> data = [
    {
      "name": "Ilham Wisnu",
      "nim": "202410101001",
      "ipk": 3.85,
      "color": Color(0xFF244AA7),
    },
    {
      "name": "Budi Santoso",
      "nim": "202410101002",
      "ipk": 3.72,
      "color": Color(0xFFD32F2F),
    },
    {
      "name": "Siti Nurhaliza",
      "nim": "202410101003",
      "ipk": 3.91,
      "color": Color(0xFF388E3C),
    },
    {
      "name": "Andi Pratama",
      "nim": "202410101004",
      "ipk": 3.45,
      "color": Color(0xFFF57C00),
    },
    {
      "name": "Dewi Lestari",
      "nim": "202410101005",
      "ipk": 3.68,
      "color": Color(0xFF7B1FA2),
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
            Navigator.pushNamed(context, "/detail-page", arguments: data);
          },
          child: TileMahasiswa(
            name: data[index]["name"],
            nim: data[index]['nim'],
            ipk: data[index]["ipk"],
            color: data[index]["color"],
          ),
        ),
      ),
    );
  }
}
