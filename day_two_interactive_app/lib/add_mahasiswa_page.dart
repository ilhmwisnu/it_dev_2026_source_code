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

  bool isLulus = false;

  int dropdown = 1;

  GlobalKey<FormState> formKey = GlobalKey();

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
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nama",
                ),
              ),
              TextFormField(
                controller: nimController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "NIM tidak boleh kosong";
                  }

                  if (value.length != 12) {
                    return "NIM harus 12 digit";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "NIM",
                ),
              ),
              TextFormField(
                controller: ipkController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "IPK tidak boleh kosong";
                  }

                  double? ipk = double.tryParse(value);

                  if (ipk == null) {
                    return "IPK harus angka";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "IPK",
                ),
              ),
              TextFormField(
                controller: angkatanController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama tidak boleh kosong";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Angkatan",
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    style: TextStyle(color: Colors.black),
                    isExpanded: true,
                    value: dropdown,
                    items: [
                      DropdownMenuItem(value: 1, child: Text("Option 1")),
                      DropdownMenuItem(value: 2, child: Text("Option 2")),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropdown = value!;
                      });
                    },
                  ),
                ),
              ),

              Row(
                children: [
                  Checkbox(
                    value: isLulus,
                    onChanged: (value) {
                      setState(() {
                        isLulus = value!;
                      });
                    },
                  ),
                  Text("Sudah lulus?"),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pop(context, {
                            "name": nameController.text,
                            "nim": nimController.text,
                            "ipk": double.tryParse(ipkController.text),
                            "angkatan": angkatanController.text,
                          });
                        }
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
            ],
          ),
        ),
      ),
    );
  }
}
