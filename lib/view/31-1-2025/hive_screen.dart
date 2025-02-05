import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:smit_project/view/componants/button.dart';
import 'hive_data_model.dart';

class HiveDataScreen extends StatefulWidget {
  const HiveDataScreen({super.key});

  @override
  State<HiveDataScreen> createState() => _HiveDataScreenState();
}

class _HiveDataScreenState extends State<HiveDataScreen> {
  final Box<HiveDataModel> hiveBox = Hive.box<HiveDataModel>('hiveBox');

  void _showDialog({HiveDataModel? data, int? index}) {
    final TextEditingController nameController = TextEditingController(text: data?.name ?? "");
    final TextEditingController priceController = TextEditingController(text: data?.price.toString() ?? "");
    final TextEditingController centsController = TextEditingController(text: data?.cents.toString() ?? "");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(data == null ? 'Add Data' : 'Edit Data',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(hintText: "Enter name"),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Enter price"),
              ),
              TextField(
                controller: centsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: "Enter cents"),
              ),
            ],
          ),
          actions: [
            Button(
                height: 40.h,width: 100.w,
                title: 'Cancel', onTap: () => Navigator.pop(context), isLoading: false, color: Colors.teal),

            Button(
              height: 40.h,
                width: 100.w,
                title: 'Save',
                onTap: (){
              if (nameController.text.isNotEmpty &&
                  priceController.text.isNotEmpty &&
                  centsController.text.isNotEmpty) {
                final newData = HiveDataModel(
                  name: nameController.text,
                  price: int.tryParse(priceController.text) ?? 0,
                  cents: int.tryParse(centsController.text) ?? 0,
                );

                if (data == null) {
                  hiveBox.add(newData);
                } else {
                  hiveBox.putAt(index!, newData);
                }

                Navigator.pop(context);
                setState(() {});
              }
            },
                isLoading: false,
                color: Colors.teal
            ),
          ],
        );
      },
    );
  }


  void _deleteItem(int index) {
    hiveBox.deleteAt(index);
    setState(() {});
  }

  double _calculateTotalCost() {
    double total = 0.0;
    for (var i = 0; i < hiveBox.length; i++) {
      HiveDataModel data = hiveBox.getAt(i)!;
      total += data.price + (data.cents / 100);
    }
    return total;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            'Hive Data',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600, fontSize: 18.sp),
          )),
      body: ValueListenableBuilder(
        valueListenable: hiveBox.listenable(),
        builder: (context, Box<HiveDataModel> box, _) {
          if (box.isEmpty) {
            return const Center(child: Text("No Data Found"));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Total Cost: \$${_calculateTotalCost().toStringAsFixed(2)}",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.teal,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    HiveDataModel data = box.getAt(index)!;
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name,style: GoogleFonts.poppins(
                            fontSize: 16.sp,fontWeight: FontWeight.w600,
                          ),),
                          Text("\$${data.price}.${data.cents.toString().padLeft(2, '0')}",
                            style: GoogleFonts.lato(
                              fontSize: 14.sp,fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _showDialog(data: data, index: index),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteItem(index),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () => _showDialog(),
        child: const Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
