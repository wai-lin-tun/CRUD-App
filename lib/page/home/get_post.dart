import 'package:crud_testing/constant/colors.dart';
import 'package:crud_testing/providre/provider.dart';
import 'package:crud_testing/resources/build_function.dart';
import 'package:crud_testing/widgets/floatingaction_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BuildFunction buildFunction = BuildFunction();
  @override
  Widget build(BuildContext context) {
    var isCreate = Provider.of<PostProvider>(context, listen: false).futurePost;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: pPrimaryColor,
        centerTitle: true,
        title: const Text(
          "Your Post",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: (isCreate == null)
          ? const SizedBox(
              child: Center(
                child: Text(
                  "Create your post",
                  style: TextStyle(
                      color: Color.fromARGB(255, 137, 137, 137),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          : buildFunction.buildFutureBuilder(context),
      floatingActionButton: const CreateActionButton(),
    );
  }
}
