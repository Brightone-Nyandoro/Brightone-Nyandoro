import 'package:cut_school_map/ui/home/places_search_map.dart';
import 'package:cut_school_map/ui/home/search_filter.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final LatLng _kMapCenter = LatLng(-17.349722, 30.194444);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  late GoogleMapController _controller;
  Set<Marker> _markers = {};

  static String keyword = "Library";

  static const LatLng _center = const LatLng(-17.349722, 30.194444);
  LatLng _lastMapPosition = _center;
  Future<void> onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId("id-1"), position: LatLng(-17.349722, 30.194444)));
    });
  }

  // Update the position on CameraMove
  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void updateKeyWord(String newKeyword) {
    print(newKeyword);
    setState(() {
      keyword = newKeyword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CUT Campus Navigation'),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                  icon: Icon(Icons.filter_list),
                  tooltip: 'Filter Search',
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  });
            },
          ),
        ],
      ),
      body: PlacesSearchMapSample(keyword),
      endDrawer: SearchFilter(updateKeyWord),
      // body: GoogleMap(
      //   initialCameraPosition: _kInitialPosition,
      //   onMapCreated: onMapCreated,
      //   mapType: MapType.normal,
      //   markers: _markers,
      //   myLocationEnabled: true,
      // ),
    );
  }
}
