import 'package:audit_app/utilities/shared_preferences.dart';
import 'package:http/http.dart';

import 'base_urls.dart';
import 'constants.dart';

class Resource<T> {
  String? url;
  dynamic body;
  T Function(Response response)? parse;

  Resource({this.url,this.body, this.parse});
}

Future<String> getToken() async {
  return await getValue(Constants.token);
}

Future<String> getId() async {
  return await getValue(Constants.id);
}



Map<String, String> getHeaders(String token) {
  return {"CompanyCode": "1","UserId":"610","appType":"MOB","Authorization": 'Bearer $token',};
}

Map<String, String> getHeadersWithApplicationJson() {
  return {"Content-Type": 'application/json'};
}


Map<String, String> getJsonHeader(String token) {
  return {"Authorization": 'Bearer ' + token,"Content-Type": 'application/json'};
}

Map<String, String> getAuthHeaders(String token) {
  return {"Authorization": 'Basic ' + token};
}

Uri getUrl(String component) {
  var url= Uri.parse(BaseUrls.devApiBaseUrl + component);
  return url;
}

Map<String, String> getJsonContent() {
  return {"Content-Type": 'application/json'};
}

