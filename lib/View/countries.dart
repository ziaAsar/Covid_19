import 'package:covid_19/View/Details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import '../Controllers/countries_controller.dart';
import '../Model/Countries_Model.dart';
import '../Services/Utilities/app_urls.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  @override
  Widget build(BuildContext context) {
    final CountriesController _controller = Get.put(CountriesController());
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    //StatesServices statesServices = StatesServices();
    return Scaffold(
      // backgroundColor: Colors.amber[50],
      backgroundColor: Color(0xff041b41),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Theme
      //       .of(context)
      //       .scaffoldBackgroundColor,
      //   title: Text("Covid-19"),
      // ),
      body: SafeArea(
        child:  Column(
            children: [
              Padding(
                padding: EdgeInsets.all(25.0),
                child: TextFormField(
                  onChanged: (value){
                    _controller.searchQuery.value = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: _controller.searchController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.amber[50],
                      hintText: "Search With Country Name",
                      suffixIcon: Obx(()=> _controller.searchQuery.value.isEmpty
                              ? const Icon(Icons.search)
                              : GestureDetector(
                                  onTap: () {
                                    _controller.clearSearch();
                                  },
                                  child: Icon(Icons.clear)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(25))
                      // borderSide: BorderSide(color: Colors.black),

                      ),
                ),
              ),
              Expanded(
                  child: Obx(() {
                    if (_controller.isLoading.value ||_controller.countriesData==null) {
                      return ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      color: Colors.white,
                                    ),
                                    title: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      final data = _controller.filteredCountries;
                      return ListView.builder(
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            String? name = data![index].country;
                            if (_controller.searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                     Get.to(DetailsScreen(
                                                       name: data![index].country!.toString(),
                                                       image: data![index].countryInfo!.flag.toString(),
                                                       TotalCases:data![index].cases!.toInt(),
                                                       Tests: data![index].tests!.toInt(),
                                                       TodayCases: data![index].todayCases!.toInt(),
                                                       Deaths:data![index].deaths!.toInt(),
                                                       ActiveCases:data![index].active!.toInt(),
                                                       Recovery:data![index].recovered!.toInt(),
                                                       Population: data![index].population!.toInt(),
                                                       Critical: data![index].cases!.toInt())
                                     );
                                    },
                                    child: ListTile(
                                      leading: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Image(
                                          width: 100,
                                          height: 100,
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                            return const Text("Loading.....");
                                          },
                                          image: NetworkImage(data![index].countryInfo!.flag.toString()),
                                        ),
                                      ),
                                      title: Text(data![index].country.toString()),
                                      subtitle: Text(data![index].cases.toString()),
                                    ),
                                  ),
                                ],
                              );
                            } else if (name!.toUpperCase().contains(
                                _controller.searchController.text.toUpperCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to( DetailsScreen(
                                                name: data![index].country.toString(),
                                                image: data![index].countryInfo!.flag.toString(),
                                                TotalCases: data![index].cases!.toInt(),
                                                Tests: data![index].tests!.toInt(),
                                                TodayCases: data![index].todayCases!.toInt(),
                                                Deaths: data![index].deaths!.toInt(),
                                                ActiveCases: data![index].active!.toInt(),
                                                Recovery: data![index].recovered!.toInt(),
                                                Population: data![index].population!.toInt(),
                                                Critical: data![index].cases!.toInt(),
                                      ));
                                    },
                                    child: ListTile(
                                      leading: Image(
                                        width: 40,
                                        height: 40,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return const Text("Loading...");
                                        },
                                        image: NetworkImage(data![index].countryInfo!.flag.toString()),
                                      ),
                                      title: Text(data![index].country.toString()),
                                      subtitle: Text(data![index].cases.toString()),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  })
              )
             ,
            ],
          ),
        ),
      );

  }
}
