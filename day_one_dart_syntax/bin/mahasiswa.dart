class Mahasiswa {
  final String name;
  final String nim;

  Mahasiswa({required this.name, required this.nim});

  void perkenalan() {
    print("Halo nama saya $name, NIM saya $nim");
  }
}

class Mawapres extends Mahasiswa {
  final bool isFavoriteDosen;

  Mawapres({
    required super.name,
    required super.nim,
    required this.isFavoriteDosen,
  });
}
