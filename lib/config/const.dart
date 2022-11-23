// ignore_for_file: constant_identifier_names, non_constant_identifier_names
abstract class Configuration {
  String get HOST;
  String get SCHEME;
  int get PORT;
  Map<String, String> get HEADERS => {"Content-Type": "application/json"};
}

class HxConstDEV implements Configuration {
  @override
  String get HOST => 'localhost';
  @override
  int get PORT => 8888;
  @override
  String get SCHEME => 'http';
  @override
  Map<String, String> get HEADERS => {"Content-Type": "application/json"};
}

class HxConstPROD implements Configuration {
  @override
  Map<String, String> get HEADERS => {"Content-Type": "application/json"};

  @override
  String get HOST => 'cosmosurgeserver.xyz';

  @override
  int get PORT => 443;

  @override
  String get SCHEME => 'https';
}

class Environment {
  static final Environment _singleton = Environment._internal();

  factory Environment() {
    return _singleton;
  }
  Environment._internal();

  static const String DEV = 'DEV';
  static const String PROD = 'PROD';

  late Configuration config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  Configuration _getConfig(String environment) {
    switch (environment) {
      case DEV:
        return HxConstDEV();
      default:
        return HxConstPROD();
    }
  }
}
