import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:yaml/yaml.dart';

Map<String, dynamic> _data = {};

class Config {
  Future<void> init() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json', cache: false);
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    manifestMap.keys
        .where((String key) => key.contains('config/'))
        .where((String key) => key.contains('.yaml'))
        .toList()
        .forEach((file) async => await _loadConfig(file));
  }

  Future<void> _loadConfig(String filePath) async {
    String configFileContent = await rootBundle.loadString(filePath, cache: false);
    Map<String, dynamic> configMap = (loadYaml(configFileContent) as Map).cast<String, dynamic>();
    _data.addAll(configMap);
  }

  Future<dynamic> getValueByPath(String path) async {
    if (_data.isEmpty) {
      await init();
    }

    final keys = path.split('/');

    dynamic current = _data;
    for (final key in keys) {
      if (current is Map<String, dynamic> && current.containsKey(key)) {
        current = current[key];
      } else {
        return null;
      }
    }
    return current;
  }
}
