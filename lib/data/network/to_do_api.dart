import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

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
  var request = http.Request('GET', Uri.parse('https://todo22a.herokuapp.com/api/v1/task/'));
  
  
  http.StreamedResponse response = await request.send();
  
  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }
  
}