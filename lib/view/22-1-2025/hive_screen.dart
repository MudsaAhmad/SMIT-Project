import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});

  @override
  State<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  final _myBox = Hive.box('testBox');
  final TextEditingController _textController = TextEditingController();
  String _displayedData = 'No Data Found';

  // Write data
  void writeData() {
    String inputData = _textController.text.trim();
    if (inputData.isNotEmpty) {
      _myBox.put(1, inputData);
      setState(() {
        _displayedData = inputData;
      });
      print('Data inserted: $inputData');
      print('My box data stored: ${_myBox.toMap()}');
      _textController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter some data')),
      );
    }
  }

  // Read data
  void readData() {
    String? readData = _myBox.get(1);
    setState(() {
      _displayedData = readData ?? 'No Data Found --- ';
    });
    print('Read data: $readData');
    print('My box data stored: ${_myBox.toMap()}');
  }

  // Delete data
  void deleteData() {
    _myBox.delete(1);
    setState(() {
      _displayedData = 'No Data Found';
    });
    print('Data deleted');
    print('My box data stored: ${_myBox.toMap()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Hive Database Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text Field
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter Data',
                hintText: 'Type something...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Displayed Data
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.teal),
              ),
              child: Text(
                'Stored Data: $_displayedData',
                style: TextStyle(fontSize: 16, color: Colors.teal.shade800),
              ),
            ),
            const SizedBox(height: 20),

            // Action Buttons
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: writeData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: Text('Write Data', style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w400,)),
                ),
                ElevatedButton(
                  onPressed: readData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  child: const Text('Read Data'),
                ),
                ElevatedButton(
                  onPressed: deleteData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: const Text('Delete Data'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}