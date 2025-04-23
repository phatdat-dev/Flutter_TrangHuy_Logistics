import 'dart:io';

import 'package:path/path.dart' as p;

//? dart bin/my_dart_tool.dart export ../_package_core

void runGenerateExports(String pathToPackage) {
  final absolutePath = Directory(pathToPackage).absolute.path;
  final libFolder = p.join(absolutePath, 'lib');
  final packageName = p.basename(absolutePath);

  final directory = Directory(libFolder);
  if (!directory.existsSync()) {
    print('❌ Folder "$libFolder" not found.');
    return;
  }

  final buffer = StringBuffer();
  buffer.writeln('// Auto-generated file. Do not edit manually.');
  buffer.writeln('library;\n');

  directory.listSync(recursive: true).where((file) => file is File && file.path.endsWith('.dart')).forEach((file) {
    final relativePath = p.relative(file.path, from: libFolder);
    // Bỏ chính file đang được tạo ra nếu đã tồn tại
    if (relativePath == '$packageName.dart') return;
    buffer.writeln("export '$relativePath';");
  });

  final outputFile = File(p.join(libFolder, '$packageName.dart'));
  outputFile.writeAsStringSync(buffer.toString());

  print('✅ Exports generated at: ${outputFile.path}');
}
