import 'package:chew_one/model/NewsModel.dart';
import 'package:chew_one/screens/NewsDetails/news_details.dart';
import 'package:flutter/material.dart';

class NewsBody extends StatefulWidget {
  final List<Article> articles;
  NewsBody({required this.articles});
  @override
  NewsBodyState createState() => NewsBodyState();
}

//blue print of the structure of the list/ news body
class NewsBodyState extends State<NewsBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[350],
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: widget.articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetails(
                          article: widget.articles[index],
                        ),
                      ),
                    );
                  },
                  child: _newsCard(
                    widget.articles[index].urlToImage,
                    widget.articles[index].title,
                    widget.articles[index].publishedAt,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _newsCard(String imageURL, String title, var publishedAt) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(11),
              child: Image.network(
                imageURL,
                fit: BoxFit.cover,
                height: 210,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                publishedAt,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
