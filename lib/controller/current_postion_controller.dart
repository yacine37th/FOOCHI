import 'dart:async';

import 'package:fluter_ecom/main.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentPositionController extends GetxController {
  Completer<GoogleMapController> controller = Completer();
  int counterID = 0;
  //  Position position = Get.arguments("position");
//
  // late CameraPosition kGoogle;
  // longitude=0;
  // var longitude = Get.arguments["1"];
  final args = Get.arguments;
  double la = Get.arguments["arg1"];
  double lo = Get.arguments["arg2"];

  void get() {
    print("longitude////////////////////");
    print(args["arg1"]);
    print(args["arg2"]);
    // print(longitude);
  }

  late CameraPosition kGoogle;

  final List<Marker> markers = <Marker>[
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(20.42796133580664, 75.885749655962),
        infoWindow: InfoWindow(
          title: 'My Position',
        )),
  ];

  // get kGoogle => null;

  //   CameraPosition cameraPosition = new CameraPosition(
  //   target: LatLng(latitude, longitude),
  //   zoom: 14,
  // );

  // final GoogleMapController controller =
  //     await controller.future;
  // controller
  //     .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  // print(latitude);

  addMarker(double longitude, double latitude) {
    markers.add(Marker(
      markerId: MarkerId("2"),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(
        title: 'My Current Location',
      ),
    ));
    update();
  }

  @override
  void onInit() {
    kGoogle = CameraPosition(
      target: LatLng(la, lo),
      zoom: 14.4746,
    );
    addMarker(la, lo);
    markers.add(Marker(
      markerId: MarkerId("$counterID"),
      position: LatLng(la, lo),
      infoWindow: InfoWindow(
        title: 'My Current Location ${currentUserInfos.name}',
      ),
    ));
    // addMarker(la, lo, counterID);
    super.onInit();
  }
}
