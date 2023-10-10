
// ignore_for_file: prefer_typing_uninitialized_variables

import '../services/common_service.dart';
import '../services/web_service.dart';

class CommonRepository {
  var webService;
  CommonRepository() {
    webService = Webservice();
  }
  Future getHomeData() => webService?.get(getHomeApi());
  Future getAuditData() => webService?.get(getAuditApi());
}
