import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  /// todo-01-01: set the location
  final center = const LatLng(-6.8957473, 107.6337669);

  /// todo-02-01: create a controller
  late GoogleMapController mapController;

  /// todo-03-01: create a marker variable
  late final Set<Marker> markers = {};

  /// todo-05-01: create a selected map type variable
  MapType selectedMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /// todo-01-02: insert GoogleMap widget to show the map
        /// todo-04-02: wrap widget with Stack widget
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: center,
              ),

              /// todo-03-04: add markers properties
              markers: markers,

              /// todo-05-04: add map type properties
              mapType: selectedMapType,

              /// todo-02-02: setup callback after maps created
              onMapCreated: (controller) {
                /// todo-03-02: set the marker value
                final marker = Marker(
                  markerId: const MarkerId("dicoding"),
                  position: center,
                  onTap: () {
                    controller.animateCamera(
                      CameraUpdate.newLatLngZoom(center, 18),
                    );
                  },
                );

                /// todo-02-03: set the controller
                setState(() {
                  mapController = controller;

                  /// todo-03-03: update the marker
                  markers.add(marker);
                });
              },

              /// todo-04-01: set the feature off
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
            ),

            /// todo-04-03: create a button on bottom-right corner
            Positioned(
              bottom: 16,
              right: 16,
              child: Column(
                children: [
                  FloatingActionButton.small(
                    heroTag: "zoom-in",
                    onPressed: () {
                      /// todo-04-04: add zoom in function
                      mapController.animateCamera(
                        CameraUpdate.zoomIn(),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton.small(
                    heroTag: "zoom-out",
                    onPressed: () {
                      /// todo-04-05: add zoom out function
                      mapController.animateCamera(
                        CameraUpdate.zoomOut(),
                      );
                    },
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            ),

            /// todo-05-02: create a button on top-right corner
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton.small(
                onPressed: null,
                child: PopupMenuButton<MapType>(
                  /// todo-05-03: Callback that sets the selected popup menu item.
                  onSelected: (MapType item) {
                    setState(() {
                      selectedMapType = item;
                    });
                  },
                  offset: const Offset(0, 54),
                  icon: const Icon(Icons.layers_outlined),
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<MapType>>[
                    const PopupMenuItem<MapType>(
                      value: MapType.normal,
                      child: Text('Normal'),
                    ),
                    const PopupMenuItem<MapType>(
                      value: MapType.satellite,
                      child: Text('Satellite'),
                    ),
                    const PopupMenuItem<MapType>(
                      value: MapType.terrain,
                      child: Text('Terrain'),
                    ),
                    const PopupMenuItem<MapType>(
                      value: MapType.hybrid,
                      child: Text('Hybrid'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
