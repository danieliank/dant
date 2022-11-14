import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dant/routes/route_names.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final CollectionReference task =
      FirebaseFirestore.instance.collection('task');

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _titleController.text = documentSnapshot['title'];
      _descController.text = documentSnapshot['desc'];
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _descController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFFD369)),
                  child: const Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () async {
                    final String title = _titleController.text;
                    final String desc = _descController.text;
                    if (desc != null) {
                      await task
                          .doc(documentSnapshot!.id)
                          .update({"title": title, "desc": desc});
                      _titleController.text = '';
                      _descController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(String productId) async {
    await task.doc(productId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF222831),
        leading: IconButton(
          icon: Icon(Icons.logout_rounded, color: Color(0xFFFFD369)),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
        ),
        title: Text(
          "Dant",
          style: GoogleFonts.poppins(
            color: Color(0xFFFFD369),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RouteName.about);
            },
            icon: const Icon(Icons.info_outline_rounded,
                color: Color(0xFFFFD369)),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: task.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['title']),
                    subtitle: Text(documentSnapshot['desc']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => _update(documentSnapshot),
                            icon: Icon(Icons.edit_note_rounded),
                          ),
                          IconButton(
                              icon: const Icon(Icons.delete_forever_rounded),
                              onPressed: () => _delete(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_task_rounded, color: Color(0xFFFFD369)),
          backgroundColor: Color(0xFF222831),
          onPressed: () {
            Get.toNamed(RouteName.addTodo);
          }),
    );
  }
}
