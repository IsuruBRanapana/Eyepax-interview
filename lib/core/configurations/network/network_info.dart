import 'package:connectivity_checker/connectivity_checker.dart';

///Created By Isuru B. Ranapana
/// 2022-05-27 22:34

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final ConnectivityWrapper connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    var connectivityResult = await connectionChecker.isConnected;
    if (connectivityResult) {
      return true;
    } else {
      return false;
    }
  }
}
