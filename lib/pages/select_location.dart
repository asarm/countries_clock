import 'package:flutter/material.dart';
import 'package:time_around_world/services/world_time.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocation createState() => _SelectLocation();
}

class _SelectLocation extends State<SelectLocation> {
  List<WorldTime> locations = [
    WorldTime('Istanbul', 'Europe/Istanbul', 'assets/turkey.png'),
    WorldTime('Berlin', 'Europe/Berlin', 'assets/germany.png'),
    WorldTime('London', 'Europe/London', 'assets/england.png'),
    WorldTime('Denver', 'America/Denver', 'assets/america.png'),
    WorldTime('Dubai', 'Asia/Dubai', 'assets/united_arab_emirates.png'),
  ];

  void updateTime(index) async{
    WorldTime object = locations[index];
    await object.getTime();
    
    Navigator.pop(context,
        {
         'location':object.location,
         'time':object.time,
         'flag':object.flag,
         'range':object.day_range
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Select Location"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20),
          child: ListView.builder(
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(backgroundImage: AssetImage(locations[index].flag),radius: 20,),
                    title: Text(locations[index].location),
                    onTap: (){
                        updateTime(index);
                    },
                  ),
                );
              },
              itemCount: locations.length,
          )
      ),
    );
  }
}
