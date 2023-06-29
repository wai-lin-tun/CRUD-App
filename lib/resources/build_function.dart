import 'package:crud_testing/constant/colors.dart';
import 'package:crud_testing/extensions/context_extensions.dart';
import 'package:crud_testing/model/post_model.dart';
import 'package:crud_testing/page/home/home_body.dart';
import 'package:crud_testing/providre/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class BuildFunction {
  FutureBuilder<PostModel> buildFutureBuilder(context) {
    return FutureBuilder<PostModel>(
      future: Provider.of<PostProvider>(context).futurePost,
      builder: (BuildContext context, AsyncSnapshot<PostModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data!.title == null
              ? const SizedBox(
                  child: Center(
                    child: Text(
                      "Deleted your post",
                      style: TextStyle(
                          color: Color.fromARGB(255, 137, 137, 137),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : HomeBody(
                  id: snapshot.data!.id.toString(),
                  title: snapshot.data!.title.toString(),
                  body: snapshot.data!.body.toString(),
                );
        }
        return const Center(
            child: SpinKitPouringHourGlassRefined(
          color: Colors.grey,
          size: 50.0,
        ));
      },
    );
  }

  myDialog(context) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Delete your post'),
        content: const Text('Are you sure you want to delete your post.!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Cancel', style: TextStyle(color: pPrimaryColor)),
          ),
          TextButton(
            onPressed: () {
              Provider.of<PostProvider>(context, listen: false)
                  .postDelete(context, 1.toString());
              context.pop();
              mySnackBar(context, "Success, deleting post", "Ok");
            },
            child: const Text(
              'Ok',
              style: TextStyle(color: pPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }

  mySnackBar(context, String content, String label) {
    final snackBar = SnackBar(
      backgroundColor: const Color.fromARGB(255, 226, 212, 242),
      content: Text(
        content,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
