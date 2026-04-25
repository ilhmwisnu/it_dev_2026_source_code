import 'package:day_one_flutter_basic/tile_mahasiswa_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> data = [];
  bool isLoading = false;
  String? errorMessage = null;

  void loadData() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      await Future.delayed(Duration(seconds: 5));

      setState(() {
        isLoading = false;
        data = [];
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = e.toString();
      });
      showError(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
    );
  }

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF3F52B4),
        foregroundColor: Colors.white,
        onPressed: () async {
          final result =
              await Navigator.pushNamed(context, "/add-mahasiswa")
                  as Map<String, dynamic>?;

          if (result != null) {
            setState(() {
              data.add(result);
            });

            showSuccess("Data berhasil ditambahkan");
          }
        },
        child: Icon(Icons.add),
      ),
      body: Builder(
        builder: (context) {
          if (isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (errorMessage != null) {
            return Center(child: Text(errorMessage!));
          }

          if (data.isEmpty) {
            return Center(child: Text("Data kosong"));
          }

          return ListView.builder(
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
          );
        },
      ),
    );
  }
}
