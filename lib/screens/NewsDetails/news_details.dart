import 'package:chew_one/model/NewsModel.dart';
import 'package:chew_one/screens/NewsDetails/details_body.dart';
import 'package:chew_one/widgets/top_button.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final Article article;
  const NewsDetails({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: TopButton(
          callBack: () {
            Navigator.pop(context);
          },
          iconData: Icons.arrow_back_ios,
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
              ),
              child: TopButton(
                callBack: () {
                  print("Favo");
                },
                iconData: Icons.file_upload_outlined,
              )),
        ],
      ),
      body: DetailsBody(
        article: article,
      ),
    );
  }
}
