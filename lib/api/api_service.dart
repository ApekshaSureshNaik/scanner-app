import 'package:http/http.dart' as http;
import 'package:scanner_app/models/event_list_model.dart';
import 'package:scanner_app/utils/constants.dart';
import 'package:scanner_app/utils/custom_functions.dart';
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  login(String email, String password) async {
    http.Response response = await http.post(
      Uri.parse('${Constants.BASE_URL}?rest_route=/simple-jwt-login/v1/auth'),
      body: jsonEncode({'email': email, 'password': password}),
    );
    print(response);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        final jwt = data['data']['jwt'];
        await validateLoggedInUser(jwt);
        return jwt;
      }
    } else {
      Map<String, dynamic> body = jsonDecode(response.body);
      String errors = body.toString();
    }
  }

  validateLoggedInUser(String jwt) async {
    http.Response response = await http.post(
      Uri.parse(
        '${Constants.BASE_URL}?rest_route=/simple-jwt-login/v1/auth/validate&',
      ),
      body: jsonEncode({'jwt': jwt}),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("data ${data['success']}");
      if (data['success'] == true) {
        print('api key ${data['data']['civi_key']['api_key']} ');
        final apiKey = data['data']['civi_key']['api_key'];
        print('rolesList ${data['data']['roles']} ');
        final List<String> roles = List<String>.from(data['data']['roles']);
        print('rolesList $roles ');
        SharedPreferences res = await SharedPreferences.getInstance();
        res.setString('apikey', apiKey);
        res.setStringList('rolesList', roles);
      }
    } else {
      Map<String, dynamic> body = jsonDecode(response.body);
      String errors = body.toString();
    }
  }

  Future<EventListModel> eventLists() async {
    var url = Uri.parse(
      '${Constants.BASE_URL}/index.php/civicrm/ajax/api4/Event/get',
    );
    print("events lists url $url");

    final dynamic bodyData = {
      "select": ["*", "custom.*"],
      "where": [
        [
          "OR",
          [
            ["Is_Pathshala_Event_.Is_Pathshala_Event_", "IS NULL"],
            ["Is_Pathshala_Event_.Is_Pathshala_Event_", "=", 0],
          ],
        ],
        ["is_public", "=", true],
      ],
      "chain": {
        "name_me_0": [
          "Participant",
          "get",
          {
            "select": [
              "SUM(fee_amount) AS total_fee",
              "COUNT(*) AS total_participants",
            ],
            "where": [
              ["event_id", "=", "\$id"],
            ],
          },
        ],
      },
      "checkPermissions": true,
      "orderBy": {"id": "DESC"},
    };

    SharedPreferences res = await SharedPreferences.getInstance();
    final apiKey = res.getString('apikey');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'X-Civi-Auth': 'Bearer $apiKey',
      },
      body: jsonEncode(bodyData),
    );

    if (response.statusCode == 200) {
      print('Success: ${response.body}');
      var jsonData = jsonDecode(response.body);
      var liveEventList = liveEvents(jsonData["values"]);
      return EventListModel.fromJson({"values": liveEventList});
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      // return an empty model to avoid null
      return EventListModel.empty();
    }
  }

  Future<String> fetchEventImage(int? imageId) async {
    if (imageId == null) {
      return 'No Image'; // no image available
    }

    SharedPreferences res = await SharedPreferences.getInstance();
    final apiKey = res.getString('apikey');

    final url =
        Uri.parse(
          '${Constants.BASE_URL}/wp-content/plugins/civicrm/civicrm/extern/rest.php',
        ).replace(
          queryParameters: {
            "entity": "Attachment",
            "action": "get",
            "json": "1",
            "api_key": apiKey ?? "",
            "id": imageId.toString(), // 👈 always convert to String
          },
        );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final imageUrl = data['values']?['$imageId']?['url'];

      if (imageUrl != null && imageUrl is String) {
        return imageUrl;
      }
    }
    return '';
  }
}

final Map<String, String> _setHeaders = <String, String>{
  'Content-type': 'application/json',
  'Accept': 'application/json',
};
