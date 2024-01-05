import 'package:flutter/material.dart';

class TrainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kereta'),
      ),
      body: ListView(
        children: [
          _buildTrainCard('Bima', 8, 10, 200000),
          _buildTrainCard('Turangga', 8, 15, 250000),
          // Tambahkan card lain jika diperlukan
        ],
      ),
    );
  }

  Widget _buildTrainCard(
      String trainName, int departureTime, int arrivalTime, double price) {
    return Card(
      color: Colors.white, // Ubah warna card menjadi putih
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          trainName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0, // Ubah ukuran teks menjadi 2 kali lebih besar
            color: Colors.blue, // Ubah warna teks menjadi biru
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$departureTime:00 - Madiun',
                    style: TextStyle(
                        color: Colors.black)), // Ubah warna teks menjadi hitam
                Text('$arrivalTime:00 - Yogyakarta',
                    style: TextStyle(
                        color: Colors.black)), // Ubah warna teks menjadi hitam
              ],
            ),
            Text('Rp $price',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black)), // Ubah warna teks menjadi hitam
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TrainView(),
  ));
}
