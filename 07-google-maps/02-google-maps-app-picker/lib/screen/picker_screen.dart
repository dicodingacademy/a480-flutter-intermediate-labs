import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

class PickerScreen extends StatefulWidget {
  const PickerScreen({super.key});

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  /// todo-01-01: define a variables
  final center = const LatLng(-6.8957473, 107.6337669);

  late GoogleMapController mapController;

  late final Set<Marker> markers = {};

  /// todo-03-02: define a placemark to store a location's address
  Placemark? placemark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        /// todo-01-02: add google maps widget
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: center,
              ),
              markers: markers,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              /// todo-05-13: show the device location's marker 
              myLocationEnabled: true,

              /// todo-01-03: setup controller and marker
              onMapCreated: (controller) {
                final marker = Marker(
                  markerId: const MarkerId("source"),
                  position: center,
                );

                setState(() {
                  mapController = controller;
                  markers.add(marker);
                });
              },

              /// todo-02-01: setup callback onTap
              onLongPress: (latLng) async {
                /// todo-03-03: run the reverse geocoding
                final info = await placemarkFromCoordinates(
                    latLng.latitude, latLng.longitude);

                /// todo-03-04: define a name and address of location
                final place = info[0];
                final street = place.street;
                final address =
                    '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
                print(place.toJson());

                /// todo-02-04: set a marker based on new lat-long
                /// todo-03-05: show the information of location's place and add new argument
                defineMarker(latLng, street!, address);

                /// todo-03-06: update the placemark
                setState(() {
                  placemark = place;
                });

                /// todo-02-05: animate a map view based on a new latLng
                mapController.animateCamera(
                  CameraUpdate.newLatLng(latLng),
                );
              },
            ),

            /// todo-05-05: create a FAB widget
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton(
                child: const Icon(Icons.my_location),
                onPressed: () async {
                  /// todo-05-06: define a location variable
                  final loc.Location location = loc.Location();
                  late bool serviceEnabled;
                  late loc.PermissionStatus permissionGranted;
                  late loc.LocationData locationData;

                  /// todo-05-07: check the location service
                  serviceEnabled = await location.serviceEnabled();
                  if (!serviceEnabled) {
                    serviceEnabled = await location.requestService();
                    if (!serviceEnabled) {
                      print("Location services is not available");
                      return;
                    }
                  }

                  /// todo-05-08: check the location permission
                  permissionGranted = await location.hasPermission();
                  if (permissionGranted == loc.PermissionStatus.denied) {
                    permissionGranted = await location.requestPermission();
                    if (permissionGranted != loc.PermissionStatus.granted) {
                      print("Location permission is denied");
                      return;
                    }
                  }

                  /// todo-05-09: get the current device location
                  locationData = await location.getLocation();
                  final latLng =
                      LatLng(locationData.latitude!, locationData.longitude!);

                  /// todo-05-10: run the reverse geocoding
                  final info = await placemarkFromCoordinates(
                      latLng.latitude, latLng.longitude);

                  final place = info[0];
                  final street = place.street;
                  final address =
                      '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

                  /// todo-05-11: set a marker
                  defineMarker(latLng, street!, address);

                  /// todo-05-12: animate a map view based on a new latLng
                  mapController.animateCamera(
                    CameraUpdate.newLatLng(latLng),
                  );
                },
              ),
            ),

            /// todo-04-04: show the widget
            if (placemark == null)
              const SizedBox.shrink()
            else
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: PlacemarkWidget(
                  placemark: placemark!,
                ),
              )
          ],
        ),
      ),
    );
  }

  /// todo-02-02: define a marker based on a new latLng
  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );

    /// todo-02-03: clear and add a new marker
    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }
}

/// todo-04-01: create a location's place widget
class PlacemarkWidget extends StatelessWidget {
  const PlacemarkWidget({
    super.key,
    required this.placemark,
  });

  /// todo-04-02: create a variable
  final Placemark placemark;

  @override
  Widget build(BuildContext context) {
    return Container(
      /// todo-04-03: show the information
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(maxWidth: 700),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            offset: Offset.zero,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  placemark.street!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
