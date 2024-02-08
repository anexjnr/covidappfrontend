import 'package:courses/service.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String name="";
  String symptomes="";
  String mobile="";
  String status="";
  TextEditingController n1 = new TextEditingController();
  TextEditingController n2 = new TextEditingController();
  TextEditingController n3 = new TextEditingController();
  TextEditingController n4 = new TextEditingController();

  void SendApi() async
  {
    name = n1.text;
    symptomes = n2.text;
    mobile = n3.text;
    status = n4.text;
    final response = await WelcomeApiService().sendData(name,symptomes,mobile,status);
    if(response["status"]=="success")
    {
      showSimplePopup(context, "Success!");
    }
    else
    {
      print("Error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.withOpacity(0.5),
      appBar: AppBar(
        title: Text("Add Patient"),
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.2),
      ),
      body: Container(
        padding: EdgeInsets.all(34),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 65,
              ),
              TextField(
                  style: TextStyle(color: Colors.black),
                  controller: n1,
                  decoration: InputDecoration(
                    labelText: "name",
                    labelStyle: TextStyle(color: Colors.black),
                  )
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: n2,
                decoration: InputDecoration(
                  labelText: "symptomes",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: n3,
                decoration: InputDecoration(
                  labelText: "mobile",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                style: TextStyle(color: Colors.black),
                controller: n4,
                decoration: InputDecoration(
                  labelText: "status",
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(onPressed: SendApi, child: Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
  void showSimplePopup(BuildContext context, String s) {
    final snackBar = SnackBar(
      content: Text(s),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}