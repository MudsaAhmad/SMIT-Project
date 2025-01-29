

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_project/view/22-1-2025/bottom_bar.dart';
import 'package:smit_project/view/22-1-2025/hive_screen.dart';
import 'package:smit_project/view/componants/button.dart';
import '../../Constants/constants.dart';
import '../21-1-2025/Bottom_bar.dart';
import 'package:http/http.dart' as http;


class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  State<LoginScreen2> createState() => _LoginScreen2State();
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

class _LoginScreen2State extends State<LoginScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: InputBorder.none
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Enter your password',
                    border: InputBorder.none

                ),
              ),
            ),

            SizedBox(height: 50,),
            Button(title: 'POPST', onTap: (){



            }, isLoading: false, color: Colors.teal),
            GestureDetector(
              onTap: () async {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar2()));

                Navigator.push(context, MaterialPageRoute(builder: (context) => HiveScreen()));
                print('tapped---------');
           //  await loginAPIFunction(email: emailController.text, password: passwordController.text);
                print('tapped 2---------');


                // SharedPreferences sp = await SharedPreferences.getInstance();
                // String name = 'John';
                // print('name is stored ----------->$name');
                // sp.setString('name', name);

              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text('POST 2')),
              ),
            )

          ],
        ),
      ),
    );
  }

  // Post API Function
  Future<void> loginAPIFunction ({
    required String email,
    required String password,
  }) async {
    try{
      final url = Uri.parse('apiLoginUrl');
      print('url ------$url');
       final body = {
        'email': email,
        'password': password,
      };
      print('body ----- $body');
      final headers = {
        'Content-Type': 'application/json',
      };
      print('body ----- $headers');

      Response response = await http.post(url, headers: headers,body: json.encode(body),);
      print('response --------- ${response.body.toString()}');

      Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomBar2()));
      if(response.statusCode == 200)
        {
          print('yes status code 200 -----${response.body.toString()}');
        }else{
        print('Not status code 200 -----');
      }
    }catch(e){
      print('error ----------$e');
    }
  }
}
