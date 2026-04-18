import 'package:flutter/material.dart';

class TileMahasiswa extends StatelessWidget {
  const TileMahasiswa({
    super.key,
    required this.name,
    required this.nim,
    required this.ipk,
    required this.color,
  });

  final String name;
  final String nim;
  final double ipk;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999999),
              color: color,
            ),
            child: Center(
              child: Text(
                name[0],
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(name, style: TextStyle(fontWeight: .bold, fontSize: 16)),
                Text(
                  "NIM: $nim",
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                ipk.toString(),
                style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: .w800,
                  fontSize: 18,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.chevron_right, color: Colors.grey, size: 16),
            ],
          ),
        ],
      ),
    );
  }
}
