import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:smit_project/Constants/constants.dart';
import 'package:smit_project/view/componants/button.dart';
import 'package:http/http.dart' as http;


class PUTAPIScreen extends StatefulWidget {
  const PUTAPIScreen({super.key});

  @override
  State<PUTAPIScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<PUTAPIScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'PUT API Screen',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
        ),
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
                  controller: currentPasswordController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your current password',
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
                  controller: newPasswordController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your new password',
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
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                      hintText: 'Confirm your new password',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 15)),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Button(
                title: 'PUT API',
                onTap: () async {

                  try{

                    setState(() {
                      loading = true;
                    });

                    // url
                    final url = Uri.parse(putAPIUrl);
                    print('url ------->$url');

                    // headers

                    String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ODlmY2I3YmI5ZjdlMzlkZmNiZjZmZiIsImlhdCI6MTczODI0NTczOX0.NL9LStizBNQ_58Cbp1_Fmipgaz8qJmge703BFiwCwfc";

                    final headers = {
                      "Content-Type": "application/json",
                      "Authorization": "Bearer $token"
                    };

                    print('headers ---------->$headers)');

                    // request body
                    final requestBody = {
                      "currentPassword": currentPasswordController.text,
                      "password": newPasswordController.text,
                      "confirmPassword": confirmPasswordController.text,
                    };
                    print('body ---------->$requestBody');

                    final response = await http.put(url,headers: headers,body: json.encode(requestBody));

                    if(response.statusCode == 200){

                      final getResponse = json.decode(response.body);

                      setState(() {
                        loading = false;
                      });
                      print('get response ---------> $getResponse}');

                    }else{
                      print('error-------------->');
                      setState(() {
                        loading = false;
                      });
                    }

                  }catch(error){
                    print('error------>$error');
                    setState(() {
                      loading = false;
                    });
                  }

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

// setState(() {
// loading = true;
// });
// final url = Uri.parse(putAPIUrl);
// print('URL: $url');
//
// const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3ODlmY2I3YmI5ZjdlMzlkZmNiZjZmZiIsImlhdCI6MTczODIzMzk0Nn0.iljttuKwIrGEjmknwAYSSt6HYQR_6hhRpQsy6hNi_IU';
//
// final headers = {
// "Content-Type": "application/json",
// "Authorization": "Bearer $token",
// };
// print('Headers-----> $headers');
//
// final requestBody = {
// "currentPassword": currentPasswordController.text,
// "password": newPasswordController.text,
// "confirmPassword": confirmPasswordController.text,
// };
// print('Request Body-------> $requestBody');
//
// Response response = await http.put(url, headers: headers, body: json.encode(requestBody));
// print('Response-------> ${response.body}');
//
// final convertResponse = json.decode(response.body);
//
// String? error = convertResponse['msg'];
//
// if (response.statusCode == 200) {
// print('Success Message');
// setState(() {
// loading = false;
// });
// } else {
// print('Error Message: $error');
// setState(() {
// loading = false;
// });
// }
//
// // Show Flutter Toast
// Fluttertoast.showToast(
// msg: error ?? 'An unexpected error occurred',
// toastLength: Toast.LENGTH_LONG,
// gravity: ToastGravity.TOP,
// backgroundColor: Colors.green,
// textColor: Colors.white, // Use white for better readability
// fontSize: 16.0,
// );