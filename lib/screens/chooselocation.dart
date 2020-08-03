import 'package:flutter/material.dart';
import 'package:todo/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Kenya', flag: 'kenya.gif', url: 'Africa/Nairobi'),
    WorldTime(location: 'Sao Paulo', flag: 'brazil.gif', url: 'America/Sao_Paulo'),
    WorldTime(location: 'London', flag: 'uk.gif', url: 'Europe/London'),
    WorldTime(location: 'NewYork', flag: 'usa.gif', url: 'America/New_York'),
    WorldTime(location: 'Shanghai', flag: 'china.gif', url: 'Asia/Shanghai'),
  ];
  void updateLocation(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'time': instance.time,
      'flag': instance.flag,
      'location': instance.location,
      'isDayTime': instance.isDayTime,
      'network': instance.network,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose a location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateLocation(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue[900],
        child: Icon(Icons.check),
      ),
    );
  }
}
