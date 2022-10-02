import 'package:exam_app/views/main/latihan_soal/home_page.dart';
import 'package:exam_app/views/main/latihan_soal/paket_soal_page.dart';
import 'package:flutter/material.dart';

class MapelPage extends StatelessWidget {
  const MapelPage({Key? key}) : super(key: key);
  static String route = "mapel_page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F7F8),
      appBar: AppBar(
        title: const Text("Pilih Pelajaran"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(PaketSoalPage.route);
            },
            child: const MapelWidget(),
          );
        },
      ),
    );
  }
}
