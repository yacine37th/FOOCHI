import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMAPVIEW extends StatefulWidget {
  const GoogleMAPVIEW({super.key});

  @override
  State<GoogleMAPVIEW> createState() => _GoogleMAPVIEWState();
}

class _GoogleMAPVIEWState extends State<GoogleMAPVIEW> {
  final Completer<GoogleMapController> _controller =
    Completer<GoogleMapController>();

static const CameraPosition _kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);

static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414);

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
      body:  Container(
        height: 500,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}