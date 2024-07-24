import 'package:flutter/material.dart';

class NumberOperationView extends StatefulWidget {
  const NumberOperationView({super.key});

  @override
  State<NumberOperationView> createState() => _NumberOperationViewState();
}

class _NumberOperationViewState extends State<NumberOperationView> {
  bool? modeJumlah = false;
  bool? modeKali = false;
  double hasil = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Penjumlahan Angka'),
          // Row(
          //   children: [
          //     CheckboxListTile(
          //       title: Text('Penjumlahan'),
          //       value: modeJumlah,
          //       onChanged: (value) {
          //         modeJumlah = value!;
          //       },
          //     ),
          //     CheckboxListTile(
          //       title: Text('Perkalian'),
          //       value: modeKali,
          //       onChanged: (value) {
          //         modeKali = value!;
          //       },
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          // Row(
          //   children: [
          //     TextField(decoration: InputDecoration(labelText: 'Angka 1')),
          //     TextField(decoration: InputDecoration(labelText: 'Angka 2')),
          //   ],
          // ),
          // SizedBox(height: 30),
          // Text(hasil.toString()),
          // SizedBox(height: 30),
          // FilledButton(onPressed: () {}, child: Text('Hitung')),
          // FilledButton(onPressed: () {}, child: Text('Hitung')),
          // FilledButton(onPressed: () {}, child: Text('Hitung')),
        ],
      ),
    );
  }
}
