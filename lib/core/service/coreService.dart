import 'package:dio/dio.dart';
import '../constants/constantsStringApp.dart';

abstract class CoreService {
  static Dio dio = Dio();
  static late Response responsee;
  static String baseUrl=apiBaseUrl;
}
