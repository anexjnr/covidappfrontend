import 'package:covidapp/pages/viewpage.dart';
import 'package:flutter/material.dart';

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.withOpacity(0.5),
      appBar: AppBar(
        title: Text("Covid 19"),
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.2),
      ),
      body: Container(
        padding: EdgeInsets.all(110),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPage()));
            }, child: Text("View Patients")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPage()));
            }, child: Text("Add Patients")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));
            }, child: Text("Search Patients")),
          ],
        ),
      ),
    );
  }
}