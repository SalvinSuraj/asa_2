import 'package:flutter/material.dart';
import 'package:signin/questions/question_3.dart';

class slider2 extends StatefulWidget {
  //const slider2({Key? key}) : super(key: key);
  double pass_valq1;
  slider2({required this.pass_valq1});
  @override
  State<slider2> createState() => _slider2State(pass_valq1);
}

class _slider2State extends State<slider2> {
  double currentValue2 = 0;
   double pass_valq1;
   _slider2State(this.pass_valq1);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,

      backgroundColor: Colors.red.shade400,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [


          SizedBox(height: 80),
          const Padding(padding: EdgeInsets.all(15),child:
          Text("How happy do you feel today?",style: TextStyle(fontSize: 50)),),
          SizedBox(height: 100),
          SliderTheme(data: const SliderThemeData(
              valueIndicatorColor: Colors.blue,
              activeTickMarkColor: Colors.transparent,
              trackHeight: 40,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20)



          ) ,
            child: Slider(
                value: currentValue2,
                min: 0,
                max: 10,
                divisions: 10,
                label: currentValue2.round().toString(),
                activeColor: Colors.blue,
                inactiveColor: Colors.blue.shade200,
                thumbColor: Colors.white,
                onChanged: (value){
                  setState(() {
                    currentValue2 = value;
                  });
                }),),
          SizedBox(height: 180),
          TextButton(onPressed: () =>Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => slider3(pass_valq1:pass_valq1,pass_valq2:currentValue2),
          )), child: const Text("Next",style: TextStyle(fontSize: 30,color: Colors.black))),

        ],
      ),
    );
  }
}
