import 'package:flutter/material.dart';
import 'package:to_do/data/network/api_end_point.dart';
import 'package:to_do/data/network/base_ap_service.dart';
import 'package:to_do/data/network/network_service.dart';
import 'package:to_do/models/user.dart';
import 'package:http/src/response.dart';
import 'package:to_do/repository/app_repo.dart';

class UserRepoImpl implements UserRepo {
  final BaseApiService _apiService = NetworApiService();
  @override
  Future<AllUser> getAllUser() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().getAllUser);
      debugPrint("TO-DO $response");
      final jsonData = AllUser.fromJson(response);
      return jsonData;
    } catch (e) {
      debugPrint("TO-DO-E $e}");
      rethrow;
    }
  }

  @override
  Future<User?> getUser() async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndPoints().getUser);
      debugPrint("TO-DO $response");
      final jsonData = User.fromJson(response);
      return jsonData;
    } catch (e) {
      debugPrint("TO-DO-E $e}");
      rethrow;
    }
  }

  @override
  Future<User> registerUser() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().registerUser);
      debugPrint("TO-DO $response");
      final jsonData = User.fromJson(response);
      return jsonData;
    } catch (e) {
      debugPrint("TO-DO-E $e}");
      rethrow;
    }
  }

  @override
  Future<User?> signInUser() async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndPoints().getUser);
      debugPrint("TO-DO $response");
      final jsonData = User.fromJson(response);
      return jsonData;
    } catch (e) {
      debugPrint("TO-DO-E $e}");
      rethrow;
    }
  }

  @override
  Future<Response> updateUser() {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}

@override
Future<User?> getUser() {
  // TODO: implement getUser
  throw UnimplementedError();
}

@override
Future<Response> registerUser() {
  // TODO: implement registerUser
  throw UnimplementedError();
}

@override
Future<User?> signInUser() {
  // TODO: implement signInUser
  throw UnimplementedError();
}

@override
Future<Response> updateUser() {
  // TODO: implement updateUser
  throw UnimplementedError();
}
