import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:my_map/googleMap/google_map_api.dart';


class LocationTracking extends StatefulWidget {
  const LocationTracking({Key? key}) : super(key: key);

  @override
  _LocationTrackingState createState() => _LocationTrackingState();
}

class _LocationTrackingState extends State<LocationTracking> {
  LatLng sourceLocation = LatLng(28.432864, 77.002563);
  LatLng destinationLatlng = LatLng(28.431626, 77.002475);

  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> _marker = Set<Marker>();

  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  late StreamSubscription<LocationData> subscription;

  LocationData? currentLocation;
  late LocationData destinationLocation;
  late Location location;

  @override
  void initState() {
    super.initState();

    location = Location();
    polylinePoints = PolylinePoints();

    subscription = location.onLocationChanged.listen((clocation) {
      currentLocation = clocation;

      updatePinsOnMap();
    });

    setInitialLocation();
  }

  void setInitialLocation() async {
    await location.getLocation().then((value) {
      currentLocation = value;
      setState(() {});
    });

    destinationLocation = LocationData.fromMap({
      "latitude": destinationLatlng.latitude,
      "longitude": destinationLatlng.longitude,
    });
  }

  void showLocationPins() {
    var sourceposition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    var destinationPosition =
        LatLng(destinationLatlng.latitude, destinationLatlng.longitude);

    _marker.add(Marker(
      markerId: MarkerId('sourcePosition'),
      position: sourceposition,
    ));

    _marker.add(
      Marker(
        markerId: MarkerId('destinationPosition'),
        position: destinationPosition,
      ),
    );

    setPolylinesInMap();
  }

  void setPolylinesInMap() async {
    var result = await polylinePoints.getRouteBetweenCoordinates(
      GoogleMapApi().url,
      PointLatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
      PointLatLng(destinationLatlng.latitude, destinationLatlng.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((pointLatLng) {
        polylineCoordinates
            .add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
      });
    }

    setState(() {
      _polylines.add(Polyline(
        width: 5,
        polylineId: PolylineId('polyline'),
        color: Colors.blueAccent,
        points: polylineCoordinates,
      ));
    });
  }

  void updatePinsOnMap() async {
    CameraPosition cameraPosition = CameraPosition(
      zoom: 20,
      tilt: 80,
      bearing: 30,
      target: LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
    );

    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    var sourcePosition = LatLng(
        currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0);

    setState(() {
      _marker.removeWhere((marker) => marker.mapsId.value == 'sourcePosition');

      _marker.add(Marker(
        markerId: MarkerId('sourcePosition'),
        position: sourcePosition,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: 20,
      tilt: 80,
      bearing: 30,
      target: currentLocation != null
          ? LatLng(currentLocation!.latitude ?? 0.0,
              currentLocation!.longitude ?? 0.0)
          : LatLng(0.0, 0.0),
    );

    return currentLocation == null
        ? Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  GoogleMap(
                    myLocationButtonEnabled: true,
                    compassEnabled: true,
                    markers: _marker,
                    polylines: _polylines,
                    mapType: MapType.normal,
                    initialCameraPosition: initialCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);

                      showLocationPins();
                    },
                  ),
                  Positioned(
                    bottom: 70,
                    left: 30, 
                    right: 30,
                    child: Container(
                      alignment: Alignment.center,
                     height: 400, 
                     width: 500,
                    decoration:const BoxDecoration(
                      color: Colors.white
                    ),
                    child: ListView(
                      children: [
                        const Card(
                           child: ListTile(
                                                 
                            title: Text("Covid-19 Safety Checklist", style: TextStyle(color: Colors.black),),
                            subtitle: Text("Please make sure you have taken the following safety measures", 
                            style: TextStyle(fontSize:12),),
                                                 ),
                         ),
                        ListTile(
                          leading: Container(
                            height: 40, 
                            width: 40, 
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle

                            )
                          ),
                          title: Text("You are not sick", style: TextStyle(color: Colors.black),),
                          subtitle: Text("Avoid any interaction if you are sick of have any symptom of Covid-19", 
                          style: TextStyle(fontSize:12),),
                        ),
                         ListTile(
                          leading: Container(
                            height: 40, 
                            width: 40, 
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle

                            )
                          ),
                          title: Text("Wear a mas", style: TextStyle(color: Colors.black),),
                          subtitle: Text("Avoid any interaction if you are sick of have any symptom of Covid-19", 
                          style: TextStyle(fontSize:12),),
                        ),
                         ListTile(
                          leading: Container(
                            height: 40, 
                            width: 40, 
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle

                            )
                          ),
                          title: Text("Clean your hand", style: TextStyle(color: Colors.black),),
                          subtitle: Text("Avoid any interaction if you are sick of have any symptom of Covid-19", 
                          style: TextStyle(fontSize:12),),
                        ),
                         ListTile(
                          leading: Container(
                            height: 40, 
                            width: 40, 
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle

                            )
                          ),
                          title: Text("keep distance", style: TextStyle(color: Colors.black),),
                          subtitle: Text("Avoid any interaction if you are sick of have any symptom of Covid-19", 
                          style: TextStyle(fontSize:12),),
                        ), 
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(vertical: 15),
                          width: 340, 

                          child: Text("ACKNOWLEDGE & PROCEED", style: TextStyle(color: Colors.purple),),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}