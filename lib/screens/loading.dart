import 'package:flutter/material.dart';
import 'package:todo/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    WorldTime instance =
        WorldTime(location: 'Kenya', flag: 'kenya.jpg', url: 'Africa/Nairobi');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': instance.time,
      'flag': instance.flag,
      'location': instance.location,
      'isDayTime': instance.isDayTime,
      'network': instance.network,
    });
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(color: Colors.white, size: 50.0),
      ),
    );
  }
}
