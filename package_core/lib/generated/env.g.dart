// ignore_for_file: non_constant_identifier_names, unused_field

import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppENV {
  static String get BASE_URL_PROD => dotenv.env['BASE_URL_PROD']!;
  static String get BASE_URL_DEV => dotenv.env['BASE_URL_DEV']!;
  static String get API_KEY => dotenv.env['API_KEY']!;
  static String get Encrypt_Key => dotenv.env['Encrypt_Key']!;
  static String get Encrypt_IV => dotenv.env['Encrypt_IV']!;
  static String get KEY_GoogleGenerativeAI => dotenv.env['KEY_GoogleGenerativeAI']!;
  static String get API_KEY_HUGGINGFACE => dotenv.env['API_KEY_HUGGINGFACE']!;
  static String get ZALO_OA_REFRESH_TOKEN => dotenv.env['ZALO_OA_REFRESH_TOKEN']!;
}
