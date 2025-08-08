import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // List kategori yang ingin di tampilkan
    final List<String> categories = [
      'Akasia',
      'Hutan',
      'Klanceng',
      'Kuning',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/categories/${i + 1}.jpg', // Ganti dengan path gambar kategori
                  width: 40,
                  height: 40,
                ),
                const SizedBox(width: 10),
                Text(
                  categories[i],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF6B512),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
