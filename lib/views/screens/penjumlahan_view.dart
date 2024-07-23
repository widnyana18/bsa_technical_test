import 'package:flutter/material.dart';

enum ModeHitung {
  penjumlahan(false),
  perkalian(false);

  const ModeHitung();
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double hasil = 0;
    bool modeJumlah = false;
    bool modeKali = false;

    return const Scaffold(
      body: Column(
        children: [
          Text('Penjumlahan Angka'),
          Row(
            children: [
              CheckboxListTile(
                title: Text('Penjumlahan'),
                value: modeJumlah,
                onChanged: (value) {
                  modeJumlah = value!;
                },
              ),
              CheckboxListTile(
                title: Text('Perkalian'),
                value: modeKali,
                onChanged: (value) {
                  modeKali = value!;
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextField(decoration: InputDecoration(labelText: 'Angka 1')),
              TextField(decoration: InputDecoration(labelText: 'Angka 2')),
              SizedBox(height: 30),
              Text(hasil.toString()),
              FilledButton(onPressed: () {}, child: Text('Hitung')),
              FilledButton(onPressed: () {}, child: Text('Hitung')),
              FilledButton(onPressed: () {}, child: Text('Hitung')),
            ],
          ),
        ],
      ),
    );
  }
}
