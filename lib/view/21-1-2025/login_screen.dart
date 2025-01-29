import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_project/Constants/constants.dart';
import 'package:smit_project/view/21-1-2025/Bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: const Text('Login Screen',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100,),
              Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'enter your email',
                      border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                    ),
                  ),
              ),
              const SizedBox(height: 20,),
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: TextFormField(
                    controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'enter your password',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)
                  ),
                ),
              ),
              const SizedBox(height: 50,),
               Container(
                 height: 55,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   color: Colors.teal,
                   borderRadius: BorderRadius.circular(8),
                 ),
                 child: TextButton(
                     onPressed: () {
                       print('email ---> ${emailController.text}');
                       print('password ---> ${passwordController.text}');
                       logIn(context: context,email: emailController.text, password: passwordController.text);
                     },
                 child: const Text('POST',style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.w500,
                   color: Colors.white
                 ),)),
               ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> logIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final url = Uri.parse('apiLoginUrl');
      final headers = {
        'Content-Type': 'application/json',
      };
      final requestBody = {
        'email': email,
        'password': password,
      };
      print('request body ----> ${requestBody.toString()}');
      Response response = await post(url, headers: headers, body: json.encode(requestBody));
      print('response before status code ---- > ${response.body.toString()}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var data = jsonDecode(response.body.toString());

        SharedPreferences sp = await SharedPreferences.getInstance();
        String id = '${data['id']}';
        String token = '${data['token']}';
        print('id stored in shared preferences ---- ${id.toString()}');
        print('token stored in shared preferences ---- ${token.toString()}');
        sp.setString('id', id);
        sp.setString('token', token);

        print("Response status: ${data['status']}");
        print("Response message: ${data['msg']}");
        print("Response id: ${data['id']}");
        print("Response token: ${data['token']}");
        Navigator.push(context,MaterialPageRoute(builder: (context) => const BottomBar()));
      } else {
        print("Error ----> ${response.body}");
      }
    } catch (e) {
      print('error----------> $e');
    }
  }
}
