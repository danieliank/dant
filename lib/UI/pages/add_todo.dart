import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dant/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference task = firestore.collection('task');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF222831),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Color(0xFFFFD369)),
          onPressed: () => Get.toNamed(RouteName.home),
        ),
        title: Text(
          "Add Task",
          style: GoogleFonts.poppins(
            color: const Color(0xFFFFD369),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Enter Title",
                labelStyle: GoogleFonts.poppins(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _descController,
              decoration: InputDecoration(
                labelText: "Enter Description",
                labelStyle: GoogleFonts.poppins(),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xFFFFD369),
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () async {
                  task.add({
                    'title': _titleController.text,
                    'desc': _descController.text,
                  });
                  _titleController.text = '';
                  _descController.text = '';
                  Get.toNamed(RouteName.home);
                },
                child: Text(
                  "Add New Task",
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF222831),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
