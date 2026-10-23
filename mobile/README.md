# Mobile app (Flutter)

Run in Chrome against a local backend:

    flutter run -d chrome --web-port 5000

Optional API address (default http://localhost:8080):

    flutter run -d chrome --web-port 5000 --dart-define=API_BASE_URL=http://localhost:8080

Checks: `flutter analyze` and `flutter test`.