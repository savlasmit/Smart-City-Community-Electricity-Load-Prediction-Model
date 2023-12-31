import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:loaddash/config/size_config.dart';
import 'package:loaddash/menu/home.dart';
import 'package:loaddash/style/colors.dart';
import 'package:loaddash/style/style.dart';

class MapView extends StatefulWidget {
  const MapView({super.key, required this.id, required this.view});

  final String id;
  final String view;

  @override
  // ignore: library_private_types_in_public_api
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late List<Marker> markers;
  late int pointIndex;
  final PopupController _popupLayerController = PopupController();

  @override
  void initState() {
    pointIndex = 0;
    super.initState();
    (widget.id == 'Community' && widget.view == 'dash')
        ? markers = [
            LatLng(-33.8878872, 151.1964025),
            LatLng(-33.8802599, 151.1840188),
            LatLng(-33.8825595, 151.2131584),
            // LatLng(-33.8802599, 151.1840188),
          ]
            .map((markerPosition) => Marker(
                  point: markerPosition,
                  width: 30,
                  height: 30,
                  builder: (_) => const Icon(Icons.house_rounded, size: 40),
                  anchorPos: AnchorPos.align(AnchorAlign.top),
                ))
            .toList()
        : (widget.id == 'Community' && widget.view == 'House 1')
            ? markers = [
                LatLng(-33.8878872, 151.1964025),
              ]
                .map((markerPosition) => Marker(
                      point: markerPosition,
                      width: 30,
                      height: 30,
                      builder: (_) => const Icon(Icons.house_rounded, size: 40),
                      anchorPos: AnchorPos.align(AnchorAlign.top),
                    ))
                .toList()
            : (widget.id == 'Community' && widget.view == 'House 2')
                ? markers = [
                    LatLng(-33.8802599, 151.1840188),
                  ]
                    .map((markerPosition) => Marker(
                          point: markerPosition,
                          width: 30,
                          height: 30,
                          builder: (_) =>
                              const Icon(Icons.house_rounded, size: 40),
                          anchorPos: AnchorPos.align(AnchorAlign.top),
                        ))
                    .toList()
                : (widget.id == 'Community' && widget.view == 'House 3')
                    ? markers = [
                        LatLng(-33.8825595, 151.2131584),
                      ]
                        .map((markerPosition) => Marker(
                              point: markerPosition,
                              width: 30,
                              height: 30,
                              builder: (_) =>
                                  const Icon(Icons.house_rounded, size: 40),
                              anchorPos: AnchorPos.align(AnchorAlign.top),
                            ))
                        .toList()
                    : markers = [
                        LatLng(-33.8878872, 151.1964025),
                      ]
                        .map((markerPosition) => Marker(
                              point: markerPosition,
                              width: 30,
                              height: 30,
                              builder: (_) =>
                                  const Icon(Icons.house_rounded, size: 40),
                              anchorPos: AnchorPos.align(AnchorAlign.top),
                            ))
                        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PrimaryText(
            text: 'Location',
            size: 15,
            fontWeight: FontWeight.w800,
            color: AppColors.black),
        SizedBox(height: SizeConfig.blockSizeVertical * 3),
        Container(
          height: 275,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 5,
                blurRadius: 15.0,
                offset: Offset(
                  0,
                  2,
                ),
              )
            ],
          ),
          child: FlutterMap(
            options: MapOptions(
                center: LatLng(-33.8878872, 151.1964025),
                maxZoom: 17.0,
                zoom: 10.0,
                minZoom: 3.0,
                plugins: [
                  MarkerClusterPlugin(),
                ],
                onTap: (_, __) => _popupLayerController.hideAllPopups()),
            children: <Widget>[
              TileLayerWidget(
                options: TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
              ),
              MarkerClusterLayerWidget(
                options: MarkerClusterLayerOptions(
                    maxClusterRadius: 120,
                    size: const Size(40, 40),
                    fitBoundsOptions: const FitBoundsOptions(
                      padding: EdgeInsets.all(50),
                    ),
                    markers: markers,
                    polygonOptions: const PolygonOptions(
                      borderColor: Colors.blueAccent,
                      color: Colors.black12,
                      borderStrokeWidth: 3,
                    ),
                    popupOptions: PopupOptions(
                      popupSnap: PopupSnap.markerTop,
                      popupController: _popupLayerController,
                      popupBuilder: (_, markers) => Container(
                        width: 200,
                        height: 100,
                        color: AppColors.white,
                        child: GestureDetector(
                            onTap: () => debugPrint('Popup Tap!'),
                            // child: Text('Container Popup ${markers.point}'),
                            child: (markers.point ==
                                    LatLng(-33.8878872, 151.1964025))
                                ? TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const Home(
                                                  id: 'Community',
                                                  view: 'House 1')));
                                    },
                                    child: const Text('House 1 Dashboard'),
                                  )
                                : (markers.point ==
                                        LatLng(-33.8802599, 151.1840188))
                                    ? TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home(
                                                          id: 'Community',
                                                          view: 'House 2')));
                                        },
                                        child: const Text('House 2 Dashboard'),
                                      )
                                    : TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home(
                                                          id: 'Community',
                                                          view: 'House 3')));
                                        },
                                        child: const Text('House 3 Dashboard'),
                                      )),
                      ),
                    ),
                    builder: (context, markers) {
                      return const Icon(
                        Icons.apartment,
                        size: 40,
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
