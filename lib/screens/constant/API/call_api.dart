import 'dart:convert';

import 'package:tribb/screens/constant/API/auth_urls.dart';
import 'package:http/http.dart' as http;

class CallAPIs {
  // static createPostRequest( var objName , var objData) async{
  //  final accessToken = await AuthURLs.getAccessToken();
  //  var headers = {
  //     'Authorization': 'Bearer $accessToken',
  //     "Content-Type": "application/json"
  //   };
  //   var request = http.Request(
  //     'POST',
  //     Uri.parse(
  //         '${AuthURLs.baseUrl}/$objName'),
  //   );
  //   request.headers.addAll(headers);
  //   String jsonData = jsonEncode(objData);
  //   request.body = jsonData;
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //     var strData = await response.stream.bytesToString();
  //     var mapData = jsonDecode(strData);
  //     return mapData;
  //   } else {
  //     return await response.stream.bytesToString();
  //   }
  // }
static createPostRequest( var objName , var objData) async{
  final String baseURL = AuthURLs.orgURL;
  final dataResponse = await http.post(
        Uri.parse(
            '$baseURL/$objName'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(objData));
        return dataResponse.body;
}
}