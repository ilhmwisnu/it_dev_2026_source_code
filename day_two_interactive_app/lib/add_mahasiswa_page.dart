import 'package:flutter/material.dart';

class AddMahasiswaPage extends StatefulWidget {
  const AddMahasiswaPage({super.key});

  @override
  State<AddMahasiswaPage> createState() => _AddMahasiswaPageState();
}

class _AddMahasiswaPageState extends State<AddMahasiswaPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController ipkController = TextEditingController();
  final TextEditingController angkatanController = TextEditingController();

  String errorMessage = "";

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    nimController.dispose();
    ipkController.dispose();
    angkatanController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Tambah Mahasiswa"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 8,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nama",
              ),
            ),
            TextField(
              controller: nimController,
              onChanged: (value) {
                setState(() {
                  errorMessage = "";
                });

                if (value.length != 12) {
                  setState(() {
                    errorMessage = "NIM harus 12 digit";
                  });
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "NIM",
              ),
            ),
            TextField(
              controller: ipkController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "IPK",
              ),
            ),
            TextField(
              controller: angkatanController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Angkatan",
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        errorMessage = '';
                      });

                      if (nameController.text.isEmpty) {
                        setState(() {
                          errorMessage = "Nama tidak boleh kosong";
                        });

                        return;
                      }

                      if (nameController.text.length < 5) {
                        setState(() {
                          errorMessage = "Nama minimal 5 huruf";
                        });

                        return;
                      }

                      if (double.tryParse(ipkController.text) == null) {
                        setState(() {
                          errorMessage = "IPK harus angka";
                        });

                        return;
                      }

                      Navigator.pop(context, {
                        "name": nameController.text,
                        "nim": nimController.text,
                        "ipk": double.tryParse(ipkController.text),
                        "angkatan": angkatanController.text,
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8),
                      ),
                    ),
                    child: Text("Tambah"),
                  ),
                ),
              ],
            ),
            Text(errorMessage),
          ],
        ),
      ),
    );
  }
}
