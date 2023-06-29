import 'package:crud_testing/constant/colors.dart';
import 'package:crud_testing/extensions/context_extensions.dart';
import 'package:crud_testing/model/post_model.dart';
import 'package:crud_testing/page/home/create_post.dart';
import 'package:crud_testing/page/home/update_post.dart';
import 'package:crud_testing/providre/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateActionButton extends StatelessWidget {
  const CreateActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PostModel>(
      future: Provider.of<PostProvider>(context).futurePost,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return FloatingActionButton(
            onPressed: () {
              context.pushReplacement(snapshot.data!.title == null
                  ? const CreatePost()
                  : const EditPost());
            },
            backgroundColor: pPrimaryColor,
            child: snapshot.data!.title == null
                ? const Icon(
                    Icons.add,
                    size: 30,
                  )
                : const Icon(
                    Icons.edit,
                    size: 30,
                  ),
          );
        }
        return FloatingActionButton(
          onPressed: () {
            context.pushReplacement(const CreatePost());
          },
          backgroundColor: pPrimaryColor,
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        );
      },
    );
  }
}
