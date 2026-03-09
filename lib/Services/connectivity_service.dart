import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  /// Get object
  final Connectivity _connectivity = Connectivity();

  /// Get internet connectivity result
  Future<bool> checkInternetConnectivity() async {
    final List<ConnectivityResult> result = await _connectivity
        .checkConnectivity();
    return !result.contains(ConnectivityResult.none);
  }
}
