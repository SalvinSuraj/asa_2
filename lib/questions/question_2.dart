import 'package:flutter/material.dart';
import 'package:signin/questions/question_3.dart';

class slider2 extends StatefulWidget {
  const slider2({Key? key}) : super(key: key);

  @override
  State<slider2> createState() => _slider2State();
}

class _slider2State extends State<slider2> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepOrange.shade400,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          SizedBox(height: 100),
          const Padding(padding: EdgeInsets.all(15),child:
          Text("How happy do you feel today?",style: TextStyle(fontSize: 60)),),
          SizedBox(height: 100),
          SliderTheme(data: const SliderThemeData(
              valueIndicatorColor: Colors.blue,
              activeTickMarkColor: Colors.transparent,
              trackHeight: 80,
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
                thumbColor: Colors.black,
                onChanged: (value){
                  setState(() {
                    _currentValue = value;
                  });
                }),),
          SizedBox(height: 150),
          TextButton(onPressed: () =>Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const slider3(),
          )), child: const Text("Next",style: TextStyle(fontSize: 30,color: Colors.black))),

        ],
      ),
    );
  }
}
