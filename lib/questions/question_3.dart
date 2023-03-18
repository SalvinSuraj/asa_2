import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Task.dart';

class slider3 extends StatefulWidget {
  //const slider3({Key? key}) : super(key: key);
  double pass_valq1;
  double pass_valq2;
  slider3({required this.pass_valq1, required this.pass_valq2});

  @override
  State<slider3> createState() => _slider3State(pass_valq1,pass_valq2);
}

class _slider3State extends State<slider3> {

  late int value_Q1 ;
  late int value_Q2 ;
  late int value_Q3 ;

  double currentValue3 = 0;
  double pass_valq1;
  double pass_valq2;

  _slider3State(this.pass_valq1,this.pass_valq2);

  Future<bool> _onWillPop() async {
    return false;
  }

  String docdate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  DateTime cdate = DateTime.now();

  final firestoreinstance = FirebaseFirestore.instance;
  Question3(value1,value2,value3,date){
    var data = {
      'answer1_date':date,
      'answer_1': value1,
      'answer_2': value2,
      'answer_3': value3,
    };
    firestoreinstance
        .collection('Answer_Anal_1')
        .doc(docdate)
        .set(data);
  }
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: _onWillPop,
      child: Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.purple.shade400,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          SizedBox(height: 100),
          const Padding(padding: EdgeInsets.all(15),child:
          Text("How productive do you feel today?",style: TextStyle(fontSize: 50)),),
          SizedBox(height: 100),
          SliderTheme(data: const SliderThemeData(
              valueIndicatorColor: Colors.blue,
              activeTickMarkColor: Colors.transparent,
              trackHeight: 40,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20)

          ) ,
            child: Slider(
                value: currentValue3,
                min: 0,
                max: 10,
                divisions: 10,
                label: currentValue3.round().toString(),
                activeColor: Colors.blue,
                inactiveColor: Colors.blue.shade200,
                thumbColor: Colors.white,
                onChanged: (value){
                  setState(() {
                    currentValue3 = value;
                  });
                }),),
          SizedBox(height: 150),
          TextButton( child: const Text("Next",style: TextStyle(fontSize: 30,color: Colors.black)),
            onPressed: () {

              value_Q1 = pass_valq1.round();
              value_Q2 = pass_valq2.round();
              value_Q3 = currentValue3.round();

                Question3(value_Q1,value_Q2,value_Q3,cdate);
                Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  MainPage(pass_valq1: pass_valq1, pass_valq2: pass_valq2, pass_valq3: currentValue3),
            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => MainPage(pass_valq1: pass_valq1, pass_valq2: pass_valq2, pass_valq3: currentValue3),
            //     ),
            //     ModalRoute.withName("/HomePage")
            // )
         ));
          }
          ),
        ],
      ),
    )
    );
  }
}
