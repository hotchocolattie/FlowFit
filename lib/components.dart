import 'package:flutter/material.dart';
import 'dart:async';
import 'home.dart';

class BackgroundRectangle extends StatelessWidget {
  const BackgroundRectangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Color(0xFFFAF6F0),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * (.77),
              width: double.infinity,
              color: Color(0xFFFFDACC),
            )
        )
      ],
    );
  }
}

class CatDefault extends StatelessWidget {
  final String pageName;

  const CatDefault({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        // cat goes home when pressed!
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/cat_default.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),

          // show page name!!
          Text(
            pageName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'PlayfairDisplay',
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        ],
      ),
    );
  }
}


class CatTalk extends StatefulWidget {
  final String pageName;

  const CatTalk({super.key, required this.pageName});

  @override
  State<CatTalk> createState() => _CatTalkState();
}

class _CatTalkState extends State<CatTalk> {
  bool _isDefault = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // transfer btwn two imgs
    _timer = Timer.periodic(Duration(milliseconds: 400), (timer) {
      setState(() {
        _isDefault = !_isDefault;
      });
    });
  }

  @override
  void dispose() {
    // erm it crashes if it isnt cancled oops
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      //makes it so the cat goes home when pressed
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Image.asset(
            _isDefault
                ? 'assets/images/cat_default.png'
                : 'assets/images/cat_mouth_open.png',
            width: MediaQuery.of(context).size.width * 0.5,
          ),

          //display page name!!
          Text(
            widget.pageName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'PlayfairDisplay',
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        ],
      ),
    );
  }
}


// button widget (haha its reusable now!!!)
class DefaultButton extends StatelessWidget {
  final String text;
  final Widget destination;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // nav to destination page when pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      child: Container(
        width: 187,
        height: 42,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFB491),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Center(

          // custom text here haha
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF2C180F),
              fontSize: 20,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}



// chatgpt textbox
class AIResponse extends StatelessWidget {
  final String text;

  const AIResponse({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        SizedBox(
          width: 350,
          height: 40,
          child: Text(
            'Here are some suggestions:',
            style: TextStyle(
              color: Color(0xFF7A5E52),
              fontSize: 20,
              fontFamily: 'PlayfairDisplay',
              fontWeight: FontWeight.w900,
            ),
          ),
    ),

        Container(
          height: MediaQuery.of(context).size.height * (0.34),
          width: MediaQuery.of(context).size.width * (4 / 5),
          child: RawScrollbar(
            thumbVisibility: true,
            thumbColor: Color(0xFFDDA9A2),
            thickness: 8,
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                text, // Your dynamic text goes here
                style: const TextStyle(
                color: Color(0xFF2B170F),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Inter",
                ),
              ),
            ),
          ),
        )
      ]
    );



  }
}