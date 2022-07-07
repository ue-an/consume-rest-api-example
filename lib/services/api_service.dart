import 'package:consume_rest_api_app/api_constants.dart';
import 'package:consume_rest_api_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
