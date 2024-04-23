import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract interface class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl({
    required this.connectivity,
  });

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    if (result.contains(ConnectivityResult.none)) return false;

    return true;
  }
}
