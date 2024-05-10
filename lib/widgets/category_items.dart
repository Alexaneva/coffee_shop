import 'package:coffee_shop/model/category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItems extends StatelessWidget {
  final Category category;
  const CategoryItems({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 75,
          width: 75,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Image.asset(category.image),
        ),
        const SizedBox(height: 10),
        Text(category.name.toUpperCase(), style: GoogleFonts.aBeeZee(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w900),),
      ],
    );
  }
}
