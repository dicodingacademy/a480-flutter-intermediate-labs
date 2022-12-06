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
  final center = const LatLng(-6.8957473, 107.6337669);

  late GoogleMapController mapController;

  late final Set<Marker> markers = {};

  Placemark? placemark;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
              myLocationEnabled: true,
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
              onLongPress: (latLng) async {
                final info = await placemarkFromCoordinates(
                    latLng.latitude, latLng.longitude);

                final place = info[0];
                final street = place.street;
                final address =
                    '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
                print(place.toJson());

                defineMarker(latLng, street!, address);

                setState(() {
                  placemark = place;
                });

                mapController.animateCamera(
                  CameraUpdate.newLatLng(latLng),
                );
              },
            ),
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton(
                child: const Icon(Icons.my_location),
                onPressed: () async {
                  final loc.Location location = loc.Location();
                  late bool serviceEnabled;
                  late loc.PermissionStatus permissionGranted;
                  late loc.LocationData locationData;

                  serviceEnabled = await location.serviceEnabled();
                  if (!serviceEnabled) {
                    serviceEnabled = await location.requestService();
                    if (!serviceEnabled) {
                      print("Location services is not available");
                      return;
                    }
                  }

                  permissionGranted = await location.hasPermission();
                  if (permissionGranted == loc.PermissionStatus.denied) {
                    permissionGranted = await location.requestPermission();
                    if (permissionGranted != loc.PermissionStatus.granted) {
                      print("Location permission is denied");
                      return;
                    }
                  }

                  locationData = await location.getLocation();
                  final latLng =
                      LatLng(locationData.latitude!, locationData.longitude!);

                  final info = await placemarkFromCoordinates(
                      latLng.latitude, latLng.longitude);

                  final place = info[0];
                  final street = place.street;
                  final address =
                      '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

                  defineMarker(latLng, street!, address);

                  mapController.animateCamera(
                    CameraUpdate.newLatLng(latLng),
                  );
                },
              ),
            ),
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

  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }
}

class PlacemarkWidget extends StatelessWidget {
  const PlacemarkWidget({
    super.key,
    required this.placemark,
  });

  final Placemark placemark;

  @override
  Widget build(BuildContext context) {
    return Container(
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
