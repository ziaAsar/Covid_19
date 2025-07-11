import 'package:covid_19/Controllers/worldState_controller.dart';
import 'package:covid_19/View/Project_Colors.dart';
import 'package:covid_19/View/countries.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}
class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this)
    ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WorldStateController _worldcontroller = Get.put(
        WorldStateController());
    AllColors colors = AllColors();
    return Scaffold(
      backgroundColor: Color(0xff001d4d),
      // backgroundColor:Color(0xffE2DFD2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Obx(() {
                if (_worldcontroller.isLoading.value ||
                    _worldcontroller.worldData.value== null) {
                  return SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.85,
                    child: SpinKitCircle(
                      color: Colors.white,
                      size: 50.0,
                      controller: _controller,
                    ),
                  );
                }
                else {
                  final data =_worldcontroller.worldData.value ;
                  print("Data loaded: ${data!.cases}");
                return Column(
                children: [
                PieChart(
                dataMap: {
                  "Total Cases": data.cases?.toDouble() ?? 0,
                  "Tests": data.tests?.toDouble() ?? 0,
                  "Recovery": data.recovered?.toDouble() ?? 0,
                  "Deaths": data.deaths?.toDouble() ?? 0,
                // "Total Cases":data.cases?.toDouble()??0,
                // "Critical":data.critical?.toDouble()??0,
                // "Tests":double.parse(data!.tests!.toString()),
                // "Recovery":double.parse(data!.recovered!.toString()),
                // "Deaths":double.parse(data!.deaths!.toString()),
                // "Total Population":double.parse(snapshot.data!.population!.toString()),
                // "Affected Countries":double.parse(snapshot.data!.affectedCountries!.toString()),
                },
                chartValuesOptions: ChartValuesOptions(showChartValuesInPercentage: true,chartValueBackgroundColor:Colors.black,chartValueStyle: TextStyle(color:Colors.cyan,fontWeight: FontWeight.bold)),
                chartRadius: MediaQuery.of(context).size.width/2.5,
                legendOptions: LegendOptions(
                legendPosition: LegendPosition.left,
                ),
                animationDuration: Duration(
                seconds: 4,
                ),
                chartType: ChartType.disc,
                colorList: colors.colorList,
                ),
                Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.03),
                child: Card(
                // color: Color(0xffFFFFFF),
                color: Color(0xFF1E1E1E),
                margin: EdgeInsets.all(0),
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                children: [
                ReusableRow(title: 'Total Cases', value: data.cases!.toString()),
                ReusableRow(title: 'Active Cases', value: data!.active!.toString()),
                ReusableRow(title: 'Today Cases', value: data!.todayCases!.toString()),
                ReusableRow(title: 'Tests', value: data!.tests!.toString()),
                ReusableRow(title: 'Recovery', value: data!.recovered!.toString()),
                ReusableRow(title: 'Deaths', value: data!.deaths!.toString()),
                ReusableRow(title: 'Population', value: data!.population!.toString()),
                ReusableRow(title: 'Affected Countries', value: data!.affectedCountries!.toString()),
                ],
                ),
                ),
                ),
                GestureDetector(
                onTap: (){
                Get.to(CountriesList());
                },
                child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.07,
                decoration: BoxDecoration(
                // color: Color(0xff1aa260),
                color: Color(0xff00664f),
                borderRadius: BorderRadius.circular(18),
                // border: Border.all(width: 2,color: Colors.black),
                ),
                child:Center(child: Text("Track Countries")),
                ),
                ),
                ],
                );
                }
              })
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 10),
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

