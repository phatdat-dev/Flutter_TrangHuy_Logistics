import 'dart:io';

//? dart run  my_dart_tool/bin/my_dart_tool.dart clean

// Cấu hình chỉnh sửa environment
const bool shouldUpdateEnvironment = true;
const String newFlutterVersion = '3.32.0';
const String newSdkVersion = '3.8.0';

/// Clean Flutter projects and optionally update pubspec.yaml environment versions
Future<void> runCleanPubspec() async {
  final currentDir = Directory.current;

  print('=== Cleaning Flutter projects and deleting pubspec.lock files ===');

  final dirs = [currentDir, ...await _getImmediateSubfolders(currentDir)];

  for (final dir in dirs) {
    final basename = dir.path.split('/').last;
    final pubspecFile = File('${dir.path}/pubspec.yaml');
    final lockFile = File('${dir.path}/pubspec.lock');

    if (await pubspecFile.exists()) {
      print('Running flutter clean in: $basename');
      await Process.run('flutter', ['clean'], workingDirectory: dir.path);

      if (await lockFile.exists()) {
        print('Deleting pubspec.lock in: $basename');
        await lockFile.delete();
      }
      print('Loading pubspec.yaml in: $basename');
      await Process.run('flutter', ['pub', 'get', '--no-example'], workingDirectory: dir.path);

      if (shouldUpdateEnvironment) {
        await _updateEnvironment(pubspecFile);
      }
    }
  }

  print('✅ Done!');
}

Future<List<Directory>> _getImmediateSubfolders(Directory dir) async {
  final List<Directory> folders = [];

  await for (var entity in dir.list(followLinks: false)) {
    if (entity is Directory) {
      folders.add(entity);
    }
  }

  return folders;
}

Future<void> _updateEnvironment(File pubspecFile) async {
  final lines = await pubspecFile.readAsLines();

  final updatedLines = <String>[];
  bool inEnvironment = false;

  for (final line in lines) {
    if (line.trim().startsWith('environment:')) {
      inEnvironment = true;
      updatedLines.add('environment:');
      continue;
    }

    if (inEnvironment) {
      if (line.trim().startsWith('sdk:')) {
        updatedLines.add('  sdk: "$newSdkVersion"');
        continue;
      } else if (line.trim().startsWith('flutter:')) {
        updatedLines.add('  flutter: "$newFlutterVersion"');
        inEnvironment = false; // done updating
        continue;
      } else if (!line.startsWith(' ')) {
        inEnvironment = false;
      }
    }

    updatedLines.add(line);
  }

  await pubspecFile.writeAsString(updatedLines.join('\n'));
  print('Updated environment in: ${pubspecFile.path}');
}
