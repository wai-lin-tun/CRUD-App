import 'package:crud_testing/constant/colors.dart';
import 'package:crud_testing/extensions/context_extensions.dart';
import 'package:crud_testing/page/home/get_post.dart';
import 'package:crud_testing/providre/provider.dart';
import 'package:crud_testing/resources/build_function.dart';
import 'package:crud_testing/resources/style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreateNoteState();
}

final _formKey = GlobalKey<FormState>();

class _CreateNoteState extends State<CreatePost> {
 BuildFunction buildFunction = BuildFunction();
  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (isValid == true) {
      Provider.of<PostProvider>(context, listen: false).postCreate();
      context.pushReplacement(const HomePage());
buildFunction.mySnackBar(context, "Success, Creating post", "Ok");
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: const Text("Create Note"),
        backgroundColor: pPrimaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () {
                _saveForm();
              },
              child: Container(
                height: 10,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Save",
                      style: TextStyle(
                          color: pPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.check,
                      color: pPrimaryColor,
                      size: 25,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Consumer<PostProvider>(
          builder: (context, value, child) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: noteTitleStyle(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: value.titleController,
                      cursorColor: pPrimaryColor,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Title is empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Title",
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Body",
                      style: noteTitleStyle(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLines: 20,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Body is empty';
                        }
                        return null;
                      },
                      controller: value.bodyController,
                      cursorColor: pPrimaryColor,
                      decoration: const InputDecoration(
                        hintText: "body",
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
