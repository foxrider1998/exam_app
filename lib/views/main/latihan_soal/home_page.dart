// ignore_for_file: prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:exam_app/constants/r.dart';
import 'package:exam_app/views/main/latihan_soal/mapel_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F7F8),
      // appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            _buildUserHomeProfile(),
            _buildTopBanner(context),
            _buildHomeListMapel(),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 21,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Terbaru",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(R.assets.banneHome),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildHomeListMapel() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 21,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Pilih Pelajaran",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MapelPage.route);
                },
                child: const Text("Lihat Semua"),
              )
            ],
          ),
          const MapelWidget(),
          const MapelWidget(),
          const MapelWidget(),
        ],
      ),
    );
  }

  Container _buildTopBanner(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        // vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: 147,
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: const Text(
            "Mau Kerjain Latihan Soal Apa Hari Ini?",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(
            R.assets.icHome,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      ]),
    );
  }

  Padding _buildUserHomeProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Nama User",
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Selamat Datang",
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            R.assets.imgUser,
            height: 45,
            width: 45,
          ),
        ],
      ),
    );
  }
}

class MapelWidget extends StatelessWidget {
  const MapelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 21,
      ),
      child: Row(
        children: [
          Container(
            height: 53,
            width: 53,
            decoration: BoxDecoration(
              color: const Color(0xffF3F7F8),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(13),
            child: Image.asset(R.assets.icAtom),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Matematika",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  "0/50 Paket Latihan Soal",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 12,
                      width: double.infinity,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 12,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
