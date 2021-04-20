import 'package:flutter/material.dart';
import 'package:todoapp_flutter/screens/CategoriesScreen.dart';
import 'package:todoapp_flutter/screens/homeScreen.dart';

class DrawerNavigator extends StatefulWidget {
  @override
  _DrawerNavigatorState createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Ayesh Lakshan'),
              accountEmail: Text('aye@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://image.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            ListTile(
              title: Text('Categories'),
              leading: Icon(Icons.view_list),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Categories()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
