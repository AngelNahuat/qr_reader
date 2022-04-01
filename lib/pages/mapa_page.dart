import 'package:flutter/material.dart';
import 'package:qr_reade/modes/scan_model.dart';
import 'package:qr_reade/providers/db_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapaPage extends StatefulWidget {
  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    final CameraPosition puntoInit = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    final ScanModel scan =
        ModalRoute.of(context)?.settings.arguments as ScanModel;

    return Scaffold(
      appBar: AppBar(title: Text('Mapa')),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: puntoInit,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
