import 'package:chew_one/model/NewsModel.dart';
import 'package:chew_one/widgets/card.dart';
import 'package:chew_one/widgets/sec_card.dart';
import 'package:flutter/material.dart';

class DetailsBody extends StatelessWidget {
  final Article article;
  const DetailsBody({required this.article});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ClipRRect(
            child: Image.network(
              article.urlToImage,
              height: size.height * 0.65,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: size.height * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 180,
                      left: 8,
                    ),
                    child: Text(
                      "",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      left: 8,
                      right: 8,
                    ),
                    child: Text(
                      article.title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: size.height * 0.5,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    top: 16,
                    right: 8.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CardO(),
                      SecCard(
                        icon: Icons.watch,
                        text: "2 min",
                        width: 80,
                      ),
                      SecCard(
                        icon: Icons.remove_red_eye,
                        text: "234 views",
                        width: 100,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 8.0,
                      top: 8.0,
                      bottom: 12,
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        article.content,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


//  '''In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.
//                         publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available'''