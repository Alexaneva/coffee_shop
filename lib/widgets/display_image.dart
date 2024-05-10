import 'package:flutter/material.dart';

import '../model/product.dart';

class DisplayImage extends StatelessWidget {
  final Product product;

  const DisplayImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return SizedBox(
        height: constrain.maxWidth * 1.25,
        width: constrain.maxWidth,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(constrain.maxWidth * 0.45)),
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      width: constrain.maxWidth * 0.9,
                      height: constrain.maxWidth,
                      child: Image.asset(
                        product.image,
                        fit: BoxFit.contain,
                      )),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
