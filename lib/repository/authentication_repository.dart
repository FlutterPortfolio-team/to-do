import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/data/end_points.dart';
import 'package:to_do/models/user.dart';

import '../data/network/api_end_point.dart';

class AuthenticationRepository {
  final _service = ApiEndpoint();
/* This is crucial,
*
* from Api Service to repository to view model to ui
*
* this is the chain
* */

  Future signUpUser({
    String? name,
    String? emailAddress,
    String? phoneNumber,
    String? country,
    String? password,
  }) async {
    final signUpResponse = await _service.post(
      "/register",
      {
        'name': name,
        'email': emailAddress,
        'phone_number': phoneNumber,
        'country': country,
        'password': password,
      },
    );

    print(signUpResponse);
    return signUpResponse;
  }
}

customToast(String msg) {
  Fluttertoast.showToast(
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
    msg: msg,
  );
}

class AuthRepo {
  final ApiEndpoint _api = ApiEndpoint();
  User user = User();

  Future<dynamic> signUpUser(
    String username,
    String email,
    String password,
  ) async {
    try {
      final response = await _api.post(signUp, {
        'username': username,
        'email': email,
        'password': password,
      });
      final body = jsonDecode(response);
      if (body['code'] == 'ER_DUP_ENTRY') {
        return null;
      } else {
        user = userFromJson(response);
        return user;
      }
    } catch (err) {
      log(err.toString());
      return null;
    }
  }

  Future signInUser(String email, String password) async {
    try {
      final response = await _api.post(signIn, {
        'email': email,
        'password': password,
      });
      final body = jsonDecode(response);
      if (body['status'] == true) {
        final userResonse = body['data'];
        user = User(
          id: userResonse['id'],
          username: userResonse['username'],
          email: userResonse['email'],
          password: userResonse['password'],
        );
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt('id', user.id!);
        prefs.setString('username', userResonse['username']);
        return user;
      }
    } catch (err) {
      return null;
    }
  }

  Future updateUser(
    String username,
    String email,
    String password,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var id = prefs.getInt('id');
      final response = await _api.put('$update +${id.toString()}', {
        'username': username,
        'email': email,
        'password': password,
      });
      final body = userFromJson(response);
      if (jsonDecode(response)['code'] == 'ER_DUP_ENTRY') {
        // throw Exception('User Alreay Exists');
        return null;
      } else {
        user = User(
            id: body.id,
            username: body.username,
            email: email,
            password: body.password);
        return user;
      }
    } catch (err) {
      return null;
    }
  }
}
