import 'package:fluter_ecom/controller/current_postion_controller.dart';
import 'package:fluter_ecom/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../theme/main_colors.dart';

class CurrentPosition extends StatelessWidget {
  const CurrentPosition({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentPositionController currentPositionController = Get.find();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBackground,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              navigator!.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColors.kPrimary,
            )),
      ),
      body: Container(
        child: SafeArea(
          // on below line creating google maps
          child: GetBuilder<CurrentPositionController>(
            builder: (contx) => GoogleMap(
              // on below line setting camera position
              initialCameraPosition: currentPositionController.kGoogle,
              // on below line we are setting markers on the map
              markers: Set<Marker>.of(currentPositionController.markers),
              // on below line specifying map type.
              mapType: MapType.normal,
              // on below line setting user location enabled.
              myLocationEnabled: true,
              // on below line setting compass enabled.
              compassEnabled: true,
              // on below line specifying controller on map complete.
              onMapCreated: (GoogleMapController controller) {
                currentPositionController.controller.complete(controller);
              },
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     MainFunctions.getUserCurrentLocation().then((value) async {
      //       print(value.latitude.toString() + " " + value.longitude.toString());

      //       // marker added for current users location
      //       // currentPositionController.markers.add(Marker(
      //       //   markerId: MarkerId("2"),
      //       //   position: LatLng(value.latitude, value.longitude),
      //       //   infoWindow: InfoWindow(
      //       //     title: 'My Current Location',
      //       //   ),
      //       // ));
      //       // currentPositionController.addMarker(
      //       //     value.longitude, value.latitude);
      //       // specified current users location
      //       CameraPosition cameraPosition = new CameraPosition(
      //         target: LatLng(value.latitude, value.longitude),
      //         zoom: 14,
      //       );

      //       final GoogleMapController controller =
      //           await currentPositionController.controller.future;
      //       controller
      //           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      //       // setState(() {
      //       // });
      //     });
      //   },
      //   child: Icon(Icons.local_activity),
      // ),
    );
  }
}
