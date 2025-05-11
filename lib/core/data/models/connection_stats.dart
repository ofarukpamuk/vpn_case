import 'country.dart';

class ConnectionStats {
  final int downloadSpeed; // MB
  final int uploadSpeed; // MB
  final Duration connectedTime;
  final Country? connectedCountry;

  ConnectionStats({
    required this.downloadSpeed,
    required this.uploadSpeed,
    required this.connectedTime,
    this.connectedCountry,
  });
}
