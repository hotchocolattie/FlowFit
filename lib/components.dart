import 'package:flutter/material.dart';

class BackgroundRectangle extends StatelessWidget {
  const BackgroundRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xFFFAF6F0),
        ),
        Image.asset('assets/image/cat-default.png'),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * (3/4),
              width: double.infinity,
              color: Color(0xFFFFDACC),
            )
        )
      ],
    );
  }
}

