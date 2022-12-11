import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../model/direction.dart';

class DirectionScreen extends StatefulWidget {
  const DirectionScreen({super.key});

  @override
  State<DirectionScreen> createState() => _DirectionScreenState();
}

class _DirectionScreenState extends State<DirectionScreen> {
  /// todo-01-01: define a variable
  late GoogleMapController mapController;

  late final Set<Marker> markers = {};

  final dicodingLatLng = const LatLng(-6.8957473, 107.6337669);

  /// todo-01-02: define a destination location variable
  final gedungSateLatLng = const LatLng(-6.902525, 107.618796);

  /// todo-02-01: define a polyline variable
  final Set<Polyline> polylines = <Polyline>{};

  /// todo-03-01: define a location and navigation variable
  final Location location = Location();

  bool isNavigationOn = false;

  @override
  void initState() {
    super.initState();

    /// todo-03-03: run the function in initState method
    Future.microtask(() async {
      await setupLocation();
    });

    /// todo-03-04: listen the current location
    location.onLocationChanged.listen((locationData) {
      /// todo-03-05: check if navigation is active
      if (isNavigationOn) {
        /// todo-03-06: get the current location
        final latLng = LatLng(locationData.latitude!, locationData.longitude!);

        /// todo-03-07: animate a camera based on current location
        CameraPosition cPosition = CameraPosition(
          zoom: 16,
          tilt: 80,
          bearing: 30,
          target: latLng,
        );
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(cPosition),
        );

        /// todo-03-08: update the marker based on current location
        setState(() {
          markers.removeWhere((m) => m.markerId.value == 'source');
          markers.add(Marker(
            markerId: const MarkerId('source'),
            position: latLng,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRose,
            ),
          ));
        });
      }
    });
  }

  /// todo-03-02: setup location services and permissions
  Future<void> setupLocation() async {
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Location services is not available");
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permission is denied");
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /// todo-01-03: add google maps widget
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: dicodingLatLng,
              ),
              markers: markers,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,

              /// todo-02-08: display a polyline
              polylines: polylines,

              /// todo-01-04: setup controller and marker
              onMapCreated: (controller) async {
                final dicodingMarker = Marker(
                  markerId: const MarkerId("source"),
                  position: dicodingLatLng,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                );

                final gedungSateMarker = Marker(
                  markerId: const MarkerId("destination"),
                  position: gedungSateLatLng,
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueRed,
                  ),
                );

                setState(() {
                  mapController = controller;
                  markers.addAll([dicodingMarker, gedungSateMarker]);
                });
              },
            ),

            /// todo-02-09: create a button
            Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      /// todo-03-11: update the state when click this button
                      setState(() {
                        isNavigationOn = false;

                        markers
                            .removeWhere((m) => m.markerId.value == 'source');
                        markers.add(Marker(
                          markerId: const MarkerId('source'),
                          position: dicodingLatLng,
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueRed,
                          ),
                        ));
                      });

                      /// todo-02-10: run a function
                      await setPolylines(
                        dicodingLatLng,
                        gedungSateLatLng,
                      );
                    },
                    child: const Icon(Icons.directions),
                  ),

                  /// todo-03-09: create a button widget
                  const SizedBox(height: 8),
                  FloatingActionButton(
                    onPressed: () {
                      /// todo-03-10: change the navigation state
                      setState(() {
                        isNavigationOn = true;
                      });
                    },
                    child: const Icon(Icons.navigation),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// todo-02-02: create a function to load a polylines
  Future<void> setPolylines(LatLng source, LatLng destination) async {
    /// todo-02-03: get a direction from a class
    final result = await Direction.getDirections(
      googleMapsApiKey: "YOUR_API_KEY",
      origin: source,
      destination: destination,
    );

    /// todo-02-04: add a polyline coordinate
    final polylineCoordinates = <LatLng>[];
    if (result != null && result.polylinePoints.isNotEmpty) {
      polylineCoordinates.addAll(result.polylinePoints);
    }

    /// todo-02-05: setup a polyline component
    final polyline = Polyline(
      polylineId: const PolylineId('default-polyline'),
      color: Colors.blue,
      width: 7,
      points: polylineCoordinates,
    );

    /// todo-02-06: update a polyline
    setState(() {
      polylines.add(polyline);
    });

    /// todo-02-07: animate a camera to a polylines
    mapController.animateCamera(
      CameraUpdate.newLatLngBounds(result!.bounds, 50),
    );
  }
}
