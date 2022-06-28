import 'package:to_do/models/to_do.dart';
import 'package:to_do/models/user.dart';

abstract class BaseApiService {
  final String baseUrl = "https://todo22a.herokuapp.com/api/v1/user/register";

  Future<dynamic> getResponse(String url);
  Future<dynamic> postUserResponse(String url, User user);
  
  Future<dynamic> postTaskResponse(String url, Task task);
}
