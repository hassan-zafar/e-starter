// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:estarter1/main.dart';

class HomeEntrepneur extends StatelessWidget {
  const HomeEntrepneur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      backgroundColor: Color(0xFF21BFBD),
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
              leading: Icon(Icons.home),
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
              leading: Icon(Icons.lock),
            ),
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
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          Text(
            '  Top Rated',
            style: TextStyle(
                fontFamily: 'Futur',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50.0),
          ),
          Text(
            '  Investors',
            style: TextStyle(
                fontFamily: 'Futur',
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 45.0),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 500.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 300.0,
                    child: ListView(
                      children: [
                        _viewimg('assets/lakhani.jpg', 'Babar Lakhani',
                            'Lakson Group of Companies'),
                        _viewimg('assets/zamindar.jpg', 'Naeem Zamindar',
                            'Neem Exponential'),
                        _viewimg('assets/Maria.png', 'Maria Umar',
                            'Women Digital League'),
                        _viewimg('assets/hmazhar.jpg', 'Humayun Mazhar',
                            'Cres Ventures'),
                        _viewimg('assets/Jehan.jpg', 'Jehan Ara',
                            'President at PASHA'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _viewimg(String imgpth, String name, String cmpname) {
  return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {
/*            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsPage(
                    heroTag: imgPath, foodName: foodName, foodPrice: price)));
 */
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  child: Row(children: [
                Hero(
                    tag: imgpth,
                    child: Image(
                        image: AssetImage(imgpth),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0)),
                SizedBox(width: 10.0),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(name,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold)),
                  Text(cmpname,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15.0,
                          color: Colors.grey))
                ])
              ])),
            ],
          )));
}
