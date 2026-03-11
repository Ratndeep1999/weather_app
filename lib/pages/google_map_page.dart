import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/widgets/background_decorated_box_widget.dart';

class GoogleMapPage extends StatefulWidget {
  final bool isNight;
  final double height, width;

  const GoogleMapPage({
    super.key,
    required this.isNight,
    required this.height,
    required this.width,
  });

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  GoogleMapController? _mapController;
  LatLng _selectedLatLng = LatLng(18.4901, 73.8500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ///
            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: CameraPosition(
                target: LatLng(18.4901, 73.8500),
                zoom: 14,
                tilt: 0.0,
                bearing: 90,
              ),
              onMapCreated: (GoogleMapController controller) =>
                  _mapController = controller,
              onLongPress: (LatLng latLng) {
                setState(() => this._selectedLatLng = latLng);
              },
              markers: {
                Marker(
                  markerId: MarkerId("Selected location"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _selectedLatLng,
                  infoWindow: InfoWindow(
                    title:
                        "${_selectedLatLng.longitude}, ${_selectedLatLng.latitude}",
                  ),
                ),
              },
              compassEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              trafficEnabled: false,
            ),

            ///
            BackgroundDecoratedBoxWidget(
              isNight: widget.isNight,
              horizontalPadding: widget.width * 0.05,
              verticalPadding: widget.height * 0.0125,
              customWidget: Column(children: [Text('data')]),
            ),
          ],
        ),
      ),
    );
  }
}
