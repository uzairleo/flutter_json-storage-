import 'dart:collection';

import 'package:flutter/material.dart';
import 'dart:convert';
class JsonDemo extends StatefulWidget {
  @override
  _JsonDemoState createState() => _JsonDemoState();
}

class _JsonDemoState extends State<JsonDemo> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("JsonDemo"),
        centerTitle: true,
      ),
      body: Container(
        child:  Center(
          child:FutureBuilder(
            future: DefaultAssetBundle
            .of(context)
            .loadString('load_json/person.json'),
            builder:(context,snapshot){
              // decode from json(decode means deserialized or translating data structure into a string )
              //this var is here checked and its a List in real
              List<dynamic> myData=json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: (myData==null)?0:myData.length,
                itemBuilder: (BuildContext context,index){
                  return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("names  : "+myData[index]['name']),
                          Text("Gender : "+myData[index]['gender']),
                          Text("SkinColor : "+myData[index]['skin-color']),
                          Text("Height : "+myData[index]['height']),
                          SizedBox(height:10.0)
                        ],
                      ),
                  );
                });
            })
        )
      ),
    );
  }
}