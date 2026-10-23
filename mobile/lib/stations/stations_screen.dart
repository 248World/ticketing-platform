import 'package:flutter/material.dart';

import 'station.dart';
import 'station_api.dart';

class StationsScreen extends StatefulWidget {
  const StationsScreen({super.key, required this.api});

  final StationApi api;

  @override
  State<StationsScreen> createState() => _StationsScreenState();
}

class _StationsScreenState extends State<StationsScreen> {
  late Future<List<Station>> _stations;

  @override
  void initState() {
    super.initState();
    _stations = widget.api.fetchStations();
  }

  void _retry() {
    setState(() {
      _stations = widget.api.fetchStations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stations')),
      body: FutureBuilder<List<Station>>(
        future: _stations,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Could not load stations. Check your connection and try again.'),
                  const SizedBox(height: 16),
                  ElevatedButton(onPressed: _retry, child: const Text('Retry')),
                ],
              ),
            );
          }
          final stations = snapshot.data!;
          if (stations.isEmpty) {
            return const Center(child: Text('No stations available yet.'));
          }
          return ListView.builder(
            itemCount: stations.length,
            itemBuilder: (context, index) {
              final station = stations[index];
              return ListTile(
                title: Text(station.name),
                subtitle: Text('${station.city} (${station.code})'),
              );
            },
          );
        },
      ),
    );
  }
}