import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location; //location name
  String time;
  String flag;
  String url;
  bool isDayTime = false;
  bool network;

  WorldTime({this.location, this.flag, this.url});

  Future getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get proporties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create a date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      network = true;
    } catch (e) {
      print(e.toString());
      network = false;
    }
  }
}
