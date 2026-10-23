import 'package:flutter/material.dart';

import 'stations/station_api.dart';
import 'stations/stations_screen.dart';

void main() {
  runApp(TicketingApp(api: StationApi()));
}

class TicketingApp extends StatelessWidget {
  const TicketingApp({super.key, required this.api});

  final StationApi api;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticketing',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: StationsScreen(api: api),
    );
  }
}