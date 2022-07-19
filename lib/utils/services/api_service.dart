import 'dart:convert';

import 'package:consume_rest_api_app/utils/constants/api_constants.dart';
import 'package:consume_rest_api_app/models/album_model.dart';
import 'package:consume_rest_api_app/models/user_model.dart';
import 'package:consume_rest_api_app/models/waifu_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

class ApiService {
  //get users from jsonplaceholder
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

  //post album to jsonplaceholder
  Future<Album> createAlbum(String title) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.albumsEndpoint);
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
      }),
    );
    if (response.statusCode == 201) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Album loading failed!');
    }
  }

  //get single waifu pic url
  Future<SingleWaifu?> getSingleWaifu() async {
    try {
      var url = Uri.parse(ApiConstants.imgBaseUrl + ApiConstants.sfwWaifu);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return SingleWaifu.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //post image to waifu.pic (but get 30 url pics)
  Future<ManyWaifus> createUnlistWaifu() async {
    var url = Uri.parse(
        ApiConstants.imgBaseUrl + ApiConstants.many + ApiConstants.sfwWaifu);
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode({'files': []}),
    );
    if (response.statusCode == 200) {
      return ManyWaifus.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Getting waifu failed!');
    }
  }
}
