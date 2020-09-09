import 'dart:convert' as convert;
import 'package:dio/dio.dart';

// Saves the return access to the backend.
class ApiResponse {

  final bool ok;
  final dynamic result;

  final String error;

  // static method to create ApiResponse instance
  static create(Response response, String error) {
    return isOk(response?.statusCode) ?
      ApiResponse._ok(_convert(response?.data)):
        ApiResponse._error(error, result: _convert(response?.data));
  }

  // static method to compare code.
  static bool isOk(int code) {
    return code == 200 || code == 201;
  }

  // converts string to map<string, dynamic>.
  static dynamic _convert(data){
    try {
      if(data is String)
        return convert.jsonDecode(data);
    }catch(e) {}
    return data;
  }

  // named constructor, isOK == true
  ApiResponse._ok(this.result):
    ok = true,
    error = null;

  // named constructor, isOK == false
  ApiResponse._error(this.error, { this.result }):
    ok = false;


  @override
  String toString() {
    return 'ApiResponse{ok: $ok, result: $result, _error: $error}';
  }
}