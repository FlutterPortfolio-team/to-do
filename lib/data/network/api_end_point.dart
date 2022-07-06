import 'package:http/http.dart' as http;


class ApiEndpoint {
  static const baseUrl ="https://";

  Future post(String endPoint, Map<String, dynamic>? body) async {
    http.Response response;
    try {
      var url = Uri.parse(baseUrl + endPoint);
      response = await http.post(url, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401) {
        throw http.ClientException('Unauthorized');
      } else if (response.statusCode == 500) {
        throw http.ClientException('Server error');
      } else {
        throw Exception('Oh darn! Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future get(
      String endPoint,
      ) async {
    http.Response response;
    try {
      var url = Uri.parse(baseUrl + endPoint);
      response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401) {
        throw http.ClientException('Unauthorized');
      } else if (response.statusCode == 500) {
        throw http.ClientException('Server error');
      } else {
        throw Exception('Oh darn! Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future delete(String endPoint, Map<String, dynamic>? body) async {
    http.Response response;
    try {
      var url = Uri.parse(baseUrl + endPoint);
      response = await http.delete(url, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401) {
        throw http.ClientException('Unauthorized');
      } else if (response.statusCode == 500) {
        throw http.ClientException('Server error');
      } else {
        throw Exception('Oh darn! Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future patch(String endPoint, Map<String, dynamic>? body) async {
    http.Response response;
    try {
      var url = Uri.parse(baseUrl + endPoint);
      response = await http.patch(url, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401) {
        throw http.ClientException('Unauthorized');
      } else if (response.statusCode == 500) {
        throw http.ClientException('Server error');
      } else {
        throw Exception('Oh darn! Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future put(String endPoint, Map<String, dynamic>? body) async {
    http.Response response;
    try {
      var url = Uri.parse(baseUrl + endPoint);
      response = await http.put(url, body: body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else if (response.statusCode == 401) {
        throw http.ClientException('Unauthorized');
      } else if (response.statusCode == 500) {
        throw http.ClientException('Server error');
      } else {
        throw Exception('Oh darn! Something went wrong');
      }
    } catch (e) {
      throw Exception(e);
    }
  }


}
