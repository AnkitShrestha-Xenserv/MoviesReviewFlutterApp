import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'movies_screen.dart';
import '../resources/movies_api_provider.dart';

class MainScreen extends StatefulWidget {
  createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  List<Widget> widgets = [HomeScreen(), MoviesScreen()];
  List<bool> stateNow = [true, false, false, false, false, false, false];
  Widget mainDisplay = HomeScreen();
  List headers = [
    'HOME',
    'MOVIES',
    'SERIES',
    'TV',
    'CELEBS',
    'NOTIFICATIONS',
    'AWARDS AND EVENTS'
  ];

  Widget build(context) {
    return Scaffold(
      appBar: createAppBar(),
      body: createBody(),
    );
  }

  Container createBody() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            child: buildSelectionTab(headers),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: mainDisplay,
            ),
          ),
        ],
      ),
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(20, 20, 20, 0.9),
    );
  }

  AppBar createAppBar() {
    return AppBar(
        backgroundColor: Color.fromRGBO(60, 60, 60, 0.9),
        title: Text('Movies!'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.supervised_user_circle),
          )
        ]);
  }

  Widget buildSelectionTab(List<String> headers) {
    return Container(
      color: Color.fromRGBO(30, 30, 30, 0.9),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
            children:
                List.generate(7, (index) => buildSection(headers, index))),
      ),
    );
  }

  Widget buildSection(List<String> headers, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
      child: InkWell(
          onTap: () => {
                setState(() {
                  for (int i = 0; i < stateNow.length; i++) {
                    stateNow[i] = false;
                  }
                  stateNow[index] = !stateNow[index];
                  mainDisplay = widgets[index];
                })
              },
          child: Text(
            '${headers[index]}',
            style: TextStyle(
                fontSize: 19,
                color: stateNow[index] ? Colors.white : Colors.white54,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
