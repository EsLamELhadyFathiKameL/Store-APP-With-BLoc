import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApiService {
  Future<dynamic> myGetRequestService(
      {required String request, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    final urL = Uri.parse(request);
    http.Response response = await http.get(urL, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "Error With statusCode :${response.statusCode} With Body :${response.body}",
      );
    }
  }

  Future<dynamic> myPostRequestService(
      {required String request, required dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    final urL = Uri.parse(request);
    http.Response response = await http.post(urL, body: body, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "Error With statusCode :${response.statusCode} With Body :${response.body}",
      );
    }
  }

  Future<dynamic> myPutRequestService(
      {required String request, required dynamic body, String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    final urL = Uri.parse(request);
    http.Response response = await http.put(urL, body: body, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "Error With statusCode :${response.statusCode} With Body :${response.body}",
      );
    }
  }
}
