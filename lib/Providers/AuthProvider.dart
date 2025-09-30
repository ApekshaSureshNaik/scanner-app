import 'package:flutter/cupertino.dart';
import 'package:scanner_app/api/api_service.dart';

class AuthProvider with ChangeNotifier {
  bool isAuthenticated = false;

  AuthProvider();
  Future<String> login(String email,String password) async {
   var body = {
     "email":email,
     "password":password
   };

    //String token = await ApiHandler.withoutAuthPost(body, 'rest_route=/simple-jwt-login/v1/auth');
   String token = await ApiService().login(email,password);
   isAuthenticated = true;
   notifyListeners();
   return token;
  }

}