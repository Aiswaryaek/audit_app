import 'package:flutter/material.dart';
import '../core/live_data.dart';
import '../core/ui_state.dart';
import '../models/audit_model.dart';
import '../repositories/common_repository.dart';

class GetAuditListProvider extends ChangeNotifier {
  CommonRepository commonRepository;
  GetAuditListProvider({required this.commonRepository});

  // var getAuditList = AuditModel();
  List<AuditModel>list = [];
  LiveData<UIState<AuditModel>> getAuditListData =
  LiveData<UIState<AuditModel>>();

  LiveData<UIState<AuditModel>> getAuditListLiveData() {
    return getAuditListData;
  }

  void initialState()
  {
    getAuditListData.setValue(Initial());
    notifyListeners();
  }

  Future<void> checkGetAuditList() async {
    try {
      getAuditListData.setValue(IsLoading());
      // list = await commonRepository.getAuditData();
      if (list.isNotEmpty) {
        getAuditListData.setValue(Success(AuditModel()));
      } else {
        getAuditListData.setValue(IsEmpty());
      }
    } catch (ex) {
      getAuditListData.setValue(Failure(ex.toString()));
    } finally {
      notifyListeners();
    }
    // return true;
  }
}