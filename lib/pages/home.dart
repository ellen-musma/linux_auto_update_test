import 'package:dandi_theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // _mapController.rotate(120);
  }

  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.black.withOpacity(0.8),
        title: Text(
          'Hanhwa Ocean',
          style: context.textTheme.b1Body,
        ),
        centerTitle: false,
        actions: [
          Text.rich(
            TextSpan(
              text: "시스템 ",
              style: context.textTheme.b1Body,
              children: [
                TextSpan(
                  text: "ON",
                  style: context.textTheme.b1Body.copyWith(
                    color: ColorName.lightPrimary,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ],
            ),
          ),
          Gaps.hGap24,
          Text.rich(
            TextSpan(
              text: "바이패스 ",
              style: context.textTheme.b1Body,
              children: [
                TextSpan(
                  text: "OFF",
                  style: context.textTheme.b1Body.copyWith(
                    color: ColorName.lightError,
                  ),
                ),
              ],
            ),
          ),
          Gaps.hGap24,
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return _buildPage(context, constraints);
        },
      ),
    );
  }

  Widget _buildPage(BuildContext context, BoxConstraints constraints) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        _buildMap(),
        Padding(
          padding: const EdgeInsets.only(top: 24, right: 24),
          child: buildSideItems(context),
        ),
        // _buildWarning(true, false),
      ],
    );
  }

  Widget buildRotatingCrane() {
    return Transform.rotate(
      angle: 120,
      child: Image.asset(
        'assets/crane_icon.png',
      ),
    );
  }

  Widget buildSideItems(BuildContext context) {
    final items = [
      {'title': '온도', 'value': 20.0},
      {'title': '습도', 'value': 30.0},
      {'title': 'CO2', 'value': 40.0},
    ];

    return Column(
      children: items.map((item) {
        return Column(
          children: [
            _buildSideItem(context, item['title'] as String, item['value'] as double),
            Gaps.vGap10,
          ],
        );
      }).toList(),
    );
  }

  Widget _buildMap() {
    return FlutterMap(
      mapController: _mapController,
      options: const MapOptions(
        initialCenter: LatLng(36.7749, -122.4194),
        maxZoom: 18.0,
        minZoom: 2.0,
      ),
      children: [
        TileLayer(
          subdomains: const ['a', 'b', 'c'],
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        ),
        MarkerLayer(
          markers: [
            Marker(
              rotate: true,
              width: 200.0,
              height: 200.0,
              point: const LatLng(36.7749, -122.4194),
              child: buildRotatingCrane(),
            ),
          ],
        ),
        CircleLayer(
          circles: [
            CircleMarker(
              point: const LatLng(36.7749, -122.4194),
              color: ColorName.lightOrange.withOpacity(0.2),
              borderStrokeWidth: 2,
              borderColor: ColorName.lightOrange,
              radius: 100,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSideItem(BuildContext context, String title, double value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(6),
      ),
      width: 100,
      child: Column(
        children: [
          Text(
            title,
            style: context.textTheme.b1Body,
          ),
          Gaps.vGap12,
          const Divider(
            color: ColorName.mainBlack,
            height: 1,
          ),
          Gaps.vGap12,
          Text(
            value.toString(),
            style: context.textTheme.b1Body.copyWith(color: ColorName.lightOrange),
          ),
        ],
      ),
    );
  }

  Widget _buildWarning(bool isWarningLeft, bool isWarningRight) {
    Widget aa(bool isWarning) {
      return Container(
        color: isWarning ? Colors.red.withOpacity(0.2) : Colors.transparent,
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: aa(isWarningLeft),
            ),
            Expanded(
              child: aa(isWarningRight),
            ),
          ],
        ),
        if (isWarningLeft || isWarningRight)
          const Icon(
            Icons.warning,
            color: ColorName.lightError,
            size: 200,
          ),
      ],
    );
  }
}
