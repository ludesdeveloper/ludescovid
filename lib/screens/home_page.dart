import 'package:flutter/material.dart';
//import screens
import 'package:ludescovid/screens/detail_page.dart';
import 'package:ludescovid/screens/total_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    TotalPage(),
    DetailPage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text('LuDeS Developer :'),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text('Seski Ramadhan'),
        ),
        Center(
          child: Text('Dedy Darisman'),
        ),
        Center(
          child: Text('Luthfi Anandra'),
        ),
      ],
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Covid 19 Indonesia')),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            title: Text('Summary'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Detail'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('About'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
