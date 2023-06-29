import 'dart:async';
import 'package:crud_testing/constant/colors.dart';
import 'package:crud_testing/extensions/context_extensions.dart';
import 'package:crud_testing/page/home/get_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Text(
              "MY APP",
              style: TextStyle(
                  color: pPrimaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SpinKitThreeInOut(
              itemBuilder: (BuildContext context, int index) {
                Timer(const Duration(seconds: 2), () {
                  context.pushReplacement(const HomePage());
                 
                });
                return Icon(
                  Icons.circle,
                  size: 16,
                  color: index.isEven ? pPrimaryColor : Colors.amber,
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
