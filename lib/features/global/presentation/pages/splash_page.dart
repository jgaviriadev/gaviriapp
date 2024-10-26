import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/utils.dart';
import 'home_page.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              //color: Colors.amber,
              height: MediaQuery.of(context).size.height*0.9,
              width: double.infinity,
              child: FadeInUpBig(
                child: const RotatedBox(
                  quarterTurns: 3,
                  child: FittedBox(
                    alignment: Alignment.topRight,
                    child: Text(
                      'WELCOME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1
                    ),
                    )
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: FadeInRightBig(
                child: Image.asset(
                  Constants.splashImg,
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