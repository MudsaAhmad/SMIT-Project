import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smit_project/view/21-1-2025/login_screen.dart';

import '../models/user_model.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

List<UserModel> showDataList = [];

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen 2'),
        actions: [
          IconButton(onPressed: () async {

            SharedPreferences sp = await SharedPreferences.getInstance();
            String? id = sp.get('id').toString();
            String? token = sp.get('token').toString();

            print('id -------> ${id.toString()}');
            print('token -------> ${token.toString()}');

            await sp.clear();
            print('Logged out successfully--------------->');
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

          }, icon: Icon(Icons.logout),),
        ],
      ),
    //   body: FutureBuilder(
    //     future: getAPIData(),
    //     builder:(context, snapshot) {
    //       return ListView.builder(
    //         itemCount: showDataList.length,
    //           itemBuilder: (context, index) {
    //           print('length --> ${showDataList.length}');
    //             return ListTile(
    //               leading: Text('User id : ${showDataList[index].userId}'),
    //               title: Text('id : ${showDataList[index].id}'),
    //               subtitle: Text('body : ${showDataList[index].body}'),
    //             );
    // }
    //       );
    //     }),
    );
  }


  Future<List<UserModel>> getAPIData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    print('get response ---> ${response.body}' );
    var data = jsonDecode(response.body.toString());
    print('data ---->${data.toString()}');
    if(response.statusCode == 200){
      print('success');
      for(Map<String, dynamic> index in data){
        showDataList.add(UserModel.fromJson(index));
      }
    }else{
      print('Something went wrong');
    }
    return showDataList;
}}
