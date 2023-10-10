import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../utilities/api_helpers.dart';

class Webservice {
  Future<T> get<T>(Resource<T> resource) async {
    try {
      Response response;
      String token = await getToken();
      if (token.isNotEmpty) {
        response =
        await http.get(getUrl(resource.url!), headers: getHeaders(token));
      } else {
        response = await http.get(getUrl(resource.url!));
      }
      return resource.parse!(response);
    } catch (e) {
      print('***webservice get***' + e.toString());
      throw e;
    }
  }

  Future<T> post<T>(Resource<T> resource) async {
    print(resource.body);
    try {
      Response response;
      String token = await getToken();
      if (token != '') {
        response = await http.post(getUrl(resource.url!),
            body: resource.body, headers: getJsonHeader(token));
      } else {
        response = await http.post(getUrl(resource.url!),
            body: resource.body,headers: getHeadersWithApplicationJson());
      }
      return resource.parse!(response);
    } catch (e) {
      print('**webservice post***' + e.toString());
      throw e;
    }
  }
}