import 'mahasiswa.dart';

void main(List<String> arguments) {
  // Nullable & null-coalescing
  String? name;
  print(name ?? "Wisnu");

  // Variables
  int umur = 20;
  bool hidup = true;
  double berat = 75.5;
  print("umur=$umur, hidup=$hidup, berat=$berat");

  // const / final
  const namaKedua = "Ilham";
  print(namaKedua);

  // Collections
  List<String> names = ["Wisnu", "Ilham"];
  Map<String, String> nama = {"depan": "Ilham", "belakang": "Wisnu"};
  print(nama["tengah"]); // null — key tidak ada
  print(umur.toString());

  // Functions
  String hello(String nama, int umur) {
    return "hello $nama $umur";
  }

  String hello2({required String nama, int? umur}) {
    return "hello $nama $umur";
  }

  print(hello("Wisnu", 21));
  print(hello2(nama: "Wisnu2", umur: 20));

  // Loops
  for (int i = 0; i < 5; i++) {
    print("ini angka $i");
  }

  for (String name in names) {
    print("ini nama $name");
  }

  // Conditionals
  int angka = 11;
  if (angka % 2 == 0) {
    print("Genap");
  } else if (angka == 13) {
    print("Ini 13");
  } else {
    print("Ganjil");
  }

  // Classes & inheritance
  Mahasiswa p1 = Mahasiswa(name: "Ilham", nim: "202410103060");
  p1.perkenalan();

  Mawapres p2 = Mawapres(name: "Siti", nim: "123123123", isFavoriteDosen: true);
  p2.perkenalan();
  print(p2.isFavoriteDosen);
}
