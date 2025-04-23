import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

//? dart bin/my_dart_tool.dart env ../_package_core

Future<void> runGenerateEnv(Directory projectDir) async {
  final envFile = File(p.join(projectDir.path, '.env'));
  final pubspecFile = File(p.join(projectDir.path, 'pubspec.yaml'));

  if (!envFile.existsSync()) {
    print('❌ .env file not found in ${projectDir.path}');
    return;
  }

  if (!pubspecFile.existsSync()) {
    print('❌ pubspec.yaml not found in ${projectDir.path}');
    return;
  }

  final pubspecContent = await pubspecFile.readAsString();
  final yamlMap = loadYaml(pubspecContent);
  String outputDir = 'lib/gen';
  final flutterGenConfig = yamlMap['flutter_gen'];
  if (flutterGenConfig is YamlMap && flutterGenConfig['output'] != null) {
    outputDir = flutterGenConfig['output'].toString();
  }

  final outputPath = p.join(projectDir.path, outputDir, 'env.g.dart');
  final outputFile = File(outputPath);
  await outputFile.parent.create(recursive: true);

  final lines = await envFile.readAsLines();
  final buffer = StringBuffer();

  buffer.writeln('// ignore_for_file: non_constant_identifier_names, unused_field\n');
  buffer.writeln("import 'package:flutter_dotenv/flutter_dotenv.dart';\n");
  buffer.writeln('class AppENV {');

  for (var line in lines) {
    if (line.trim().isEmpty || line.trim().startsWith('#')) continue;
    final parts = line.split('=');
    if (parts.length < 2) continue;
    final key = parts[0].trim();
    buffer.writeln("  static String get $key => dotenv.env['$key']!;");
  }

  buffer.writeln('}');

  await outputFile.writeAsString(buffer.toString());

  print('✅ ENV generated at: ${p.relative(outputPath, from: projectDir.path)}');
}
