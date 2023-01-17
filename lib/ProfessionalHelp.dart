import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfessionalHelp extends StatelessWidget {
  const ProfessionalHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Professional Help"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          children: [
          Image.asset(
          'assets/images/docpat.jpg',
          height: 280,
          width: 410,
          ),Card(

            ),
          ],

        ),
      ),
    );
  }
}
