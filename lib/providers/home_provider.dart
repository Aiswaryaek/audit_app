import 'package:audit_app/models/home_model.dart';
import 'package:flutter/material.dart';
import '../core/live_data.dart';
import '../core/ui_state.dart';
import '../repositories/common_repository.dart';

class GetHomeListProvider extends ChangeNotifier {
  CommonRepository commonRepository;
  GetHomeListProvider({required this.commonRepository});

  var getHomeList = HomeModel();
  // List<Product>list = [];
  LiveData<UIState<HomeModel>> getHomeListData =
  LiveData<UIState<HomeModel>>();

  LiveData<UIState<HomeModel>> getHomeListLiveData() {
    return getHomeListData;
  }

  void initialState()
  {
    getHomeListData.setValue(Initial());
    notifyListeners();
  }

  Future<void> checkGetHomeList() async {
    try {
      getHomeListData.setValue(IsLoading());
      getHomeList = await commonRepository.getHomeData();
      if (getHomeList.dtAbstract?[0].item == "Pending Actions") {
        getHomeListData.setValue(Success(getHomeList));
      } else {
        getHomeListData.setValue(IsEmpty());
      }
    } catch (ex) {
      getHomeListData.setValue(Failure(ex.toString()));
    } finally {
      notifyListeners();
    }
    // return true;
  }
}