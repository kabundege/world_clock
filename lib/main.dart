import 'package:flutter/material.dart';
import 'package:todo/screens/chooselocation.dart';
import 'package:todo/screens/home.dart';
import 'package:todo/screens/loading.dart';


void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => Loading(),
        '/home':(context) => Home(),
        '/location':(context)=> ChooseLocation(),
      },
    ));
