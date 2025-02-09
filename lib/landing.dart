import 'package:flutter/material.dart';
import 'package:winghacksflowfit/components.dart';
import 'home.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 917,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Color(0xFFFAF4F0)),
      child: Stack(
        children: [
          Positioned(
            left: 5,
            top: 232,
            child:
            BigCat(),
          ),
          Positioned(
            left: -103,
            top: -94,
            child: Container(
              width: 562,
              height: 460,
              child: Stack(
                children: [
                  Positioned(
                    left: 116,
                    top: 219,
                    child: SizedBox(
                      width: 237,
                      child: Text(
                        'FitFlow',
                        style: TextStyle(
                          color: Color(0xFFB88F82),
                          fontSize: 48,
                          fontFamily: 'PlayfairDisplay',
                          fontWeight: FontWeight.w900,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

