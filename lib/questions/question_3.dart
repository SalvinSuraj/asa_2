import 'package:flutter/material.dart';
import 'package:signin/home_page.dart';

class slider3 extends StatefulWidget {
  //const slider3({Key? key}) : super(key: key);
  double pass_valq1;
  double pass_valq2;
  slider3({required this.pass_valq1, required this.pass_valq2});

  @override
  State<slider3> createState() => _slider3State(pass_valq1,pass_valq2);
}

class _slider3State extends State<slider3> {
  double _currentValue = 0;
  double pass_valq1;
  double pass_valq2;

  _slider3State(this.pass_valq1,this.pass_valq2);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                value: _currentValue,
                min: 0,
                max: 10,
                divisions: 10,
                label: _currentValue.round().toString(),
                activeColor: Colors.blue,
                inactiveColor: Colors.blue.shade200,
                thumbColor: Colors.white,
                onChanged: (value){
                  setState(() {
                    _currentValue = value;
                  });
                }),),
          SizedBox(height: 150),
          TextButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  HomePage(),
          )), child: const Text("Next",style: TextStyle(fontSize: 30,color: Colors.black))),

        ],
      ),
    );
  }
}
