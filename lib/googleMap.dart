import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMAPVIEW extends StatefulWidget {
  const GoogleMAPVIEW({super.key});

  @override
  State<GoogleMAPVIEW> createState() => _GoogleMAPVIEWState();
}

class _GoogleMAPVIEWState extends State<GoogleMAPVIEW> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();


//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   final List<Marker> markers = <Marker>[
//     Marker(
//         markerId: MarkerId('1'),
//         position: LatLng(20.42796133580664, 75.885749655962),
//         infoWindow: InfoWindow(
//           title: 'My Position',
//         )),
//   ];
// // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

//   Future<Position> getUserCurrentLocation() async {
//     await Geolocator.requestPermission()
//         .then((value) {})
//         .onError((error, stackTrace) async {
//       await Geolocator.requestPermission();
//       print("ERROR" + error.toString());
//     });
//     return await Geolocator.getCurrentPosition();
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Test if location services are enabled.
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         // Permissions are denied, next time you could try
//         // requesting permissions again (this is also where
//         // Android's shouldShowRequestPermissionRationale
//         // returned true. According to Android guidelines
//         // your App should show an explanatory UI now.
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       // Permissions are denied forever, handle appropriately.
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//     return await Geolocator.getCurrentPosition();
//   }

//   @override
//   void initState() {
//     getUserCurrentLocation();
//     // TODO: implement initState
//     _determinePosition();
//     super.initState();
//   }



  Completer<GoogleMapController> _controller = Completer();
  // on below line we have specified camera position
  static final CameraPosition _kGoogle = const CameraPosition(
      target: LatLng(20.42796133580664, 80.885749655962),
    zoom: 14.4746,
  );
 
  // on below line we have created the list of markers
  final List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
      position: LatLng(20.42796133580664, 75.885749655962),
      infoWindow: InfoWindow(
        title: 'My Position',
      )
  ),
  ];
 
  // created method for getting user current location
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission().then((value){
    }).onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR"+error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F9D58),
        // on below line we have given title of app
        title: Text("GFG"),
      ),
       body: Container(
        child: SafeArea(
          // on below line creating google maps
          child: GoogleMap(
          // on below line setting camera position 
          initialCameraPosition: _kGoogle,
          // on below line we are setting markers on the map
          markers: Set<Marker>.of(_markers),
          // on below line specifying map type. 
          mapType: MapType.normal,
          // on below line setting user location enabled.
          myLocationEnabled: true,
          // on below line setting compass enabled. 
          compassEnabled: true,
          // on below line specifying controller on map complete. 
          onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
            },
          ),
        ),
      ), 
      // on pressing floating action button the camera will take to user current location
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          getUserCurrentLocation().then((value) async {
            print(value.latitude.toString() +" "+value.longitude.toString());
 
            // marker added for current users location
            _markers.add(
                Marker(
                  markerId: MarkerId("2"),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: InfoWindow(
                    title: 'My Current Location',
                  ),
                )
            );
 
            // specified current users location
            CameraPosition cameraPosition = new CameraPosition(
              target: LatLng(value.latitude, value.longitude),
              zoom: 14,
            );
 
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {
            });
          });
        },
        child: Icon(Icons.local_activity),
      ),
    );
  }
}