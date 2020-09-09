import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'package:marvel_app/app/shared/models/api_response.dart';

class BaseRepository {

  /*
   Server-side applications must pass two parameters in addition to the apikey parameter:
  ts - a timestamp (or other long string which can change on a request-by-request basis)
  hash - a md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)
  For example, a user with a public key of "1234" and a private key of "abcd" could construct a valid call as follows:
 http://gateway.marvel.com/v1/public/characters?ts=${ts}&apikey=${publicKey}&hash=${hash}
  (the hash value is the md5 digest of 1abcd1234)
  * */

  static const String PUBLIC_KEY = "1aa3e591a48014d52354ab0edffde18f";
  static const String PRIVATE_KEY = "1a1798079ad28fc9240a63f849607f1c46907021";

  static const String ERROR_CONNEXION = "Problemas com sua conexão. Tente novamente mais tarde.";
  static const String ERROR_SERVER = "Serviço não encontrado ou servidor fora do ar.";
  static const String ERROR_TIMEOUT = "O serviço está demorando muito para responder.";

  // create dio instance with configs to intercept the request, response and error.
  final Dio _dio = Dio(BaseOptions(
      baseUrl: "http://gateway.marvel.com/v1/public",
      receiveDataWhenStatusError: true,
      connectTimeout: 60*1000, // 60 seconds
      receiveTimeout: 60*1000 // 60 seconds
  ));

  /// default GET method.
  Future<ApiResponse> get(String endpoint, String error, { headers }) async {
    return _process(_dio.get(endpoint,
      options: Options(headers: headers,), queryParameters: _hashParams ), error);
  }

  /// Method responsible for handling the request.
  Future<ApiResponse> _process(Future request, String error) async {
    ApiResponse apiResponse;
    try {
      Response response = await request;
      apiResponse = ApiResponse.create(response, error);
    } on DioError catch(e) {
      apiResponse = ApiResponse.create(e.response,
          _getErrorMessage(e, error));
    }
    return apiResponse;
  }

  /// Create a mao with params hash.
  Map<String, dynamic>  get _hashParams {
    String ts = DateTime.now().millisecondsSinceEpoch.toString();
    String hash = md5.convert(utf8.encode(ts+PRIVATE_KEY+PUBLIC_KEY)).toString();
    return {
      "ts": ts,
      "apikey": PUBLIC_KEY,
      "hash": hash
    };
  }

  /// Return error message
  String _getErrorMessage(DioError e, String defaultError){
    switch(e.type){
      case DioErrorType.DEFAULT: return ERROR_CONNEXION;
      case DioErrorType.CONNECT_TIMEOUT: return ERROR_TIMEOUT;
      default: return defaultError;
    }

  }
}
