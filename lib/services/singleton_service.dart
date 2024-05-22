import 'package:connectivity_plus/connectivity_plus.dart';

class SingletonService {
  static final SingletonService _instance = SingletonService._internal();

  factory SingletonService() {
    return _instance;
  }

  SingletonService._internal();

  Future<bool> checkNetwork() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
