import 'dart:convert';
import 'dart:developer';
import 'package:form1/pages/loginpage.dart';
import 'package:http/http.dart' as http;
import '../modals/jwt_model.dart';

JwtModel? finalkey;
JwtModel? finalkey2;
int loginresponse = 0;

class ServiceApi {
  Future<JwtModel?> submitData(
    String username,
    String email,
    String password,
  ) async {
    var body = {"username": username, "email": email, "password": password};

    final response = await http.post(
        Uri.parse('https://herokunew123.herokuapp.com/api/auth/local/register'),
        body: body);
    var data = jsonDecode(response.body);
    print(data);

    if (response.statusCode == 200) {
      print('Successfully Post');
      var jwtKey = JwtModel.fromJson(data);
      finalkey = jwtKey;
      return jwtKey;

      // If the server did return a 201 CREATED response,
      // then parse the JSON.

    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create ApplicationForm Form.');
    }
  }

  Future<JwtModel?> LoginData(
    String email,
    String password,
  ) async {
    var body = {"identifier": email, "password": password};

    final response = await http.post(
        Uri.parse('https://herokunew123.herokuapp.com/api/auth/local'),
        body: body);
    var data = jsonDecode(response.body);
    print(data);
    loginresponse = response.statusCode;
    if (loginresponse == 200) {
      loginstatus = 'Successfully Login';
      var jwtKey2 = JwtModel.fromJson(data);
      finalkey2 = jwtKey2;

      return finalkey2;

      // If the server did return a 201 CREATED response,
      // then parse the JSON.

    } else {
      loginstatus = 'Invalid Email or Password';
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create ApplicationForm Form.');
    }
  }
}
