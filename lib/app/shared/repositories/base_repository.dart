import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'package:marvel_app/app/environment.dart';
import 'package:marvel_app/app/shared/models/api_response.dart';

class BaseRepository {

  Environment _environment;
  Dio _dio;

  BaseRepository(this._environment) {
    _dio = Dio(BaseOptions(
        baseUrl: _environment.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000 // 60 seconds
    ));
  }

  /// default GET method.
  Future<ApiResponse> get(String endpoint, String error, {headers}) async {
    return _process(
        _dio.get(endpoint,
            options: Options(
              headers: headers,
            ),
            queryParameters: _hashParams),
        error);
  }

  /// Method responsible for handling the request.
  Future<ApiResponse> _process(Future request, String defaultError) async {
    ApiResponse apiResponse;
    try {
      Response response = await request;
      apiResponse = ApiResponse.create(response, defaultError);
    } on DioError catch (e) {
      apiResponse = ApiResponse.create(e.response, defaultError);
    }
    return apiResponse;
  }

  /*
   Server-side applications must pass two parameters in addition to the apikey parameter:
  ts - a timestamp (or other long string which can change on a request-by-request basis)
  hash - a md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)
  For example, a user with a public key of "1234" and a private key of "abcd" could construct a valid call as follows:
 http://gateway.marvel.com/v1/public/characters?ts=${ts}&apikey=${publicKey}&hash=${hash}
  (the hash value is the md5 digest of 1abcd1234)
  * */
  /// Create a mao with params hash.
  Map<String, dynamic> get _hashParams {
    String ts = DateTime.now().millisecondsSinceEpoch.toString();
    String hash =
        md5.convert(utf8.encode(ts + _environment.privateKey +
            _environment.publicKey)).toString();
    return {"ts": ts, "apikey": _environment.publicKey, "hash": hash};
  }
}
