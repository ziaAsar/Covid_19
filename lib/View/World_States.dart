import 'package:covid_19/Model/WorldStatesModel.dart';
import 'package:covid_19/Services/states_services.dart';
import 'package:covid_19/View/Project_Colors.dart';
import 'package:covid_19/View/countries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen> with TickerProviderStateMixin{
  late final AnimationController _controller =AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    AllColors colors =AllColors();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height *.02,
                ),
               FutureBuilder(
                 future: statesServices.fetchStatesRecord(),
                   builder: (context,AsyncSnapshot<WorldStatesModel>snapshot){
                  if(!snapshot.hasData){
                    return SizedBox(
                      height: MediaQuery.of(context).size.height*0.85,
                      child: SpinKitCircle(
                        color:Colors.white,
                        size: 50.0,
                        controller: _controller,
                      ),
                    );
                  }else{
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total Cases":double.parse(snapshot.data!.cases!.toString()),
                             //"Critical":double.parse(snapshot.data!.critical!.toString()),
                             "Tests":double.parse(snapshot.data!.tests!.toString()),
                             "Recovery":double.parse(snapshot.data!.recovered!.toString()),
                             "Deaths":double.parse(snapshot.data!.deaths!.toString()),
                            // "Total Population":double.parse(snapshot.data!.population!.toString()),
                            // "Affected Countries":double.parse(snapshot.data!.affectedCountries!.toString()),
                          },
                           chartValuesOptions: ChartValuesOptions(showChartValuesInPercentage: true,chartValueBackgroundColor:Colors.black,chartValueStyle: TextStyle(color:Colors.cyan,fontWeight: FontWeight.bold)),
                           chartRadius: MediaQuery.of(context).size.width/2.5,
                          legendOptions: LegendOptions(
                            legendPosition: LegendPosition.left,
                          ),
                          animationDuration: Duration(
                            seconds: 7,
                          ),
                          chartType: ChartType.disc,
                          colorList: colors.colorList,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.03),
                          child: Card(
                            margin: EdgeInsets.all(0),
                            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
                            child: Column(
                              children: [
                                ReusableRow(title: 'Total Cases', value: snapshot.data!.cases!.toString()),
                                ReusableRow(title: 'Active Cases', value: snapshot.data!.active!.toString()),
                                ReusableRow(title: 'Today Cases', value: snapshot.data!.todayCases!.toString()),
                                ReusableRow(title: 'Tests', value: snapshot.data!.tests!.toString()),
                                ReusableRow(title: 'Recovery', value: snapshot.data!.recovered!.toString()),
                                ReusableRow(title: 'Deaths', value: snapshot.data!.deaths!.toString()),
                                ReusableRow(title: 'Population', value: snapshot.data!.population!.toString()),
                                ReusableRow(title: 'Affected Countries', value: snapshot.data!.affectedCountries!.toString()),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CountriesList()));
                          },
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              color: Color(0xff1aa260),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(width: 2,color: Colors.black),
                            ),
                            child:Center(child: Text("Track Countries")),
                          ),
                        ),
                      ],
                    );
                  }
               }
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title,value;
   ReusableRow({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(),
        ],
      ),
    );
  }
}

