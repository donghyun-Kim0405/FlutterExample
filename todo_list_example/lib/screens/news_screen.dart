import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_example/providers/news_api.dart';

import '../models/news.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsApi newsApi = NewsApi();
  List<News> news = [];
  bool isLoading = true;

  Future initNews() async{
    news = await newsApi.getNews();
  }

  @override
  void initState() {
    super.initState();
    initNews().then((_){
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('뉴스 화면'),
      ),
      body: isLoading
          ? Center(child: const CircularProgressIndicator(),)
          : GridNewsView(news: news)

    );
  }
}


class GridNewsView extends StatelessWidget {
  late List<News> news;
  GridNewsView({required this.news});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2/3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      itemCount: news.length,
      itemBuilder: (context, index){
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                news[index].title,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                news[index].description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        );
      },
    );
  }
}
