import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signin/music%20player/musicList.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signin/questions/question_1.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/scheduler.dart';

import 'ProfessionalHelp.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}


class _HomePageState extends  State<HomePage>
{

  List<_ChartData> chartData = <_ChartData>[];

  @override
  void initState() {
    getDataFromFireStore().then((results) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
    super.initState();
  }

  Future<void> getDataFromFireStore() async {
    var snapShotsValue =
    await FirebaseFirestore.instance.collection("Answer_Anal_1").get();
    List<_ChartData> list = snapShotsValue.docs
        .map((e) => _ChartData(date: DateTime.fromMillisecondsSinceEpoch(
        e.data()['answer1_date'].millisecondsSinceEpoch)
        , value: e.data()['answer_1'],
        value2: e.data()['answer_2'],
        value3: e.data()['answer_3']))
        .toList();
    setState(() {
      chartData = list;
    });
  }


  Widget _showChart() {
    return Scaffold(
      body: SfCartesianChart(
          title: ChartTitle(text: 'Analysis Of DATA'),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          primaryXAxis: DateTimeCategoryAxis(),
          primaryYAxis: NumericAxis(
              minimum: 0,
              maximum: 30
          ),
          series: <ChartSeries<_ChartData, DateTime>>[
            StackedColumnSeries<_ChartData, DateTime>(
                dataSource: chartData,
                xValueMapper: (_ChartData data, _) => data.date,
                yValueMapper: (_ChartData data, _) => data.value,
                name: 'Question1',
                color: Colors.red,
                markerSettings: MarkerSettings(isVisible: true)
            ),
            StackedColumnSeries<_ChartData, DateTime>(
                dataSource: chartData,
                xValueMapper: (_ChartData data, _) => data.date,
                yValueMapper: (_ChartData data, _) => data.value2,
                name: 'Question2',
                color: Colors.blue,
                markerSettings: MarkerSettings(isVisible: true)
            ),
            StackedColumnSeries<_ChartData, DateTime>(
                dataSource: chartData,
                xValueMapper: (_ChartData data, _) => data.date,
                yValueMapper: (_ChartData data, _) => data.value3,
                name: 'Question3',
                color: Colors.green,
                markerSettings: MarkerSettings(isVisible: true)
            ),
          ]
          // series: <LineSeries<_ChartData, DateTime>>[
          //   LineSeries<_ChartData, DateTime>(
          //       dataSource: chartData,
          //       xValueMapper: (_ChartData data, _) => data.date,
          //       yValueMapper: (_ChartData data, _) => data.value,
          //       color: Colors.purple,
          //       name: 'Question 1',
          //       markerSettings: MarkerSettings(isVisible: true)
          //   )
          // ]
      ),
    );
  }

  final user = FirebaseAuth.instance.currentUser!;

  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), //<-- SEE HERE
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true), // <-- SEE HERE
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ??
        false;
  }

  Widget build(BuildContext context){

    return WillPopScope(
        onWillPop: _onWillPop,

    child: DefaultTabController(
      length: 2,
       child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          // automaticallyImplyLeading: false,
        ),


        drawer: const NavigationDrawer(),

        /*body:Padding(
          padding: EdgeInsets.all(32),
          child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.message_outlined),
              title: Text('Ready to answer a few questions?'),
              subtitle: Text('It will only take a minute'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Yes!'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Not now'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
    ),*/
        body: Column(
          children: [
            const TabBar(
              labelColor: Colors.deepOrange,
                indicatorColor: Colors.deepOrange,
                tabs:[
                  Tab(text: "Tasks" , icon: Icon(Icons.task)),
                  Tab(text: "Dashboard",icon: Icon(Icons.dashboard),)
                ]),
            Expanded(child:
            TabBarView(children: [
              Container(      //1st tab
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(Icons.message_outlined),
                        title: Text('Ready to answer a few questions?'),
                        subtitle: Text('It will only take a minute'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('Yes!'),
                            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const slider1(),
                            )),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('Not now'),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),

                ),

              Container(
                child: _showChart(),
              )
            ]),)
          ],
        ),
    ),
    )
    );
  }


}

class _ChartData { //TRIED TO GET Chart
  _ChartData({this.date, this.value, this.value2,this.value3});
  final DateTime? date;
  final int? value;
  final int? value2;
  final int? value3;

}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>  Drawer(

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:<Widget> [
        buildHeader(context),
        buildMenuItems(context),
      ],
    ),
  );

  Widget buildHeader(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Container(

      color: Colors.deepOrange,
      padding: EdgeInsets.only(
        top: 24 + MediaQuery
            .of(context)
            .padding
            .top,
        bottom: 24,
      ),
      child: Column(
        children: [
          Text(
            'Signed in as',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height:20),
          Text(
            user.email!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );}
    Widget buildMenuItems(BuildContext context) =>
         Container(
          padding: const EdgeInsets.all(24),
          child: Wrap(
            runSpacing: 16,
            children: [
              ListTile(
                leading: const Icon(Icons.workspace_premium_outlined),
                title: const Text("Get Professional Help"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ProfessionalHelp()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.my_library_music),
                title: const Text("Music Player"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const MusicList()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.movie_creation),
                title: const Text("Book Tickets"),
                onTap: () {
                 LaunchApp.openApp(
                   androidPackageName: 'com.bt.bms',
                   openStore: true,

                 );
                },
              ),
              ListTile(
                leading: const Icon(Icons.login_outlined),
                title: const Text("Logout"),
                onTap: () => FirebaseAuth.instance.signOut(),
              ),
            ],
          ),);
}
