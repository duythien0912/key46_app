import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:training_and_diet_app/ui/pages/profile_screen.dart'
    show ProfileScreen;
import 'package:animal_planet/screens/landing_screen.dart' show LandingScreen;

import 'package:WHOFlutter/main.dart' as WHOFlutterApp;
import 'package:WHOFlutter/api/user_preferences.dart' as WHOFlutterAppApi;

void main() async {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool onboardingComplete = false;

  @override
  void initState() {
    super.initState();
    WHOFlutterAppApi.UserPreferences()
        .getOnboardingCompleted()
        .then((value) => onboardingComplete = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text("training_and_diet_app"),
              leading: Icon(Icons.apps),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            ListTile(
              title: Text("animal_planet_app"),
              leading: Icon(Icons.apps),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandingScreen()),
                );
              },
            ),
            ListTile(
              title: Text('WHOFlutter'),
              leading: Icon(Icons.apps),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WHOFlutterApp.MyApp(
                            showOnboarding: !onboardingComplete,
                          )),
                );
              },
            ),
            // ListTile(
            //   title: Text("app"),
            //   leading: Icon(Icons.apps),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ProfileScreen()),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
