import 'package:crud_testing/constant/colors.dart';
import 'package:crud_testing/resources/build_function.dart';
import 'package:crud_testing/resources/style.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.title,
    required this.body,
    required this.id,
  });
  final String? title;
  final String body;
  final String id;

  @override
  Widget build(BuildContext context) {
    BuildFunction buildFunction = BuildFunction();
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              color: const Color.fromARGB(255, 170, 170, 170),
              child: const Center(
                  child: Icon(
                Icons.image,
                size: 100,
                color: Color.fromARGB(255, 90, 90, 90),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          capitalizeAllWord(title.toString()),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      PopupMenuButton(
                        color: pPrimaryColor,
                        itemBuilder: (ctx) => [
                          PopupMenuItem(
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            onTap: () {
                              Future.delayed(const Duration(seconds: 0), () {
                                buildFunction.myDialog(context);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                      child: Text(
                    capitalizeAllWord(body),
                    style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 122, 122, 122)),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
