import 'dart:convert';
import 'package:flutter/material.dart';
import 'third.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'forth.dart';
var topicname;

class SecondPage extends StatefulWidget {
  final storetopicname;
  SecondPage({this.storetopicname});
  @override
  _SecondPageState createState() => _SecondPageState();
}

var data;
class _SecondPageState extends State<SecondPage> {

  void trial() async{

    topicname = widget.storetopicname;
    http.Response response=await http.get("https://newsapi.org/v2/everything?q=$topicname&apiKey=0063eb78eb93433bb0199b52d05b4e5d");

    data=jsonDecode(response.body);
    if(response.statusCode==200 && data['totalResults']!=0)
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ThirdPage(
      information: data,
      )));
    }
    else
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForthPage()));
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.storetopicname);
    trial();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SpinKitFadingFour(
            color: Colors.white,
            size: 150.0,
          ),
        ),
      )

      
    ;
  }
}