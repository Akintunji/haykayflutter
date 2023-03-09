import 'package:Data/Data.dart' as Data;
import 'package:Electricity/Electricity.dart' as Electricity;
import 'package:Cable/Cable_class.dart' as Cable;
import 'package:Vtu/Vtu_class.dart' as Vtu;
import 'package:flutter/material.dart';

class dashboard_class extends StatefulWidget {

const API_URL = 'https://haykaytelecoms.com.ng/api/get_token';

  Future<List> buydas() async {

    final response = await http.get(API_URL);
    if (response.statusCode == 200) {
    Songs=jsonDecode(response.songsurl);
   Songname=jsonDecode(response.songname);

    } else {
      throw Exception('Failed to load songs');
    }
  }
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ), 
      body: Container(
          color: Colors.#307D7E,
          padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[]
             Image.asset('assets/vtu.jpg');
             Text(
              "Vtu",
                style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Vtu()),
                );
             
 }
        
          Image.asset('assets/data.jpg');
             Text(
              "Data",
                style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Data()),
                );
             
 }
        
          Image.asset('assets/cable.jpg');
             Text(
              "Cable Subscription ",
                style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Cable()),
                );
             
 }
        
          Image.asset('assets/electricity.jpg');
             Text(
              "Electricity",
                style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>Electricity()),
                );
             
 }
        
       

          ),
      ),
           
    ),
 },
    





