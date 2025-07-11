import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../Model/Countries_Model.dart';
import '../Services/Utilities/app_urls.dart';


class CountriesController extends GetxController{
  TextEditingController searchController = TextEditingController();
  var isLoading = false.obs;
  RxList<Country>countriesData = <Country>[].obs;
  RxString searchQuery = " ".obs;

  void clearSearch(){
    searchController.clear();
    fetchCountriesRecord();
    searchQuery.value = " ";
  }


  void onInit(){
    super.onInit();
    fetchCountriesRecord();
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });
  }

  List<Country> get filteredCountries {
    if (searchQuery.value.isEmpty) {
      return countriesData;
    } else {
      return countriesData.where((country) {
        final name = country.country?.toLowerCase() ?? '';
        final query = searchQuery.value.toLowerCase();
        return name.contains(query);
      }).toList();
    }
  }


  List<Country>postList = [];

  Future<List<Country>> fetchCountriesRecord() async {
    isLoading.value=true;
    try {
      final response = await get(Uri.parse(AppUrl.CountriesList));
      var data = response.body;
      print("Asar zia${data}" );
      print("Asar${countriesData}" );
      print("Asar${postList}" );
      if (response.statusCode == 200) {
        isLoading.value=false;
        // var jsonData = response.body.toString();
        // return List<Country>.from(jsonData.map((item) => Country.fromJson(item)));
        return countriesData.value=countryFromJson(data);
      } else {
        isLoading.value=false;
        return  postList;
      }
    }
      catch(e){
        isLoading.value= false;
        throw Exception("Error loading");
      }
    }

  }

