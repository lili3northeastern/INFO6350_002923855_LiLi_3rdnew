import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Maps Example'),
        ),
        body: MapScreen(),
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        // Do something with the controller if needed
      },
      initialCameraPosition: CameraPosition(
        target: LatLng(37.7749, -122.4194), // Set initial map position
        zoom: 12.0,
      ),
    );
  }
}
