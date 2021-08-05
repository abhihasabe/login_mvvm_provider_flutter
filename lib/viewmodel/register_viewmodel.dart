import 'package:flutter/material.dart';
import 'package:login_reg_mvvm_provider/model/Login_model.dart';
import 'package:login_reg_mvvm_provider/model/repository/media_repository.dart';
import 'package:login_reg_mvvm_provider/network/api_response.dart';


class RegViewModel with ChangeNotifier{

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');
  dynamic mediaList;

  ApiResponse get response {
    return _apiResponse;
  }

  Future<Map<String, dynamic>> loginPost(Map<String, String> loginInput) async{
    _apiResponse = ApiResponse.loading('Fetching artist data');
    notifyListeners();
    try {
      mediaList = await MediaRepository().loginPost(loginInput);
      if(mediaList!=null)
      _apiResponse = ApiResponse.completed(mediaList);
    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
    return mediaList;
  }
}