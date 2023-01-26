import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'ProfessionalHelp.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();


}
class _HomePageState extends  State<HomePage>
{

  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
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

                ),

              Container(
                child: const Center(
                  child: Text("Second Tab"),

                ),
              )
            ]),)
          ],
        ),
    ),);
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
