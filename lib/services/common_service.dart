import 'dart:convert';

import 'package:audit_app/models/audit_model.dart';

import '../models/home_model.dart';
import '../utilities/api_helpers.dart';

Resource<HomeModel> getHomeApi() {
  return Resource(
      url: 'Dashboard/GetHomePage?companyCode=1&userId=610',
      parse: (response) {
        Map<String, dynamic> homeListResultMap = json.decode(response.body);
        HomeModel homeListResult = HomeModel.fromJson(homeListResultMap);
        return homeListResult;
      });
}

Resource<AuditModel> getAuditApi() {
  return Resource(
      url: 'Audit/GetAuditList?mode=ALL&status=ALL',
      parse: (response) {
        print(response.body);
        Map<String, dynamic> auditListResultMap = json.decode(response.body);
        AuditModel auditListResult = AuditModel.fromJson(auditListResultMap);
        return auditListResult;
      });
}