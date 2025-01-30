import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:smit_project/view/30-1-2025/put_api_screen.dart';
import 'package:smit_project/view/componants/button.dart';

import 'model.dart';

class GetApiScreen extends StatefulWidget {
  const GetApiScreen({super.key});

  @override
  State<GetApiScreen> createState() => _GetApiScreenState();
}

class _GetApiScreenState extends State<GetApiScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   // fetchData();

  }


  Future<void> fetchData() async {
    try {
      setState(() {
        loading = true;
      });

      // url
      final url =
      Uri.parse('https://jsonplaceholder.typicode.com/posts');
      print('url --------->$url');

      final response = await http.get(url);

      setState(() {
        loading = false;
      });


      if(response.statusCode == 200){

        final getData = json.decode(response.body);

        for(Map<String,dynamic> i in getData){
          localList.add(GetModel.fromJson(i));
          // print('local list data ----------> $localList');
        }

        //  print('get data ----------> $getData');

      }else{
        print('error-------->');
      }

      print('response --->${response.body.toString()}');
    } catch (error) {
      print('error-------->$error');
      setState(() {
        loading = false;
      });
    }
  }


  // for loading
  bool loading = false;

  // List to store API data
  List<GetModel> localList = [];

  //Function to fetch data from API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Get API Data Screen',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: false,
        backgroundColor: Colors.teal,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PUTAPIScreen()));
              },
              icon: const Icon(
                Icons.add,
                size: 32,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: localList.length,
                itemBuilder: (context, index) {
                  print('data length ----->${localList.length}');
                //  final item = apiDataList[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal.shade100,
                        child: Text(
                        localList[index].userId.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(
                        localList[index].id.toString(),
                        // 'ID: ${item.id}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        localList[index].body.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          size: 16, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
            Button(
                title: 'GET API',
                onTap: () async {

                  try {
                    setState(() {
                      loading = true;
                    });

                    // url
                    final url =
                    Uri.parse('https://jsonplaceholder.typicode.com/posts');
                    print('url --------->$url');

                    final response = await http.get(url);

                    setState(() {
                      loading = false;
                    });


                    if(response.statusCode == 200){

                      final getData = json.decode(response.body);

                      for(Map<String,dynamic> i in getData){
                        localList.add(GetModel.fromJson(i));
                        // print('local list data ----------> $localList');
                      }

                      //  print('get data ----------> $getData');

                    }else{
                      print('error-------->');
                    }

                    print('response --->${response.body.toString()}');
                  } catch (error) {
                    print('error-------->$error');
                    setState(() {
                      loading = false;
                    });
                  }
                },
                //onTap: fetchData,
                isLoading: loading,
                color: Colors.teal),
          ],
        ),
      ),
    );
  }

  // Future<void> fetchData() async {
  //   try {
  //     setState(() {
  //       loading = true;
  //     });
  //
  //     final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  //
  //     final response = await http.get(url);
  //
  //     if (response.statusCode == 200) {
  //       // Decode JSON response
  //       List<dynamic> data = jsonDecode(response.body);
  //
  //       for (Map<String, dynamic> index in data) {
  //         apiDataList.add(GetModel.fromJson(index));
  //       }
  //
  //       // Show success message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text("Data fetched successfully!"),
  //           backgroundColor: Colors.green,
  //         ),
  //       );
  //
  //       setState(() {
  //         loading = false;
  //       });
  //     } else {
  //       // Show error message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text("Failed to fetch data!"),
  //           backgroundColor: Colors.red,
  //         ),
  //       );
  //       setState(() {
  //         loading = false;
  //       });
  //     }
  //   } catch (error) {
  //     // Handle network errors
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Error: ${error.toString()}"),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }
}
