import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition initialPosition = const CameraPosition(
      target: LatLng(17.44598597415367, 78.50896987766987),zoom: 14.0);

  List<Marker> _marker = <Marker>[
    Marker( markerId: MarkerId('1'),
        position: LatLng(17.44598597415367, 78.50896987766987),
        infoWindow: InfoWindow(
            title: "GIOE"
        )
    ),
    Marker( markerId: MarkerId('2'),
        position: LatLng(17.40805701119017, 78.49749579559034),
        infoWindow: InfoWindow(
            title: "NSIC"
        )
    ),
    Marker( markerId: MarkerId('3'),
        position: LatLng(17.434902218745822, 78.50518002208821),
        infoWindow: InfoWindow(
            title: "Rathifile Bus Station"
        )
    ),
    Marker( markerId: MarkerId('4'),
        position: LatLng(17.448021939225793, 78.49739189325294),
        infoWindow: InfoWindow(
            title: "JBS Bus Stop"
        )
    ),
    Marker( markerId: MarkerId('5'),
        position: LatLng(13.041425078432978, 80.23414134915993),
        infoWindow: InfoWindow(
            title: "Chennai"
        )
    ),
  ];


  loadlocation(){
    getuserCurrentLocation().then((value) async {
      print('My Location:');
      print(value.latitude.toString()+""+value.longitude.toString());

      _marker.add(
          Marker(markerId: MarkerId('6'),
              position: LatLng(value.latitude,value.longitude),
              infoWindow: InfoWindow(
                  title: 'My current Location'
              )
          )
      );
      CameraPosition cameraPosition = CameraPosition(target:LatLng(value.latitude,value.longitude),zoom: 20);
      GoogleMapController controller=await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
    setState(() {
    });
  }


  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // _marker.addAll(_list);
  //   loadlocation();
  // }

  Future<Position> getuserCurrentLocation()async{
    await Geolocator.requestPermission().then((value){

    }).onError((error, stackTrace) {
      print('Error'+error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        zoomControlsEnabled: false,
        markers: Set<Marker>.of(_marker),
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
          _controller.complete(controller);
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.location_searching),
        onPressed: () async {
          getuserCurrentLocation().then((value) async {
            print('My Location:');
            print(value.latitude.toString()+""+value.longitude.toString());
            _marker.add(
                Marker(markerId: MarkerId('6'),
                    position: LatLng(value.latitude,value.longitude),
                    infoWindow: InfoWindow(
                        title: 'My current Location'
                    )
                )
            );
            setState(() {
            });
            CameraPosition cameraPosition = CameraPosition(target:LatLng(value.latitude,value.longitude),zoom: 20);
            GoogleMapController controller=await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
          });
        },
      ),
    );
  }
}