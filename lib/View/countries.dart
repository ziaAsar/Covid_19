import 'dart:convert';

import 'package:covid_19/View/Details_Screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import '../Model/Countries_Model.dart';
import '../Services/Utilities/app_urls.dart';
import '../Services/states_services.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchController = TextEditingController();

  List<Country>postList = [];

  Future<List<Country>> fetchCountriesRecord() async {
    final response = await http.get(Uri.parse(AppUrl.CountriesList));
    // var data = jsonDecode(response.body.toString());
    // print(data);
    if (response.statusCode == 200) {
      var JsonString = response.body;
      return countryFromJson(JsonString);
    } else {
      return postList;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchCountriesRecord().then((value) {
      setState((){
        postList=value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    //StatesServices statesServices = StatesServices();
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Theme
      //       .of(context)
      //       .scaffoldBackgroundColor,
      //   title: Text("Covid-19"),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController, cursorColor: Colors.white,
                decoration: InputDecoration(
                    hintText: "Search With Country Name",
                    suffixIcon: searchController.text.isEmpty ? const Icon(Icons.search) :
                    GestureDetector(
                        onTap: (){
                          searchController.text = "" ;
                          setState(() {
                          });
                        },
                        child: Icon(Icons.clear)
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
              child: FutureBuilder(
                  future: fetchCountriesRecord(),
                  builder: (context, AsyncSnapshot<List<Country>>snapshot) {
                    print(snapshot);
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                              .onDrag,
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
                          }
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index].country;
                            if (searchController.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsScreen(
                                                name: snapshot.data![index].country.toString(),
                                                image: snapshot.data![index].countryInfo.flag.toString(),
                                                TotalCases: snapshot.data![index].cases.toInt(),
                                                Tests: snapshot.data![index].tests.toInt(),
                                                TodayCases: snapshot.data![index].todayCases.toInt(),
                                                Deaths: snapshot.data![index].deaths.toInt(),
                                                ActiveCases: snapshot.data![index].active.toInt(),
                                                Recovery: snapshot.data![index].recovered.toInt(),
                                                Population: snapshot.data![index].population.toInt(),
                                                Critical: snapshot.data![index].cases.toInt(),
                                              )));
                                    },
                                    child: ListTile(
                                      leading: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Image(
                                    width: 100,
                                    height: 100,
                                    errorBuilder: (BuildContext context, Object exception,
                                    StackTrace? stackTrace) {
                                    return const Text("Loading.....");
                                    },
                                          image: NetworkImage(snapshot
                                              .data![index].countryInfo.flag.toString()),
                                        ),
                                      ),
                                      title: Text(
                                          snapshot.data![index].country
                                              .toString()),
                                      subtitle: Text(
                                          snapshot.data![index].cases
                                              .toString()),
                                    ),
                                  ),
                                ],
                              );
                            }
                            else if (name.toUpperCase().contains(
                                searchController.text.toUpperCase())) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsScreen(
                                                name: snapshot.data![index].country.toString(),
                                                image: snapshot.data![index].countryInfo.flag.toString(),
                                                TotalCases: snapshot.data![index].cases.toInt(),
                                                Tests: snapshot.data![index].tests.toInt(),
                                                TodayCases: snapshot.data![index].todayCases.toInt(),
                                                Deaths: snapshot.data![index].deaths.toInt(),
                                                ActiveCases: snapshot.data![index].active.toInt(),
                                                Recovery: snapshot.data![index].recovered.toInt(),
                                                Population: snapshot.data![index].population.toInt(),
                                                Critical: snapshot.data![index].cases.toInt(),
                                              )));
                                    },
                                    child: ListTile(
                                      leading: Image(
                                        width: 40,
                                        height: 40,
                                        errorBuilder: (BuildContext context, Object exception,
                                            StackTrace? stackTrace) {
                                          return const Text("Loading...");
                                        },
                                        image: NetworkImage(snapshot
                                            .data![index].countryInfo.flag.toString()),
                                      ),
                                      title: Text(
                                          snapshot.data![index].country
                                              .toString()),
                                      subtitle: Text(
                                          snapshot.data![index].cases
                                              .toString()),
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Container();
                            }
                          }
                      );
                    }
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
