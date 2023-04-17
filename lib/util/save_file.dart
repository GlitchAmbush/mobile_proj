// Kym Gripal

import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<bool> saveVariablesToFile(Map<String, dynamic> variables) async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  File file = File('$appDocPath/variables.txt');

  StringBuffer buffer = StringBuffer();
  variables.forEach((key, value) {
    buffer.writeln('$key: $value');
  });

  try {
    await file.writeAsString(buffer.toString());
    return true;
  } catch (e) {
    return false;
  }
}
