import 'dart:async' show Future;
import 'dart:convert' show json;

import 'package:flutter/services.dart' show rootBundle;

import 'package:meta/meta.dart';

class SecretConfig {
  SecretConfig({@required this.apiKey});

  final String apiKey;

  static SecretConfig fromJson(Map<String, dynamic> jsonMap) {
    return SecretConfig(apiKey: jsonMap["api_key"]);
  }
}

class SecretConfigLoader {
  static const String _secretPath = "assets/secret_config.json";

  Future<SecretConfig> load() {
    return rootBundle.loadStructuredData<SecretConfig>(_secretPath, (jsonStr) async {
      return SecretConfig.fromJson(json.decode(jsonStr));
    });
  }
}
