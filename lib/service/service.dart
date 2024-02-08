import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class WelcomeApiService
{
   getData(String mobile) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://192.168.154.143:3001/api/patiententry/search");
    var response = await client.post(apiUri,
      headers: <String,String>
      {
        "Content-Type":"application/json; charset=UTF-8"
      },
      body: jsonEncode(<String,String>
      {
        "mobile" : mobile
      }
      ),
    );
    if(response.statusCode == 200)
    {
      var resp = response.body;
      return welcomeFromJson(resp);
    }
    else
    {
      throw Exception("no data");
    }
  }
  Future<dynamic> sendData(
      String name,String symptomes,String mobile,String status
      ) async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://192.168.154.143:3001/api/patiententry/add");
    var response = await client.post(apiUri,
      headers: <String,String>
      {
        "Content-Type":"application/json; charset=UTF-8"
      },
      body: jsonEncode(<String,String>
      {"name" : name,
        "symptomes" : symptomes,
        "mobile" : mobile,
        "status" : status
      }
      ),
    );
    if(response.statusCode==200)
    {
      var resp = response.body;
      return jsonDecode(resp);
    }
    else
    {
      throw Exception("Failed to send data");
    }
  }
  Future<List<Welcome >> getWelcome() async
  {
    var client = http.Client();
    var apiUri = Uri.parse("http://192.168.154.143:3001/api/patiententry/viewall");
    var response = await client.get(apiUri);
    if(response.statusCode == 200)
    {
      var resp = response.body;
      return welcomeFromJson(resp);
    }
    else
    {
      return [];
    }
  }
}