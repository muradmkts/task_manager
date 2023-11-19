import 'package:http/http.dart';
import 'dart:convert';

import 'network_response.dart';

class NetworkCaller {
  Future postRequest(String url, {Map<String, dynamic>? body}) async {
    try {
      final Response response =
          await post(Uri.parse(url), body: jsonEncode(body), headers: {
        "Content-type": "Application/jason",
      });

      if (response.statusCode == 200) {
        return NetworkResponse(
            isSuccess: true,
            jsonResponse: jsonDecode(response.body),
            statusCode: 200);
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            jsonResponse: jsonDecode(response.body));
      }
    } catch (e) {
      return NetworkResponse(isSuccess: false, errorMassege: e.toString());
    }
  }
}

