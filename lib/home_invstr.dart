// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class homeinv extends StatelessWidget {
  const homeinv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      backgroundColor: Colors.blueGrey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'Syed Ali Hamza',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              accountEmail: Text(
                'alihamza.syed12@gmail.com',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.ytimg.com/an_webp/5WPF_uo_A_U/mqdefault_6s.webp?du=3000&sqp=CLrrn4sG&rs=AOn4CLD-tEQHACp4OzOWRauXHCwC6XA1tA'),
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text('Home'),
              leading: Icon(Icons.home_filled),
            ),
            Divider(
              thickness: 5.0,
              color: Colors.black,
            ),
            ListTile(
              onTap: () {},
              title: Text('Profile'),
              leading: Icon(Icons.person),
            ),
            Divider(
              thickness: 5.0,
              color: Colors.black,
            ),
            ListTile(
                onTap: () {},
                title: Text('Change Password'),
                leading: Icon(Icons.lock)),
            Divider(
              thickness: 5.0,
              color: Colors.black,
            ),
            ListTile(
              onTap: () {},
              title: Text('Chat Messenger'),
              leading: Icon(Icons.chat),
            ),
            Divider(
              thickness: 5.0,
              color: Colors.black,
            ),
            ListTile(
              onTap: () {},
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
            ),
            Divider(
              thickness: 5.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
