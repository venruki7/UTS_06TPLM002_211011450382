import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoesListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text(
          "Shoes",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.png'), // Ganti dengan gambar avatar pengguna kamu
            ),
          ),
        ],
      ),
      body: ShoesListView(),
    );
  }
}

class ShoesListView extends StatelessWidget {
  final List<Shoe> shoes = [
    Shoe("Nike SB Zoom Blazer Mid Premium", "Men's Shoe", 8795, Color(0xFFD1C4E9), 'assets/shoe1.png', -15),
    Shoe("Nike Air Zoom Pegasus", "Men's Road Running Shoe", 9295, Color(0xFFB2EBF2), 'assets/shoe2.png', -10),
    Shoe("Nike ZoomX Vaporfly", "Men's Road Racing Shoe", 18995, Color(0xFFFFCDD2), 'assets/shoe3.png', -5),
    Shoe("Nike Air Force 1 S50", "Older Kids' Shoe", 6295, Color(0xFFC5CAE9), 'assets/shoe4.png', 0),
    Shoe("Nike Waffle One", "Men's Shoes", 8295, Color(0xFFFFF9C4), 'assets/shoe5.png', 5),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shoes.length,
      itemBuilder: (context, index) {
        return ShoeCard(shoe: shoes[index]);
      },
    );
  }
}

class Shoe {
  final String name;
  final String description;
  final int price;
  final Color backgroundColor;
  final String image;
  final double rotationAngle;

  Shoe(this.name, this.description, this.price, this.backgroundColor, this.image, this.rotationAngle);
}

class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  ShoeCard({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: shoe.backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            // Teks di sebelah kiri
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoe.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    shoe.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "₹${shoe.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            // Gambar di sebelah kanan dengan rotasi dan ukuran lebih besar
            Transform.rotate(
              angle: shoe.rotationAngle * 3.14159 / 180, // Mengubah derajat menjadi radian
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  shoe.image,
                  width: 100, // Ukuran gambar lebih besar
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
