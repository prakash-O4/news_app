import 'package:chew_one/bloc/news_bloc.dart';
import 'package:chew_one/model/NewsModel.dart';
import 'package:chew_one/screens/NewsDetails/news_details.dart';
import 'package:chew_one/screens/news_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    //News will be fetched from the internet during the initial state of home screen.
    _loadNews();
  }

  void _loadNews() async {
    // print('event fired');
    //Bloc provider.of helps to fire the event in the NewsBloc context
    print("event fired");
    BlocProvider.of<NewsBloc>(context).add(FetchNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    List<Article> articles = <Article>[];
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter News App'),
        backgroundColor: Colors.redAccent,
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsInitial) {
            // print('initial state');
            return _loading();
          } else if (state is NewsError) {
            //this will fetch the message from exception class which is passed as a parameter
            //in the NewsError bloc
            String error = state.error.message;
            String finalMessage = '$error\nTap to retry';
            return _buildErrorUi(finalMessage, _loadNews);
          } else if (state is NewsLoaded) {
            print('loaded state');
            //when articles is loaded newsloaded state will be called and list of articles
            //will be extracted and stored in the list with the help of state
            articles = state.articles;
            return NewsBody(
              articles: articles,
            );
          }
          // } else if (state is NewsLoading) {
          //   // print('Loading called');
          // }
          return _loading();
        },
      ),
    );
  }

  Widget _loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorUi(String message, VoidCallback tap) {
    return GestureDetector(
      onTap: tap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
