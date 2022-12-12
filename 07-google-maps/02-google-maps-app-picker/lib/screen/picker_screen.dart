import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PickerScreen extends StatefulWidget {
  const PickerScreen({super.key});

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  /// todo-01-01: define a variables
  final dicodingOffice = const LatLng(-6.8957473, 107.6337669);

  late GoogleMapController mapController;

  late final Set<Marker> markers = {};

  /// todo-04-02: define a placemark to store a location's address
  geo.Placemark? placemark;

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
                target: dicodingOffice,
              ),

              markers: markers,
              zoomControlsEnabled: false,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,

              /// todo-02-12: show the device location's marker
              myLocationEnabled: true,

              /// todo-01-03: setup controller and marker
              /// todo-04-07: do reverse geocoding in onMapCreated callback
              onMapCreated: (controller) async {
                final info = await geo.placemarkFromCoordinates(
                    dicodingOffice.latitude, dicodingOffice.longitude);

                final place = info[0];
                final street = place.street!;
                final address =
                    '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

                setState(() {
                  placemark = place;
                });

                defineMarker(dicodingOffice, street, address);

                setState(() {
                  mapController = controller;
                });
              },

              /// todo-03-01: setup callback onLongPress
              onLongPress: (LatLng latLng) => onLongPressGoogleMap(latLng),
            ),

            /// todo-02-05: create a FAB widget
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton(
                child: const Icon(Icons.my_location),
                onPressed: () => onMyLocationButtonPress(),
              ),
            ),

            /// todo-05-04: show the widget
            if (placemark == null)
              const SizedBox()
            else
              Positioned(
                bottom: 16,
                right: 16,
                left: 16,
                child: PlacemarkWidget(
                  placemark: placemark!,
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// todo-04-06: do reverse geocoding in onLongPressGoogleMap function
  void onLongPressGoogleMap(LatLng latLng) async {
    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
    });

    /// todo-03-02: set a marker based on new lat-long
    defineMarker(latLng, street, address);

    /// todo-03-03: animate a map view based on a new latLng
    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void onMyLocationButtonPress() async {
    /// todo-02-06: define a location variable
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    /// todo-02-07: check the location service
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        print("Location services is not available");
        return;
      }
    }

    /// todo-02-08: check the location permission
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        print("Location permission is denied");
        return;
      }
    }

    /// todo-02-09: get the current device location
    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    /// todo-04-03: run the reverse geocoding
    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    /// todo-04-04: define a name and address of location
    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
    });

    /// todo-02-10: set a marker
    /// todo-04-05: show the information of location's place and add new argument
    defineMarker(latLng, street, address);

    /// todo-02-11: animate a map view based on a new latLng
    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  /// todo--02: define a marker based on a new latLng
  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );

    /// todo--03: clear and add a new marker
    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }
}

/// todo-05-01: create a location's place widget
class PlacemarkWidget extends StatelessWidget {
  const PlacemarkWidget({
    super.key,
    required this.placemark,
  });

  /// todo-05-02: create a variable
  final geo.Placemark placemark;

  @override
  Widget build(BuildContext context) {
    return Container(
      /// todo-05-03: show the information
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
