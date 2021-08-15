import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';

class OSMHomePage extends StatefulWidget {
  OSMHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _OSMHomePageState createState() => _OSMHomePageState();
}

class _OSMHomePageState extends State<OSMHomePage> {
  final PopupController _popupController = PopupController();
  MapController _mapController = MapController();
  double _zoom = 7;
  List<LatLng> _latLngList = [
    LatLng(-17.3533, 30.2058),
    LatLng(-17.353971, 30.206942),
    LatLng(-17.3517284, 30.2076035),
    LatLng(-17.3709521, 30.1956295),
    LatLng(-17.83388, 31.04356),
    LatLng(-17.3476786, 30.2102827),
    LatLng(-17.3482, 30.2101),
    LatLng(-17.3485, 30.2098),
    LatLng(-17.3525764, 30.2068626),
    LatLng(-17.353, 30.206),
    LatLng(-17.3484712, 30.2098294),
    LatLng(-17.3472, 30.2068),
    LatLng(-17.353971, 30.206942),
  ];
  List<Marker> _markers = [];

  @override
  void initState() {
    _markers = _latLngList
        .map((point) => Marker(
              point: point,
              width: 60,
              height: 60,
              builder: (context) => Icon(
                Icons.pin_drop,
                size: 60,
                color: Colors.blueAccent,
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          // swPanBoundary: LatLng(13, 77.5),
          // nePanBoundary: LatLng(13.07001, 77.58),
          center: _latLngList[0],
          bounds: LatLngBounds.fromPoints(_latLngList),
          zoom: _zoom,
          plugins: [
            MarkerClusterPlugin(),
          ],
          onTap: (_) => _popupController.hidePopup(),
        ),
        layers: [
          TileLayerOptions(
            minZoom: 2,
            maxZoom: 18,
            backgroundColor: Colors.black,
            // errorImage: ,
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 190,
            disableClusteringAtZoom: 16,
            size: Size(50, 50),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: _markers,
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            popupOptions: PopupOptions(
                popupSnap: PopupSnap.mapTop,
                popupController: _popupController,
                popupBuilder: (_, marker) => Container(
                      color: Colors.amberAccent,
                      child: Text('Popup'),
                    )),
            builder: (context, markers) {
              return Container(
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                child: Text('${markers.length}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
