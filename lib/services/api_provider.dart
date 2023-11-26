import 'dart:developer';

import 'package:assign_task/model/city.dart';

import '../model/district.dart';
import '../model/states.dart';
import 'package:http/http.dart' as http;

class ApiProvider{
  //getting all states

  Future<StateModel> getallstate() async {
    Map<String, String> _header = <String, String>{
      "Access-Control-Allow-Origin": "*",
      'x-api-key':'api@parthshopping.com',
      "Access-Control-Allow-Headers": "Origin,Content-Type,Authorization,X-Api-Key,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS,GET"
    };
    try {
      var url = Uri.parse('https://krishify.animationmedia.org/api/UsersM/getState?lng=eng');
      var response = await http.get(url,headers: _header);
      if (response.statusCode == 200) {
        print(response.body);
        final StateModel responseModel =
        stateDataFromJson(response.body);
        return responseModel;
      } else {
        return StateModel(
            status: 0,
            message: 'Something went wrong: ${response.statusCode}',
            data: []);
      }
    } catch (e) {
      log('Exception: ${e.toString()}');
      throw Exception(e.toString());
    }
  }

  // get all district

  Future<DistrictModel> getalldistrict(String ? stateid) async {
    Map<String, String> _header = <String, String>{
      "Access-Control-Allow-Origin": "*",
      'x-api-key':'api@parthshopping.com',
      "Access-Control-Allow-Headers": "Origin,Content-Type,Authorization,X-Api-Key,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS,GET"
    };
    try {
      var url = Uri.parse('https://krishify.animationmedia.org/api/UsersM/getDistrict?lng=eng&state_id=$stateid');
      var response = await http.get(url,headers: _header);
      if (response.statusCode == 200) {
        print(response.body);
        final DistrictModel responseModel =
        districtDataFromJson(response.body);
        return responseModel;
      } else {
        return DistrictModel(
            status: 0,
            message: 'Something went wrong: ${response.statusCode}',
            data: []);
      }
    } catch (e) {
      log('Exception: ${e.toString()}');
      throw Exception(e.toString());
    }
  }

  // get all city

  Future<CityModel> getallcity(String ? distid) async {
    Map<String, String> _header = <String, String>{
      "Access-Control-Allow-Origin": "*",
      'x-api-key':'api@parthshopping.com',
      "Access-Control-Allow-Headers": "Origin,Content-Type,Authorization,X-Api-Key,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS,GET"
    };
    try {
      var url = Uri.parse('https://krishify.animationmedia.org/api/UsersM/getCity?lng=eng&districtid=55');
      var response = await http.get(url,headers: _header);
      if (response.statusCode == 200) {
        print(response.body);
        final CityModel responseModel =
        cityDataFromJson(response.body);
        return responseModel;
      } else {
        return CityModel(
            status: 0,
            message: 'Something went wrong: ${response.statusCode}',
            data: []);
      }
    } catch (e) {
      log('Exception: ${e.toString()}');
      throw Exception(e.toString());
    }
  }

}