import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthURLs {
  static String baseUrl = 'https://rawat3-dev-ed.my.salesforce.com/services/apexrest';
  static String orgURL = 'https://cloudcertitudeprivatelimit8-dev-ed.develop.my.salesforce-sites.com/flutterApp/services/apexrest';
   static getAccessToken() async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          'BrowserId=_5nI-V6kEe6RaGkboT4stA; CookieConsentPolicy=0:1; LSKey-c\$CookieConsentPolicy=0:1'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://rawat3-dev-ed.my.salesforce.com/services/oauth2/token'));
    request.bodyFields = {
      'client_id':
          '3MVG9pRzvMkjMb6muKOdZ5DBZvu0PgaUCt5wJmu.Zd29PyCPTLu1IBNEQOMmo9OQCuGNL6ndx0VKHArpFMme5',
      'client_secret':
          'AF37C14C71862A432B2187BC4A602CCA2B7876427B1283BAD33E20534EBA0E68',
      'grant_type': 'client_credentials'
    };
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      var mapData = jsonDecode(responseData);
      return mapData['access_token'];
    } else {
      return null;
    }
  }
}