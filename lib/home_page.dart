import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'ProfessionalHelp.dart';

class HomePage extends StatelessWidget{

  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      drawer: const NavigationDrawer(),

      body:Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Signed in as',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              user.email!,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
              icon:Icon(Icons.arrow_back,size: 32),
              label: Text(
                'Sign Out',
                style: TextStyle(fontSize: 24),
              ),
              onPressed:() => FirebaseAuth.instance.signOut(),
            )
          ],
        ),
      )
    );
  }
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
                leading: const Icon(Icons.home_outlined),
                title: const Text("Home"),
                onTap: () =>
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage())),
              ),
              ListTile(
                leading: const Icon(Icons.workspace_premium_outlined),
                title: const Text("Get Professional Help"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ProfessionalHelp()));
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
