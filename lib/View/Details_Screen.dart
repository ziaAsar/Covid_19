import 'package:covid_19/View/Project_Colors.dart';
import 'package:covid_19/View/World_States.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
class DetailsScreen extends StatefulWidget {
  String name;
  String image;
  int ? TotalCases,ActiveCases,TodayCases,Tests,Recovery,Deaths,Population,Critical;
   DetailsScreen({
  required this.name,
  required this.image,
  required this.TotalCases,
  required this.Tests,
  required this.TodayCases,
  required this.Deaths,
  required this.ActiveCases,
  required this.Recovery,
  required this.Population,
     required this.Critical
}) ;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    AllColors colors=AllColors();
    return Scaffold(
        backgroundColor:Color(0xff041b41),
      appBar: AppBar(
        backgroundColor:Color(0xff041b41),
        title: Text(widget.name),
        centerTitle: true,
      ),
      body:Padding(
        padding: const EdgeInsets.only(top:25),
        child: SingleChildScrollView(
          child: Column(
           children: [
             PieChart(
                 ringStrokeWidth: 25,
               chartValuesOptions: ChartValuesOptions(showChartValuesInPercentage: true,

                 chartValueStyle: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),chartValueBackgroundColor:Colors.black,showChartValueBackground: true,showChartValuesOutside: true,
               ),
                 chartType: ChartType.disc,
                 chartRadius: MediaQuery.of(context).size.width/2.5,
                 legendOptions: LegendOptions(

                   legendPosition: LegendPosition.left,legendShape: BoxShape.circle,
                   legendTextStyle: TextStyle(fontWeight: FontWeight.bold),
                 ),
                 animationDuration: Duration(
                   seconds: 5
                 ),
                 colorList: colors.colorList,
                 dataMap: {
                   "Total Cases":double.parse(widget.TotalCases.toString()),
                   "Test":double.parse(widget.Tests.toString()),
                   "Recovery":double.parse(widget.Recovery.toString()),
                   "Deaths":double.parse(widget.Deaths.toString()),
                   //"Critical":double.parse(widget.Critical.toString()),
                  // "recoveredPerOneMillion":double.parse(widget.recoveredPerOneMillion.toString()),
                 }
             ),
             Stack(
               alignment: Alignment.topCenter,
               children: [
                 Padding(
                   padding:EdgeInsets.only(top:MediaQuery.of(context).size.height*.067,left: 5,right: 5),
                   child: Card(
                     shape: OutlineInputBorder(borderRadius:BorderRadius.circular(15)),
                     child: Column(
                       children: [
                         SizedBox(
                           height: 45,
                         ),
                         ReusableRow(title: 'Total Cases', value: widget.TotalCases.toString()),
                         ReusableRow(title: 'Active Cases', value: widget.ActiveCases.toString()),
                         ReusableRow(title: 'Today Cases', value: widget.TotalCases.toString()),
                         ReusableRow(title: 'Tests', value: widget.Tests.toString()),
                         ReusableRow(title: 'Recovery', value: widget.Recovery.toString()),
                         ReusableRow(title: 'Deaths', value: widget.Deaths.toString()),
                         ReusableRow(title: 'Population', value: widget.Population.toString()),
                         ReusableRow(title: 'Critical', value: widget.Critical.toString()),
                       ],
                     ),
                   ),
                 ),
                 CircleAvatar(
                   radius: 52,
                   backgroundImage: NetworkImage(widget.image),
                 )
               ],
             )
           ],
          ),
        ),
      )
    );
  }
}
