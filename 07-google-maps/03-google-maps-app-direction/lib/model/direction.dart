
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class Direction {
  final LatLngBounds bounds;

  final List<LatLng> polylinePoints;

  const Direction._({
    required this.bounds,
    required this.polylinePoints,
  });

  static Future<Direction?> getDirections({
    required String googleMapsApiKey,
    required LatLng origin,
    required LatLng destination,
  }) async {
    final query = {
      'key': googleMapsApiKey,
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
    };
    final response = await http.get(
      Uri.https("maps.googleapis.com", "/maps/api/directions/json", query),
    );
    if (response.statusCode == 200) {
      final mapData = jsonDecode(response.body);
      if ((mapData['routes'] as List).isEmpty) {
        return null;
      } else {
      return Direction._fromMap(mapData);
      }
    } else {
      return null;
    }
  }

  factory Direction._fromMap(Map<String, dynamic> map) {
    // Get route information
    final data = Map<String, dynamic>.from(map['routes'][0]);

    // Bounds
    final northeast = data['bounds']['northeast'];
    final southwest = data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast['lat'], northeast['lng']),
      southwest: LatLng(southwest['lat'], southwest['lng']),
    );

    return Direction._(
      bounds: bounds,
      polylinePoints: _decodePolyline(data['overview_polyline']['points']),
    );
  }

  static List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polyLines = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dLat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dLat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dLng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dLng;
      final p = LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble());
      polyLines.add(p);
    }
    return polyLines;
  }
}
