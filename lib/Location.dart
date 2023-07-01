import 'package:flutter/material.dart';
import 'package:unnatbharat/main.dart';

class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text(placemarks.toString() )
            ],
          ),
        ),
      ),
    );
  }
}
