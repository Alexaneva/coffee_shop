
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

myAppBar() {
  return AppBar(
    title: Row(
      children: [
        Image.asset(
          "assets/images/logo.png",
          height: 60,
        ),
        const SizedBox(width: 5),
        Column(
          children: [
            Text("Coffee shop",
                style:
                GoogleFonts.aBeeZee(fontSize: 15, color: Colors.white)),
          ],
        )
      ],
    ),
    actions: const [
      Center(
        child: Stack(
          children: [
            Icon(Icons.shopping_cart, color: Colors.brown),
          ],
        ),
      ),
      SizedBox(
        width: 15,
      ),
    ],
  );
}