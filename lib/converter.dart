 import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'mapPage.dart';

class converter extends StatefulWidget {
  const converter({Key? key}) : super(key: key);

  @override
  State<converter> createState() => _converterState();
}

class _converterState extends State<converter> {
  String stAdress ='Converter';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geo Coding'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
           onTap: () async {

                List<Placemark> placemarks = await placemarkFromCoordinates(17.40805701119017, 78.49749579559034);
                setState(() {
                  stAdress = placemarks.reversed.last.country.toString();
                });
            },
            child: Center(
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.blue
                ),
                child: Center(
                  child: Text(stAdress),
                ),
              ),
            ),
          )
        ],
      ),
    );

  }
}
