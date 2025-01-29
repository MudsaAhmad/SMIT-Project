import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_project/Constants/constants.dart';
import 'package:smit_project/view/componants/button.dart';
import 'package:http/http.dart' as http;
import 'package:smit_project/view/componants/toast.dart';

import '../componants/snack_bar.dart';

class LoginScreenPOSTAPI extends StatefulWidget {
  const LoginScreenPOSTAPI({super.key});

  @override
  State<LoginScreenPOSTAPI> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenPOSTAPI> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Login Screen POST API',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.getString('id');
              sp.getString('token');

             // sp.clear();
               sp.remove('id');

               String id = sp.getString('id').toString();
              String token = sp.getString('token').toString();

              print('id empty -----> $id and token empty -----$token' );


            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your email',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
          Button(
            title: 'POST API',
            onTap: () async {

              setState(() {
                loading = true;
              });
              final url = Uri.parse('apiLoginUrl');
              print('URL: $url');

              final headers = {
                "Content-Type": "application/json",
              };
              print('Headers: $headers');

              final requestBody = {
                "email": emailController.text,
                "password": passwordController.text,
              };
              print('Request Body: $requestBody');

              Response response = await http.post(url, headers: headers, body: json.encode(requestBody));



              print('Response: ${response.body}');

              final convertResponse = json.decode(response.body);

              String id = convertResponse['id'];
              String token = convertResponse['token'];

             final SharedPreferences sp = await SharedPreferences.getInstance();

                sp.setString('id', id).toString();
                  sp.setString('token', token).toString();
                 //print('id stored ----> $idStored');
                 //print('token stored ----> $tokenStored');

              print('User data saved: ID -> $id, Token -> $token');


              print('id ------> $id');
              print('token ------> $token');

              String? error = convertResponse['msg'];

              if (response.statusCode == 200) {
                print('Success Message');
                setState(() {
                  loading = false;
                });
              } else {
                print('Error Message: $error');
                setState(() {
                  loading = false;
                });
              }

              // Show Flutter Toast
              Fluttertoast.showToast(
                msg: error ?? 'An unexpected error occurred',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red,
                textColor: Colors.white, // Use white for better readability
                fontSize: 16.0,
              );
            },
            isLoading: loading,
            color: Colors.teal,
          ),
            ],
          ),
        ),
      ),
    );
  }
}









// user logout indside on tap
//  final SharedPreferences prefs =
//                   await SharedPreferences.getInstance();

//               // Clear SharedPreferences
//               await prefs.clear();

//               print('User logged out, SharedPreferences cleared.');

//               // Retrieve the values to confirm they are empty
//               String? userId = prefs.getString('user_id');
//               String? authToken = prefs.getString('auth_token');

//               print('Stored userId after logout: $userId'); // Should be null
//               print(
//                   'Stored authToken after logout: $authToken');


// POST API on tap
//  setState(() {
//                     loading = true;
//                   });

//                   // url
//                   final url = Uri.parse(apiLoginUrl);
//                   print('url --------->$url');

//                   // headers
//                   final headers = {
//                     'Content-Type': 'application/json',
//                   };
//                   print('headers --------->$headers');
//                   // body
//                   final requestBody = {
//                     "email": emailController.text, // Extract text
//                     "password": passwordController.text, // Extract text
//                   };
//                   print('body --------->$requestBody');

//                   try {
//                     Response response = await http.post(url,
//                         headers: headers, body: json.encode(requestBody));
//                     print('response -----> ${response.body.toString()}');

//                     if (response.statusCode == 200) {
//                       final responseData = jsonDecode(response.body);

//                       final String id = responseData['id'];
//                       final String token = responseData['token'];
//                       print('id- ------->$id');
//                       print('token- ------->$token');

//                       final SharedPreferences prefs =
//                           await SharedPreferences.getInstance();
//                       await prefs.setString('user_id', id);
//                       await prefs.setString('auth_token', token);
//

//                       print(
//                           'final get response ------------> ${responseData.toString()}');
//                       setState(() {
//                         loading = false;
//                       });
//                     } else {
//                       final responseData = jsonDecode(response.body);

//                       print(
//                           ' get error in response ---------->${responseData.toString()}');
//                       setState(() {
//                         loading = false;
//                       });
//                     }
//                   } catch (error) {
//                     print('error ---------> $error');
//                     setState(() {
//                       loading = false;
//                     });
//                   }