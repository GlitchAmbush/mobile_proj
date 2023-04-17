// Kym Gripal

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

Future<bool> saveVariablesToFile(Map<String, dynamic> variables) async {
  try {
    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File('$appDocPath/variables.txt');

    final variableLines = variables.entries.map((entry) {
      final value = entry.value is Map || entry.value is List
          ? jsonEncode(entry.value)
          : entry.value.toString();
      return '${entry.key}: $value';
    }).toList();

    await file.writeAsString(variableLines.join('\n'));
    return true;
  } catch (_) {
    return false;
  }
}

Future<Map<String, dynamic>?> readVariablesFromFile() async {
  try {
    final appDocDir = await getApplicationDocumentsDirectory();
    final file = File('${appDocDir.path}/variables.txt');

    if (!await file.exists()) {
      return null;
    }

    final lines = await file.readAsLines();
    final variables = <String, dynamic>{};

    for (final line in lines) {
      final keyValue = line.split(': ');
      final key = keyValue[0];
      dynamic value;

      switch (key) {
        case 'upgrades':
          value = jsonDecode(keyValue[1]) is List<dynamic>
              ? List<String>.from(jsonDecode(keyValue[1]) as List<dynamic>)
              : jsonDecode(keyValue[1]);
          break;
        case 'achievements':
        case 'collection':
          value = List<String>.from(jsonDecode(keyValue[1]) as List<dynamic>);
          break;
        default:
          value = keyValue[1];
      }

      variables[key] = value;
    }

    return variables;
  } catch (_) {
    return null;
  }
}
