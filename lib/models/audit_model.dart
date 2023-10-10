// To parse this JSON data, do
//
//     final auditModel = auditModelFromJson(jsonString);

import 'dart:convert';

AuditModel auditModelFromJson(String str) => AuditModel.fromJson(json.decode(str));

String auditModelToJson(AuditModel data) =>  json.encode(data.toJson());

class AuditModel {
  int? auditId;
  int? headerId;
  int? scheduleId;
  int? templateId;
  int? conductedByEmp;
  dynamic hseComplaintRating;
  int? uiid;
  dynamic auditTeam;
  String? auditNo;
  String? auditType;
  dynamic auditTypeDesc;
  String? auditTitle;
  dynamic templateName;
  dynamic btnDeleteData;
  String? condutedByDept;
  dynamic condutedByDeptName;
  String? conductedByEmpName;
  String? auditDesc;
  String? auditLocation;
  dynamic locationId;
  String? auditLocationDesc;
  String? reference;
  dynamic auditStatus;
  dynamic actionId;
  dynamic closureComments;
  dynamic closureCode;
  dynamic closureCodeDesc;
  dynamic closedBy;
  bool? isBtnStart;
  bool? isBtnSave;
  bool? isBtnFinalSave;
  bool? isBtnFinish;
  bool? isAuTab;
  DateTime? startDate;
  DateTime? endDate;
  dynamic closureDate;
  dynamic actionNo;
  dynamic priority;
  dynamic status;
  dynamic actionOwner;
  dynamic actionStatus;
  dynamic targetDate;
  dynamic year;
  int? userId;
  int? keyId;
  int? companyCode;
  dynamic opsMode;
  dynamic appType;
  dynamic date1;
  dynamic date2;

  AuditModel({
    this.auditId,
    this.headerId,
    this.scheduleId,
    this.templateId,
    this.conductedByEmp,
    this.hseComplaintRating,
    this.uiid,
    this.auditTeam,
    this.auditNo,
    this.auditType,
    this.auditTypeDesc,
    this.auditTitle,
    this.templateName,
    this.btnDeleteData,
    this.condutedByDept,
    this.condutedByDeptName,
    this.conductedByEmpName,
    this.auditDesc,
    this.auditLocation,
    this.locationId,
    this.auditLocationDesc,
    this.reference,
    this.auditStatus,
    this.actionId,
    this.closureComments,
    this.closureCode,
    this.closureCodeDesc,
    this.closedBy,
    this.isBtnStart,
    this.isBtnSave,
    this.isBtnFinalSave,
    this.isBtnFinish,
    this.isAuTab,
    this.startDate,
    this.endDate,
    this.closureDate,
    this.actionNo,
    this.priority,
    this.status,
    this.actionOwner,
    this.actionStatus,
    this.targetDate,
    this.year,
    this.userId,
    this.keyId,
    this.companyCode,
    this.opsMode,
    this.appType,
    this.date1,
    this.date2,
  });

  factory AuditModel.fromJson(Map<String, dynamic> json) => AuditModel(
    auditId: json["auditId"],
    headerId: json["headerId"],
    scheduleId: json["scheduleId"],
    templateId: json["templateId"],
    conductedByEmp: json["conductedByEmp"],
    hseComplaintRating: json["hseComplaintRating"],
    uiid: json["uiid"],
    auditTeam: json["auditTeam"],
    auditNo: json["auditNo"],
    auditType: json["auditType"],
    auditTypeDesc: json["auditTypeDesc"],
    auditTitle: json["auditTitle"],
    templateName: json["templateName"],
    btnDeleteData: json["btnDeleteData"],
    condutedByDept: json["condutedByDept"],
    condutedByDeptName: json["condutedByDeptName"],
    conductedByEmpName: json["conductedByEmpName"],
    auditDesc: json["auditDesc"],
    auditLocation: json["auditLocation"],
    locationId: json["locationId"],
    auditLocationDesc: json["auditLocationDesc"],
    reference: json["reference"],
    auditStatus: json["auditStatus"],
    actionId: json["actionId"],
    closureComments: json["closureComments"],
    closureCode: json["closureCode"],
    closureCodeDesc: json["closureCodeDesc"],
    closedBy: json["closedBy"],
    isBtnStart: json["isBtnStart"],
    isBtnSave: json["isBtnSave"],
    isBtnFinalSave: json["isBtnFinalSave"],
    isBtnFinish: json["isBtnFinish"],
    isAuTab: json["isAuTab"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    closureDate: json["closureDate"],
    actionNo: json["actionNo"],
    priority: json["priority"],
    status: json["status"],
    actionOwner: json["actionOwner"],
    actionStatus: json["actionStatus"],
    targetDate: json["targetDate"],
    year: json["year"],
    userId: json["userId"],
    keyId: json["keyId"],
    companyCode: json["companyCode"],
    opsMode: json["opsMode"],
    appType: json["appType"],
    date1: json["date1"],
    date2: json["date2"],
  );

  Map<String, dynamic> toJson() => {
    "auditId": auditId,
    "headerId": headerId,
    "scheduleId": scheduleId,
    "templateId": templateId,
    "conductedByEmp": conductedByEmp,
    "hseComplaintRating": hseComplaintRating,
    "uiid": uiid,
    "auditTeam": auditTeam,
    "auditNo": auditNo,
    "auditType": auditType,
    "auditTypeDesc": auditTypeDesc,
    "auditTitle": auditTitle,
    "templateName": templateName,
    "btnDeleteData": btnDeleteData,
    "condutedByDept": condutedByDept,
    "condutedByDeptName": condutedByDeptName,
    "conductedByEmpName": conductedByEmpName,
    "auditDesc": auditDesc,
    "auditLocation": auditLocation,
    "locationId": locationId,
    "auditLocationDesc": auditLocationDesc,
    "reference": reference,
    "auditStatus": auditStatus,
    "actionId": actionId,
    "closureComments": closureComments,
    "closureCode": closureCode,
    "closureCodeDesc": closureCodeDesc,
    "closedBy": closedBy,
    "isBtnStart": isBtnStart,
    "isBtnSave": isBtnSave,
    "isBtnFinalSave": isBtnFinalSave,
    "isBtnFinish": isBtnFinish,
    "isAuTab": isAuTab,
    "startDate": startDate,
    "endDate": endDate,
    "closureDate": closureDate,
    "actionNo": actionNo,
    "priority": priority,
    "status": status,
    "actionOwner": actionOwner,
    "actionStatus": actionStatus,
    "targetDate": targetDate,
    "year": year,
    "userId": userId,
    "keyId": keyId,
    "companyCode": companyCode,
    "opsMode": opsMode,
    "appType": appType,
    "date1": date1,
    "date2": date2,
  };
}
