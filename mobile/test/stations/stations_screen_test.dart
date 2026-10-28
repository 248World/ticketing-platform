import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:ticketing_mobile/stations/station_api.dart';
import 'package:ticketing_mobile/stations/stations_screen.dart';

Widget _app(http.Client client) {
  return MaterialApp(
    home: StationsScreen(
      api: StationApi(client: client, baseUrl: 'http://test'),
    ),
  );
}

void main() {
  testWidgets('shows loading, then the stations', (tester) async {
    final client = MockClient((request) async => http.Response(
          '[{"code":"SIM1","name":"Simulated Central","city":"Monrovia","timeZone":"Africa/Monrovia"}]',
          200,
          headers: {'content-type': 'application/json'},
        ));

    await tester.pumpWidget(_app(client));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.text('Simulated Central'), findsOneWidget);
    expect(find.text('Monrovia (SIM1)'), findsOneWidget);
  });

  testWidgets('shows an empty state when there are no stations', (tester) async {
    final client = MockClient((request) async => http.Response('[]', 200));

    await tester.pumpWidget(_app(client));
    await tester.pumpAndSettle();

    expect(find.text('No stations available yet.'), findsOneWidget);
  });

  testWidgets('shows an error state with a retry button', (tester) async {
    final client = MockClient((request) async => http.Response('boom', 500));

    await tester.pumpWidget(_app(client));
    await tester.pumpAndSettle();

    expect(find.textContaining('Could not load stations'), findsOneWidget);
    expect(find.text('Retry'), findsOneWidget);
  });
}