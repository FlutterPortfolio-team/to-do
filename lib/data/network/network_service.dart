import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do/data/app_exception.dart';
import 'package:to_do/data/network/base_ap_service.dart';
import 'package:to_do/models/to_do.dart';
import 'package:to_do/models/user.dart';

class NetworApiService extends BaseApiService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl + url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postUserResponse(String url, User user) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: {
          HttpHeaders.contentTypeHeader: '',
          HttpHeaders.authorizationHeader: '',
        },
        body: userToJson(user),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future postTaskResponse(String url, Task task) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + url),
        headers: {
          HttpHeaders.contentTypeHeader: '',
          HttpHeaders.authorizationHeader: '',
        },
        body: taskToJson(task),
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server with status code : ${response.statusCode}');
    }
  }
}
