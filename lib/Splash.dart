import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kopcimb/Welcome.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward().whenComplete(() async {
      // Animation completed, navigate to another page.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SecPage(), // Replace with your desired page
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;

    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size biggest = constraints.biggest;
          return Container(
            color: Colors.white, // Set your desired background color here
            child: Stack(
              children: <Widget>[
                PositionedTransition(
                  rect: RelativeRectTween(
                    begin: RelativeRect.fromSize(
                      Rect.fromLTWH(
                        biggest.width / 2 - smallLogo / 2, // Center horizontally
                        0, // Start from the top
                        smallLogo,
                        smallLogo,
                      ),
                      biggest,
                    ),
                    end: RelativeRect.fromSize(
                      Rect.fromLTWH(
                        biggest.width / 2 - bigLogo / 2, // Center horizontally
                        biggest.height / 2 - bigLogo / 2, // Center vertically
                        bigLogo,
                        bigLogo,
                      ),
                      biggest,
                    ),
                  ).animate(CurvedAnimation(
                    parent: _controller,
                    curve: Curves.elasticInOut,
                  )),
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset('assets/Logo.png'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SecPage extends StatelessWidget {
  const SecPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 1), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => Welcome()));
    });
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffED1B24),
                  Color(0xff81040A),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(child: Image.asset('assets/kopcimb-logo-white.png')),
          ),
        ],
      ),
    );
  }
}