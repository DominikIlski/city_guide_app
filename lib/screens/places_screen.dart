import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PlacesScreen extends StatefulWidget {
  PlacesScreen({Key? key}) : super(key: key);

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  Completer<GoogleMapController> _controller = Completer();

  var _initialPosition = CameraPosition(
    target: LatLng(51.919438, 19.145136),
    zoom: 5.0,
  );
  var permisionJustGranted = false;
  var _currentPosition = LatLng(51.919438, 19.145136);
  LatLng get currentPosition => _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _getCurrentPosition();
        }),
        child: Icon(Icons.location_on),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          if (!_controller.isCompleted) {
            _controller.complete(controller);
          }
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
      ),
    );
  }

  Future<void> _getCurrentPosition() async {
    var _locationData = await _determinePosition();

    _currentPosition = LatLng(_locationData.latitude, _locationData.longitude);

    var possition = CameraPosition(
        target: LatLng(_locationData.latitude, _locationData.longitude),
        zoom: 15);

    var controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(possition));
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Lokalizacja na Twoim urządzeniu jest wyłączona. Włącz ją, by móc skorzystać z funkcji.')));
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Lokalizacja, dla aplikacji wyłączona na zawsze, włącz ją by skorzystać z funkcji,')));

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
                'Włącz uprawnienia lokalizacji, by móc skorzystać z funkcji.')));

        return Future.error('Location permissions are denied');
      }
    }
    var _locationData = await Geolocator.getCurrentPosition();
    _currentPosition = LatLng(_locationData.latitude, _locationData.longitude);

    return _locationData;
  }
}
