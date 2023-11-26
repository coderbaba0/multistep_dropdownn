
import 'package:assign_task/model/city.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/district.dart';
import '../model/states.dart';
import '../services/api_provider.dart';

class HomeController extends GetxController {
  Repository ?repository;
  HomeController(this.repository);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<List<StateDatum>> lststatemodel = Rx<List<StateDatum>>([]);
  var selectedstate = "0".obs;
  Rx<List<DropdownMenuItem<String>>> lststatedropdownmenuitem =
  Rx<List<DropdownMenuItem<String>>>([]);
  Rx<List<DistDatum>> lstdistmodel = Rx<List<DistDatum>>([]);
  var selecteddist = "0".obs;
  Rx<List<DropdownMenuItem<String>>> lstdistDropDownMenuItem =
  Rx<List<DropdownMenuItem<String>>>([]);
  Rx<List<CityDatum>> lstcityModel = Rx<List<CityDatum>>([]);
  var selectedcity = "0".obs;
  Rx<List<DropdownMenuItem<String>>> lstcityDropDownMenuItem =
  Rx<List<DropdownMenuItem<String>>>([]);

  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getstate();
  }
  @override
  void onClose() {}

  void getstate() async{
    try {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));

      repository!.getState().then((value) {
        if (value.data.length > 0) {
          Get.back();
          lststatemodel.value.clear();
          lststatemodel.value.addAll(value.data);
          lststatedropdownmenuitem.value = [];
          lststatedropdownmenuitem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select State',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (StateDatum state in lststatemodel.value) {
            lststatedropdownmenuitem.value.add(
              DropdownMenuItem(
                child: Text(
                  state.stateTitle,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: state.stateId.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        Get.back();
        //error handling code
      });
    } catch (exception) {
      Get.back();
      // exception handling code
    }
  }

  void getdist(String stateid) {
    try {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));

      repository!.getalldistrict(stateid).then((value) {
        if (value.data.length > 0) {
          Get.back();
          lstdistmodel.value.clear();
          lstdistmodel.value.addAll(value.data);
          lstdistDropDownMenuItem.value = [];
          lstdistDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select Dist',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (DistDatum dist in lstdistmodel.value) {
            lstdistDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  dist.districtTitle,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: dist.districtid.toString(),
              ),
            );
          }
        }

      }).onError((error, stackTrace) {
        Get.back();
        //error handling code
      });
    } catch (exception) {
      Get.back();
      // exception handling code
    }
  }
  void getcity(String distid) async{
    try {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));

      repository!.getallcity(distid).then((value) {
        if (value.data.length > 0) {
          Get.back();
          lstcityModel.value.clear();
          lstcityModel.value.addAll(value.data);
          lstcityDropDownMenuItem.value = [];
          lstcityDropDownMenuItem.value.add(
            DropdownMenuItem(
              child: Text(
                'Select City',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              value: "0",
            ),
          );
          for (CityDatum city in lstcityModel.value) {
            lstcityDropDownMenuItem.value.add(
              DropdownMenuItem(
                child: Text(
                  city.name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                value: city.id.toString(),
              ),
            );
          }
        }
      }).onError((error, stackTrace) {
        Get.back();
        //error handling code
      });
    } catch (exception) {
      Get.back();
      // exception handling code
    }
  }


  String? validateState(String value) {
    if (value == "0") {
      return "Select State";
    }
    return null;
  }

  String? validateDist(String value) {
    if (value == "0") {
      return "Select Dist";
    }
    return null;
  }

  String? validateCity(String value) {
    if (value == "0") {
      return "Select City";
    }
    return null;
  }
}

 class Repository {
  final ApiProvider apiProvider;

  Repository(this.apiProvider);
  // getallstate
  Future<StateModel> getState() => apiProvider.getallstate();
  // Get alldist
  Future<DistrictModel> getalldistrict(var stateid) => apiProvider.getalldistrict(stateid);
  // Get allcity
  Future<CityModel> getallcity(var distid) => apiProvider.getallcity(distid);
}