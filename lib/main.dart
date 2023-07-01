import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'Location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Test(),
    );
  }
}

class Test extends StatefulWidget{
  @override
  _Test createState() => _Test();
}
late List<Placemark> placemarks;
class _Test extends State<Test>{

  void getLocation() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      printLocation();
    }else{
      requestPermission();
    }
  }

  requestPermission() async{
    LocationPermission permission = await Geolocator.requestPermission();
    if(permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      printLocation();
    }else{
      requestPermission();
    }
  }
  printLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low, timeLimit: Duration(seconds: 10));

    print(position);
    placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
        children: [
          SizedBox(height: 100,),
          ElevatedButton(
          onPressed: () async {
           getLocation();
           Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => const location()));
          },
          child: Text('Get Location'),
        ),
      ]
        )
      ),
    );
  }
}