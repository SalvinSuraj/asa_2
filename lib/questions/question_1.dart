import 'package:flutter/material.dart';
import 'package:signin/questions/question_2.dart';

class slider1 extends StatefulWidget {
  const slider1({Key? key}) : super(key: key);

  @override
  State<slider1> createState() => _slider1State();
}

class _slider1State extends State<slider1> {
  double currentValue_Q1 = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepOrange.shade400,
       body: Column(
         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [

           SizedBox(height: 120),
           const Padding(padding: EdgeInsets.all(15),child:
           Text("How many people did you meet today?",style: TextStyle(fontSize: 50)),),
           SizedBox(height: 100),
           SliderTheme(data: const SliderThemeData(
             valueIndicatorColor: Colors.blue,
             activeTickMarkColor: Colors.transparent,
             trackHeight: 80,
             thumbShape: RoundSliderThumbShape(enabledThumbRadius: 25),
             overlayShape: RoundSliderOverlayShape(overlayRadius: 20)



           ) ,
             child: Slider(
               value: currentValue_Q1,
               min: 0,
               max: 10,
               divisions: 10,
               label: currentValue_Q1.round().toString(),
               activeColor: Colors.blue,
               inactiveColor: Colors.blue.shade200,
               thumbColor: Colors.black,
               onChanged: (value){
                 setState(() {
                   currentValue_Q1 = value;
                 });
               }),),
           SizedBox(height: 200),
           TextButton(child: const Text("Next",style: TextStyle(fontSize: 30,color: Colors.black)),
               onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                 builder: (context) =>  slider2(pass_valq1:currentValue_Q1),
               )), ),

         ],
       ),
    );
  }
}
