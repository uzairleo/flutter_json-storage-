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
        child:Center(
          child:FutureBuilder(
            future: DefaultAssetBundle
            .of(context)
            .loadString('load_json/person.json'),
            builder:(context,snapshot){
              //decode from json
              var myData=json.decode(snapshot.data.toString());
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context,index){
                  return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text("name: "+myData[index]['name']),
                          Text("Gender: "+myData[index]['gender']),
                          Text("SkinColor: "+myData[index]['skin-color']),
                          Text("Height: "+myData[index]['height']),
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