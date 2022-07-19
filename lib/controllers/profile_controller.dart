import 'package:consume_rest_api_app/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class ProfileController extends ChangeNotifier {
  late String _name;
  late String _email;
  late Address _address;
  late Company _company;
  late String _phone;
  String _photo = '';
  late String _website;
  late String _username;

  String get name => _name;
  String get email => _email;
  Address get address => _address;
  Company get company => _company;
  String get phone => _phone;
  String get photo => _photo;
  String get website => _website;
  String get username => _username;

  set changeName(String name) {
    _name = name;
    notifyListeners();
  }

  set changeEmail(String email) {
    _email = email;
    notifyListeners();
  }

  set changeAddress(Address address) {
    _address = address;
    notifyListeners();
  }

  set changeCompany(Company company) {
    _company = company;
    notifyListeners();
  }

  set changePhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  set changePhoto(String photo) {
    _photo = photo;
    notifyListeners();
  }

  set changeWebsite(String website) {
    _website = website;
    notifyListeners();
  }

  set changeUsername(String username) {
    _username = username;
    notifyListeners();
  }
}
