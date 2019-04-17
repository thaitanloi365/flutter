import 'package:http/http.dart' as http;
import 'dart:convert';

enum RequestMethod { POST, GET }

class Network {
  static final Network _network = new Network._internal();
  String _baseUrl = "http://192.168.1.43:5000";
  String _token = "";

  Map<String, String> _authorizedHeaders = {
    'Content-type': 'application/json',
  };

  Map<String, String> _unAuthorizedHeaders = {
    'Content-type': 'application/json',
    'X-Token': '',
  };

  factory Network() {
    return _network;
  }

  Network._internal();

  setToken(String token) {
    _token = token;
    _authorizedHeaders['X-Token'] = token;
  }

  String getToken() {
    return _token;
  }

  Future unAuthorizedRequest(
      {String endPoint,
      RequestMethod method = RequestMethod.GET,
      Map body = null}) async {
    var response;
    var _body = body != null ? body : new Map();
    switch (method) {
      case RequestMethod.GET:
        response =
            await http.get("$_baseUrl$endPoint", headers: _unAuthorizedHeaders);
        break;
      case RequestMethod.POST:
        response = await http.post("$_baseUrl$endPoint",
            headers: _unAuthorizedHeaders, body: json.encode(_body));
        break;
    }
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post with statusCode $statusCode');
    }
  }

  Future authorizedRequest(
      {String endPoint,
      RequestMethod method = RequestMethod.GET,
      Map body = null}) async {
    var response;
    var _body = body != null ? body : new Map();
    switch (method) {
      case RequestMethod.GET:
        response =
            await http.get("$_baseUrl$endPoint", headers: _authorizedHeaders);
        break;
      case RequestMethod.POST:
        response = await http.post("$_baseUrl$endPoint",
            headers: _authorizedHeaders, body: json.encode(_body));
        break;
    }
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post with statusCode $statusCode');
    }
  }
}
