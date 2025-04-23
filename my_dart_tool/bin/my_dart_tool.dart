import 'dart:io';

import 'package:args/args.dart';

import 'clean_pubspec.dart';
import 'generate_env.dart';
import 'generate_export.dart';

const String version = '0.0.1';

void main(List<String> arguments) async {
  final parser =
      ArgParser()
        ..addFlag('help', abbr: 'h', negatable: false, help: 'Show help.')
        ..addFlag('version', negatable: false, help: 'Show tool version.')
        ..addFlag('verbose', abbr: 'v', negatable: false, help: 'Verbose output')
        ..addCommand('env')
        ..addCommand('export')
        ..addCommand('clean');

  try {
    final results = parser.parse(arguments);

    if (results['help'] == true || results.command == null) {
      printUsage(parser);
      return;
    }

    if (results['version'] == true) {
      print('my_dart_tool version: $version');
      return;
    }

    switch (results.command!.name) {
      case 'env':
        final dir = results.command!.rest.isNotEmpty ? Directory(results.command!.rest.first) : Directory.current;
        runGenerateEnv(dir);
        break;

      case 'export':
        if (results.command!.rest.isEmpty) {
          print('❌ Please provide a project name for export.');
          return;
        }
        runGenerateExports(results.command!.rest.first);
        break;

      case 'clean':
        await runCleanPubspec();
        break;

      default:
        print('❌ Unknown command: ${results.command?.name}');
        printUsage(parser);
    }
  } on FormatException catch (e) {
    print('❌ ${e.message}\n');
    printUsage(parser);
  }
}

void printUsage(ArgParser parser) {
  print('''
Usage: dart my_dart_tool.dart <command> [options]

Commands:
  env [project_path]      Generate .env.g.dart from .env
  export <project_path>   Generate exports for all .dart files in lib/
  clean                   Run flutter clean and optionally update pubspec environments

Options:
${parser.usage}
''');
}
