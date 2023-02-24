import 'package:flutter/material.dart';
import 'package:signin/home_page.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signin/music%20player/musicList.dart';
import 'package:signin/ProfessionalHelp.dart';

class MainPage extends StatefulWidget {

  double pass_valq1;
  double pass_valq2;
  double pass_valq3;

  MainPage({required this.pass_valq1,required this.pass_valq2,required this.pass_valq3});

  @override
  _MainPageState createState() => _MainPageState(pass_valq1,pass_valq2,pass_valq3);
}

class _MainPageState extends State<MainPage> {

  bool _visible = true;
  bool _visible1 = true;
  bool _visible2 = true;
  bool _visible3 = true;

  double acc_Val1;
  double acc_Val2;
  double acc_Val3;

  _MainPageState(this.acc_Val1, this.acc_Val2, this.acc_Val3);

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context)
  {

    bool task1status = false, task2status = false, task3status = false;

    if(acc_Val1 > 9)
    {
      task1status = true;
    }

    if(acc_Val2 > 9)
    {
      task2status = true;
    }

    if(acc_Val3 > 9)
    {
      task3status = true;
    }

   return WillPopScope(
     onWillPop: _onWillPop,
        child: Scaffold(

        appBar: AppBar(
          title: Text("Complete Tassk"),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
     ),

          drawer: const NavigationDrawer(),

    body: ListView(
      padding: EdgeInsets.all(22),
      children: [
        if(acc_Val1 <= 3)
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: GestureDetector(
            onDoubleTap: (){
              if(_visible) {
                setState(() {
                  _visible = !_visible;

                  acc_Val1 = 10;
                  if( task2status == true && task3status == true ) {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => HomePage()
                    // ));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()
                        ),
                        ModalRoute.withName("/HomePage")
                    );
                  }
                });
              }
            },
            child: buildTask1card_1(),
          ),
        ),
        if(acc_Val1 >= 4 && acc_Val1 <= 6)
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: GestureDetector(
            onDoubleTap: (){
              if(_visible) {
                setState(() {
                  _visible = !_visible;

                  acc_Val1 = 10;
                  if( task2status == true && task3status == true ) {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => HomePage()
                    // ));
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                      return HomePage();
                    }), (r){
                      return false;
                    });
                  }
                });
              }
            },
            child: buildTask1card_2(),
          ),
        ),
        if(acc_Val1 >= 7 && acc_Val1 <= 9)
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: GestureDetector(
            onDoubleTap: (){
              if(_visible) {
                setState(() {
                  _visible = !_visible;

                  acc_Val1 = 10;
                  if(task2status == true && task3status == true ) {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => HomePage()
                    // ));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()
                        ),
                        ModalRoute.withName("/HomePage")
                    );
                  }
                });
              }
            },
            child: buildTask1card_3(),
          ),
        ),
        if(acc_Val2 <= 3)
        AnimatedOpacity(
          opacity: _visible1 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: GestureDetector(
            onDoubleTap: (){
              if(_visible1) {
                setState(() {

                  _visible1 = !_visible1;

                  task2status = true;

                  acc_Val2 = 10;
                  if( task1status == true  && task3status == true ) {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => HomePage()
                    // ));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()
                        ),
                        ModalRoute.withName("/HomePage")
                    );
                    }
                });
              }
            },
            child: buildTask2card_1(),
          ),
        ),

        if(acc_Val2 >= 4 && acc_Val2 <= 6)
          AnimatedOpacity(
            opacity: _visible1 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: GestureDetector(
              onDoubleTap: (){
                if(_visible1) {
                  setState(() {

                    _visible1 = !_visible1;

                    task2status = true;

                    acc_Val2 = 10;
                    if( task1status == true  && task3status == true ) {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => HomePage()
                      // ));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()
                          ),
                          ModalRoute.withName("/HomePage")
                      );
                    }
                  });
                }
              },
              child: buildTask2card_2(),
            ),
          ),

        if(acc_Val2 >= 7 && acc_Val2 <= 9)
        AnimatedOpacity(
          opacity: _visible1 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: GestureDetector(
            onDoubleTap: (){
              if(_visible1) {
                setState(() {

                  _visible1 = !_visible1;

                  task2status = true;

                  acc_Val2 = 10;
                  if( task1status == true  && task3status == true ) {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => HomePage()
                    // ));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage()
                        ),
                        ModalRoute.withName("/HomePage")
                    );
                  }
                });
              }
            },
            child: buildTask2card_3(),
          ),
        ),

        if(acc_Val3 <= 3)
          AnimatedOpacity(
            opacity: _visible2 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: GestureDetector(
              onDoubleTap: (){
                if(_visible2) {
                  setState(() {

                    _visible2 = !_visible2;

                    acc_Val3 = 10;
                    if( task1status == true && task2status == true ) {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => HomePage()
                      // ));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()
                          ),
                          ModalRoute.withName("/HomePage")
                      );
                    }
                  });
                }
              },
              child: buildTask3card_1(),
            ),
          ),

        if(acc_Val3 >= 4 && acc_Val3 <= 6)
          AnimatedOpacity(
            opacity: _visible2 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: GestureDetector(
              onDoubleTap: (){
                if(_visible2) {
                  setState(() {

                    _visible2 = !_visible2;

                    acc_Val3 = 10;
                    if( task1status == true && task2status == true ) {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => HomePage()
                      // ));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()
                          ),
                          ModalRoute.withName("/HomePage")
                      );
                    }
                  });
                }
              },
              child: buildTask3card_2(),
            ),
          ),
        if(acc_Val3 >= 7 && acc_Val3 <= 9)
        AnimatedOpacity(
          opacity: _visible2 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: GestureDetector(
            onDoubleTap: (){
              if(_visible2) {
                  setState(() {

                    _visible2 = !_visible2;

                    acc_Val3 = 10;
                    if( task1status == true && task2status == true ) {
                      // Navigator.of(context).push(MaterialPageRoute(
                      // builder: (context) => HomePage()
                      // ));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()
                          ),
                          ModalRoute.withName("/HomePage")
                      );
                    }
                  });
              }
            },
            child: buildTask3card_3(),
          ),
        ),
        if(acc_Val1 == 10 && acc_Val2 == 10 && acc_Val3 == 10)
        AnimatedOpacity(
          opacity: _visible3 ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: GestureDetector(
            onDoubleTap: (){
              if(_visible3) {
                setState(() {

                  _visible3 = !_visible3;

                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => HomePage()
                  // ));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()
                      ),
                      ModalRoute.withName("/HomePage")
                  );
                });
              }
            },
            child: buildDone(),
          ),
        ),
      ],
    ),
  )
   );}

  Widget buildTask1card_1() => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 50,
    shadowColor: Colors.red,
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Ink.image(
        //   image: NetworkImage(
        //     'https://previews.123rf.com/images/varijanta/varijanta1604/varijanta160400089/55848269-modern-thin-line-design-concept-for-events-website-banner-vector-illustration-concept-for-informatio.jpg',
        //   ),
        //   //colorFilter: ColorFilters.greyscale,
        //   child: InkWell(
        //     onTap: () {},
        //   ),
        //   height: 240,
        //   fit: BoxFit.cover,
        // ),
        Image.asset(
          "assets/images/events.jpg",
          height: 248,
          fit: BoxFit.cover,
        ),
        Text(
          'Go To A Social Event',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );

  Widget buildTask1card_2() => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 50,
    shadowColor: Colors.purple,
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Ink.image(
        //   image: NetworkImage(
        //     'https://miro.medium.com/max/1400/1*A0xqqOV7LXlLEK1Acu8BFw.jpeg',
        //   ),
        //   //colorFilter: ColorFilters.greyscale,
        //   child: InkWell(
        //     onTap: () {},
        //   ),
        //   height: 240,
        //   fit: BoxFit.cover,
        // ),
        Image.asset(
          "assets/images/friends.jpeg",
          height: 248,
          fit: BoxFit.cover,
        ),
        Text(
          'Talk With Your Friends',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );

  Widget buildTask1card_3() => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 50,
    shadowColor: Colors.deepPurpleAccent,
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Ink.image(
        //   image: NetworkImage(
        //     'https://media.istockphoto.com/id/1349476600/vector/talk-conversation-concept.jpg?s=612x612&w=0&k=20&c=4pq7uNqStestoXXlVrYPJOdz0AT18gclj9JN7sPJEZ8=',
        //   ),
        //   //colorFilter: ColorFilters.greyscale,
        //   child: InkWell(
        //     onTap: () {},
        //   ),
        //   height: 240,
        //   fit: BoxFit.cover,
        // ),
        Image.asset(
          "assets/images/talk.jpg",
          height: 248,
          fit: BoxFit.cover,
        ),
        Text(
          'You Can Do It, Little More',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );

  Widget buildTask2card_1() => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 50,
    shadowColor: Colors.deepOrange,
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Ink.image(
        //   image: NetworkImage(
        //     'https://media.istockphoto.com/id/186446684/photo/piano-on-the-beach.jpg?s=612x612&w=0&k=20&c=z6TBbHmekbyVj1lXO2JIRocUrayDfteVT_uU3nkyAZ4=',
        //   ),
        //   // colorFilter: ColorFilters.greyscale,
        //   child: InkWell(
        //     onTap: () {},
        //   ),
        //   height: 240,
        //   fit: BoxFit.cover,
        // ),
        Image.asset(
          "assets/images/peaceful.jpg",
          height: 248,
          fit: BoxFit.cover,
        ),
        Text(
          'Listen Peaceful Music',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );

  Widget buildTask2card_2() => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 50,
    shadowColor: Colors.redAccent,
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Ink.image(
        //   image: NetworkImage(
        //     'https://media.istockphoto.com/id/186446684/photo/piano-on-the-beach.jpg?s=612x612&w=0&k=20&c=z6TBbHmekbyVj1lXO2JIRocUrayDfteVT_uU3nkyAZ4=',
        //   ),
        //   // colorFilter: ColorFilters.greyscale,
        //   child: InkWell(
        //     onTap: () {},
        //   ),
        //   height: 240,
        //   fit: BoxFit.cover,
        // ),
        Image.asset(
          "assets/images/sadsong.jpg",
          height: 248,
          fit: BoxFit.cover,
        ),
        Text(
          'Listen Sad Music',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
            fontStyle: FontStyle.italic
          ),
        ),
      ],
    ),
  );

  Widget buildTask2card_3() => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 50,
    shadowColor: Colors.deepOrange,
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Ink.image(
        //   image: NetworkImage(
        //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_8vEJkdhMejsvisY_tkSs8MFJH6fUfIK5FA&usqp=CAU',
        //   ),
        //   // colorFilter: ColorFilters.greyscale,
        //   child: InkWell(
        //     onTap: () {},
        //   ),
        //   height: 240,
        //   fit: BoxFit.cover,
        // ),
        Image.asset(
          "assets/images/favourite.jpg",
          height: 248,
          fit: BoxFit.cover,
        ),
        Text(
          'Listen Your Favorite Song',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );

  Widget buildTask3card_1() => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 50,
    shadowColor: Colors.purple,
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Ink.image(
        //   image: NetworkImage(
        //     'https://as2.ftcdn.net/v2/jpg/03/51/60/57/1000_F_351605712_LXWLF7WJtVBMamZfAUGHFYjr4M4m8wHK.jpg',
        //   ),
        //  // colorFilter: ColorFilters.greyscale,
        //   child: InkWell(
        //     onTap: () {},
        //   ),
        //   height: 240,
        //   fit: BoxFit.cover,
        // ),
        Image.asset(
          "assets/images/yoga.jpg",
          height: 248,
          fit: BoxFit.cover,
        ),
        Text(
          'Relax Your Mind, Do Yoga',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.italic
          ),
        ),
      ],
    ),
  );

  Widget buildTask3card_2() => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 50,
    shadowColor: Colors.green,
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Ink.image(
        //   image: NetworkImage(
        //     'https://www.exploregeorgia.org/sites/default/files/legacy_images/gibbs-gardens-rose-arbor-1-1495035202.jpg',
        //   ),
        //   // colorFilter: ColorFilters.greyscale,
        //   child: InkWell(
        //     onTap: () {},
        //   ),
        //   height: 240,
        //   fit: BoxFit.cover,
        // ),
        Image.asset(
          "assets/images/garden.jpg",
          height: 248,
          fit: BoxFit.cover,
        ),
        Text(
          'Go For A Walk In Garden',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.italic
          ),
        ),
      ],
    ),
  );

  Widget buildTask3card_3() => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 50,
    shadowColor: Colors.blueGrey,
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Ink.image(
        //   image: NetworkImage(
        //     'https://theflexibleprofessional.com/wp-content/uploads/2020/11/Productivity-Playlist-e1604853611514.jpg',
        //   ),
        //   // colorFilter: ColorFilters.greyscale,
        //   child: InkWell(
        //     onTap: () {},
        //   ),
        //   height: 240,
        //   fit: BoxFit.cover,
        // ),
        Image.asset(
          "assets/images/work.jpg",
          height: 248,
          fit: BoxFit.cover,
        ),
        Text(
          'Complete Some Work',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.italic
          ),
        ),
      ],
    ),
  );

  Widget buildDone() => Card(
    clipBehavior: Clip.antiAlias,
    elevation: 100,
    shadowColor: Colors.red,
    margin: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        // Ink.image(
        //   image: NetworkImage(
        //     'https://images.pexels.com/photos/206359/pexels-photo-206359.jpeg?cs=srgb&dl=pexels-pixabay-206359.jpg&fm=jpg',
        //   ),
        //   // colorFilter: ColorFilters.greyscale,
        //   child: InkWell(
        //     onTap: () {},
        //   ),
        //   height: 240,
        //   fit: BoxFit.cover,
        // ),
        Image.asset(
          "assets/images/Done.jpg",
          height: 248,
            fit: BoxFit.cover,
        ),
        Text(
          'You Are Done For Today !!',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );

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
