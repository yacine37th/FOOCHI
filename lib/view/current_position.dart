import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentPosition extends StatelessWidget {
  const CurrentPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
   
    );
  }
}