import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  bool network;
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.black;
    network = data['network'];

    return !network
        ? Scaffold(
            backgroundColor: Colors.blue[900],
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Network Error',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      icon: Icon(Icons.network_wifi, color: Colors.white),
                      color: Colors.blue,
                      label: Text(
                        'Try Again',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: bgColor,
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/$bgImage'),
                  fit: BoxFit.cover,
                )),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 50.0),
                  child: Column(
                    children: <Widget>[
                      FlatButton.icon(
                        onPressed: () async {
                          dynamic result =
                              await Navigator.pushNamed(context, '/location');
                          setState(() {
                            data = {
                              'time': result['time'],
                              'location': result['location'],
                              'flag': result['flag'],
                              'isDayTime': result['isDayTime'],
                              'netwok': result['network'],
                            };
                          });
                        },
                        icon: Icon(Icons.edit_location),
                        label: Text("Edit Location"),
                        color: Colors.white,
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            data['location'],
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                letterSpacing: 2.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        data['time'],
                        style: TextStyle(fontSize: 66.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
