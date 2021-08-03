import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'forth.dart';
import 'first.dart';

var list;
class ZeroPage extends StatefulWidget {

  @override
  _ZeroPageState createState() => _ZeroPageState();
}

class _ZeroPageState extends State<ZeroPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  void getData() async{
    http.Response response = await http.get('https://324ec8779cbe.ngrok.io');
    String data = response.body;
    var info=jsonDecode(data);
    list=info['default']['trendingSearchesDays'][0]['trendingSearches'];
    if (response.statusCode == 200 && list.length!=0) {
      print(list[0]["title"]["query"]);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FirstPage(
          result: info,
        ),
        ),
      );
    } else {
      print(response.statusCode);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForthPage()));
    }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.white,
            size: 100.0,
          ),
        ),
      ),
    );
  }
}