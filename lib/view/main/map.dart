import 'dart:async';

import 'dart:convert';
import 'dart:io';
import 'package:custom_marker/marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  MapScreen({Key? key, required this.latitude, required this.longitude})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreen();
}

class _MapScreen extends State<MapScreen> {
  late double _latitude;
  late double _longitude;
  late CameraPosition _kGooglePlex;
  late BitmapDescriptor hostIcon;
  late double radarRadius = 0;
  double previousZoom = 0.0;
  bool agentsMarkersVisible = false;
  bool _showRadar = true;



  


  Set<Marker> _markers = {};
  Set<Circle> _circles = {};
  @override
  void initState() {
    _latitude = widget.latitude;
    _longitude = widget.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(_latitude, _longitude),
      zoom: 14,
    );
    
    super.initState();
  }

  void _addHostMarker() async {
    _markers.add(
      Marker(
        markerId: const MarkerId("kGooglePlexMarker"),
        position: LatLng(_latitude, _longitude),
        icon: await MarkerIcon.pictureAsset(
          assetPath: "assets/login.png", 
          width: 100, 
          height: 100
        ), 
        
        infoWindow: const InfoWindow(
          title: "Nhân viên",
          snippet: "Vị trí check in",
        ),
      ),
    );

    setState(() {});
  }

  
  



  @override
  void dispose() {
  
    super.dispose();
  }
 

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Positioned.fill(
          
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) async {
              _controller.complete(controller);
              _addHostMarker();
             
            },
            markers: _markers,


          ),
        ),
        
        
        ]
      ),
    );
  }

  
}
