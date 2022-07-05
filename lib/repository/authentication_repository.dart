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
