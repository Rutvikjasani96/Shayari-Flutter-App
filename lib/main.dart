import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayari/first.dart';

void main()
{
  runApp(MaterialApp(
    home: splash(),
  ));
}

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  @override
  void initState() {
    super.initState();

    abc()
    async {
      var status = await Permission.storage.status;

      if (status.isDenied) {
        await Permission.storage.request();
      }

      if (await Permission.storage.isRestricted) {

      }
    }

    abc();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
        first()
      ));
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
            "pics/shayari.jpg",
          height: 120,
          width: 120,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
