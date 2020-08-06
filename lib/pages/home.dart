import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map datas = {};

  @override
  Widget build(BuildContext context) {
    datas = datas.isNotEmpty ? datas : ModalRoute.of(context).settings.arguments;
    String bg_img = datas['range'] ? 'morning.jpg' : 'night.jpg';

    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/$bg_img',),fit: BoxFit.cover)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10,),
                  FlatButton.icon(
                    color: Colors.white,
                      onPressed: () async{
                         dynamic result = await Navigator.pushNamed(context, "/location");
                         print("Result:$result");
                         if(result != null){
                           setState(() {
                             datas = {
                               'time':result['time'],
                               'location':result['location'],
                               'range':result['range'],
                               'flag':result['flag']
                             };
                           });
                         }
                      },
                      icon: Icon(Icons.not_listed_location),
                      label: Text("Select Location")),
                      SizedBox(height: 110,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(datas['location'],style: TextStyle(
                            fontSize: 30,letterSpacing: 2, color: Colors.white
                          ),),
                          SizedBox(width: 20,),
                          Text(datas['time'],style: TextStyle(
                              fontSize: 45,fontWeight: FontWeight.bold,letterSpacing: 2,color: Colors.white
                          ),),

                        ],
                      )
                  ],
              ),
            ),
          )
      ),
    );
  }
}
