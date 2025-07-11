import 'dart:convert';
import 'package:covid_19/Model/WorldStatesModel.dart';
import 'package:covid_19/Services/Utilities/app_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class WorldStateController extends GetxController{
  var isLoading = false.obs;
  Rx worldData = WorldStatesModel().obs;
  var circular = CircularProgressIndicator().obs;

  void onInit() async{
    super.onInit();
    await getApi();

  }

  Future<WorldStatesModel?> getApi() async{
    isLoading. value = true;
    try{
      final response = await get(Uri.parse(AppUrl.WorldStatesApi));
      var data =jsonDecode(response.body.toString());
      print(response.statusCode);
      // print("Asar zia${data}");
      print("Asar zia${WorldStatesModel.fromJson(data)}");
      // print("Data loaded: ${worldData.value!.cases}");
      if(response.statusCode==200){
        isLoading.value =false;
        // print("Data loaded if: ${worldData.value!.cases}");
       // return worldData.value =worldData.value(data);
        return worldData.value= WorldStatesModel.fromJson(data);
      }else{
        worldData.value= WorldStatesModel.fromJson(data);
      }

    }catch(e){
      isLoading.value= false;
      throw Exception("Error loading");
    }
  }
}