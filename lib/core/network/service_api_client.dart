// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// import 'network.dart';

// class ServerApiClient {

//   ServerApiClient(); 

//   Future<String> get({required String method, required bool isEnglish}) async {
//     try {
//       Response? response;
//       switch (method) {
//         case ServerApiConstants.getUserInfo:
//           response = await http.get(Uri.parse(isEnglish ? ServerApiConstants.userInfo : ServerApiConstants.userInfoES));
//           break;
//         default:
//           response = null;
//       }
//       if(response != null && response.statusCode == 200){
//         return response.body;
//       } else {
//         throw ServerException();
//       }
//     } catch (e) {
//       throw ServerException(message: e.toString());
//     }
//   }
// }

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/foundation.dart';

import '../network/exception.dart';
import 'server_api_constants.dart';

class ServerApiClient {

  final Map<String, String> _authHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  ServerApiClient();

  Future<void> _checkInternetConnection() async {
    final hasConnection = await InternetConnectionChecker().hasConnection.timeout(
      const Duration(seconds: 5),
      onTimeout: () => false,
    );
    if (!hasConnection) {
      throw ConnectionException(message: 'No internet connection detected. Please check your connection and try again.');
    }
  }

  Future<void> _restoreAuthHeaders() async {
    // Lógica para restaurar los headers de autenticación
  }

  Future<http.Response> _makeRequest({
    required String method,
    required Uri url,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
    required bool isEnglish,
  }) async {
    await _checkInternetConnection();
    await _restoreAuthHeaders();

    if (headers != null) {
      _authHeader.addAll(headers);
    }

    http.Response response;
    try {
      switch (method.toLowerCase()) {
        case 'get':
          response = await http.get(url, headers: _authHeader);
          break;
        case 'post':
          response = await http.post(url, headers: _authHeader, body: jsonEncode(body), encoding: encoding);
          break;
        case 'put':
          response = await http.put(url, headers: _authHeader, body: jsonEncode(body), encoding: encoding);
          break;
        default:
          throw UnsupportedError("Method $method not supported");
      }

      if (kDebugMode) log(_formatResponseLog(response));
      return _processResponse(
        response: response,
        requestFunc: () => _makeRequest(
          method: method,
          url: url,
          headers: headers,
          body: body,
          encoding: encoding,
          isEnglish: isEnglish
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> get({
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    required bool isEnglish,
  }) async {
    final url = Uri.parse(isEnglish ? ServerApiConstants.userInfo : ServerApiConstants.userInfoES);
    return _makeRequest(method: 'get', url: url, headers: headers, isEnglish: isEnglish);
  }


  Future<T> _processResponse<T>({
    required http.Response response,
    required Future<T> Function() requestFunc,
  }) async {
    if (response.statusCode >= 200 && response.statusCode <= 300) {
      return response as T;
    } else if (response.statusCode >= 400 && response.statusCode <= 500) {
      var respuesta = ResponseWithoutResultModel.fromJson(
        jsonDecode(response.body),
      );
      throw ServerException(message: respuesta.messageResponse.description);
    } else if (response.statusCode >= 500) {
      throw ServerException(message: "Service not available. Contact the administrator");
    } else {
      return response as T;
    }
  }

  String _formatResponseLog(http.Response response) {
    return 'Response: ${response.statusCode} - ${response.body}';
  }
}



// Modelo de respuesta de error
class ResponseWithoutResultModel {
  final MessageResponse messageResponse;

  ResponseWithoutResultModel({required this.messageResponse});

  factory ResponseWithoutResultModel.fromJson(Map<String, dynamic> json) {
    return ResponseWithoutResultModel(
      messageResponse: MessageResponse.fromJson(json),
    );
  }
}

class MessageResponse {
  final String description;

  MessageResponse({required this.description});

  factory MessageResponse.fromJson(Map<String, dynamic> json) {
    return MessageResponse(description: json['description'] ?? "An error occurred with the service, please contact the administrator.");
  }
}
