import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page.dart';

class ProfessionalHelp extends StatelessWidget {
  const ProfessionalHelp({Key? key}) : super(key: key);

  void lauchWhatsapp({@required number, @required message})async
  {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunchUrl(Uri.parse(url)) ? launchUrl(Uri.parse(url)) : print("Can't open whatsapp");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage()
                ),
                ModalRoute.withName("/HomePage")
            );
          },
        ),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('Dr. RadhaKrishnan Menon'),
              subtitle: Text('Aster Medicity, Altamount Road, Mumbai'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('CONTACT'),
                  onPressed: () {
                    lauchWhatsapp(number: "+917039157418", message: "Hello Doctor");
                  },
                ),
                const SizedBox(width: 8),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.medical_services),
                    title: Text('Dr. Vikram Mathur'),
                    subtitle: Text('Bridge Candy, Malabar Hill, Mumbai '),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('CONTACT'),
                        onPressed: () {
                          lauchWhatsapp(number: "+917039157418", message: "Hello Doctor");
                        },
                      ),
                      const SizedBox(width: 8),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),


          ],

        ),
      ),
    );
  }
}
