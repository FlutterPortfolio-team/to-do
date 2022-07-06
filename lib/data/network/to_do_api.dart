import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<String> createTask({
  required int userId,
  required String title,
}) async {
  var request = http.Request(
      'POST', Uri.parse('https://todo22a.herokuapp.com/api/v1/task'));
  request.body =
      '''{\r\n    \r\n   "user_id":"$userId",\r\n\t"todo": "$title"\r\n\t\r\n    \r\n}''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return (await response.stream.bytesToString());
  } else {
    Fluttertoast.showToast(
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      msg: 'Failed to create task. Check your connection!! ',
    );
    throw Exception('Network Problem');
  }
}


void main() async {
  var task = getTaskByUser(userId: 10);
}

Future<http.StreamedResponse> getTaskByUser({required int userId}) async {
  var request = http.Request('GET',
      Uri.parse('https://todo22a.herokuapp.com/api/v1/task/user/$userId'));

  http.StreamedResponse response = await request.send();
  if (response.statusCode == 200) {
    return response;
  }
  throw Exception('Bad connection');
}

Future<http.StreamedResponse> getTaskById(String id) async {
  var request = http.Request(
      'GET', Uri.parse('https://todo22a.herokuapp.com/api/v1/task/$id'));

  http.StreamedResponse response = await request.send();

  return response;
}

Future<http.StreamedResponse> getAllTask() async {
  var request = http.Request(
      'GET', Uri.parse('https://todo22a.herokuapp.com/api/v1/task/'));

  http.StreamedResponse response = await request.send();

  return response;
}

Future<http.StreamedResponse> filterTask() async {
  var request = http.Request('GET',
      Uri.parse('https://todo22a.herokuapp.com/api/v1/task/filter/true'));

  http.StreamedResponse response = await request.send();

  return response;
}

Future<http.StreamedResponse> deleteTask() async {
  var request = http.Request(
      'DELETE', Uri.parse('https://todo22a.herokuapp.com/api/v1/task/2'));

  http.StreamedResponse response = await request.send();

  return response;
}

Future<http.StreamedResponse> updateTask() async {
  var request = http.Request(
      'PUT', Uri.parse('https://todo22a.herokuapp.com/api/v1/task/edit/3'));
  request.body =
      '''{\r\n    \r\n   \r\n    "todo": "get a cold bbbbeer"\r\n     \r\n\t\r\n    \r\n}''';

  http.StreamedResponse response = await request.send();

  return response;
}
