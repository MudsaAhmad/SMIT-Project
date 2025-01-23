
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceScreen extends StatefulWidget {
  const SharedPrefrenceScreen({super.key});

  @override
  State<SharedPrefrenceScreen> createState() => _SharedPrefrenceScreenState();
}

class _SharedPrefrenceScreenState extends State<SharedPrefrenceScreen> {


  String? storedValue;
  @override
  void initState() {
    super.initState();
    _loadValue();
  }
  // Load value from SharedPreferences
  Future<void> _loadValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      storedValue = prefs.getString('key');
    });
  }
  // Remove value from SharedPreferences
  Future<void> _removeValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('key');
    setState(() {
      storedValue = null;
    });
  }



  Future<void> setName() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String name = "Aslam";
    int number = 10;
    sp.setString('name', name);
    print('name stored in shared preference ---------$name');
  }

  Future<void> getName() async {
    SharedPreferences prefrences = await SharedPreferences.getInstance();
    String removeName =  await prefrences.remove('name').toString();
    print('sp -----> ${removeName}');

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              storedValue != null
                  ? "Stored Value: $storedValue"
                  : "No Value Found",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: getName,
              child: Text("Remove Value"),
            ),
          ],
        ),
      ),
    );
  }
}
