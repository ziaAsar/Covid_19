import 'dart:convert';
import 'package:http/http.dart'as http;
import '../Model/WorldStatesModel.dart';
import 'Utilities/app_urls.dart';

class StatesServices{
  Future<WorldStatesModel> fetchStatesRecord () async{
    final response = await http.get(Uri.parse(AppUrl.WorldStatesApi));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      return WorldStatesModel.fromJson(data);
    }else{
      throw Exception("error");
    }
  }
  Future<List<dynamic>> fetchCountriesRecord () async{
    final response = await http.get(Uri.parse(AppUrl.CountriesList));
    var data = jsonDecode(response.body.toString());
    print(data);
    if(response.statusCode==200){
      return data;
    }else{
      throw Exception("error");
    }
  }
}
