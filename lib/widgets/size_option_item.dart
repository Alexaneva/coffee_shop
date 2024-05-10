import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/size_option.dart';

class SizeOptionItem extends StatelessWidget {
  final int index;
  final SizeOption sizeOption;
  final bool selected;

  const SizeOptionItem(
      {super.key,
      required this.index,
      required this.sizeOption,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              color: selected ? Colors.green[100] : Colors.white,
              shape: BoxShape.circle),
          child: Center(
            child: Image.asset('assets/images/cup.png'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          sizeOption.name,
          style: GoogleFonts.aBeeZee(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
            letterSpacing: 1.5,
          ),
        ),
        Text(
          '${sizeOption.quantity} ml',
          style: GoogleFonts.aBeeZee(
            fontSize: 13,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}
