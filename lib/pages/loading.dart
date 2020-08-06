import 'package:flutter/material.dart';
import 'package:time_around_world/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _Loading createState() => _Loading();
}

class _Loading extends State<Loading> {

  void setUpWorldTime() async{
    WorldTime object = WorldTime('Istanbul', 'Europe/Istanbul', 'turkey.jpg');
    await object.getTime();

   Navigator.pushNamed(context, '/home',arguments:
    {
      'location':object.location,
      'flag':object.flag,
      'time':object.time,
      'range':object.day_range
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: SpinKitWave(
          size: 90,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
