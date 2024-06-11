import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertree/features/daily_news/persentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:fluttertree/features/daily_news/persentation/bloc/article/remote/remote_article_state.dart';
import 'package:fluttertree/features/daily_news/persentation/widgets/article_tile.dart';

class DailyNewsView extends StatelessWidget {
  const DailyNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar buildAppBar() {
      return AppBar(
        title: const Text(
          'Daily News',
          style: TextStyle(color: Colors.black),
        ),
      );
    }

    buildBody() {
      return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
          builder: (_, snap) {
        if (snap is RemoteArticleLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (snap is RemoteArticleException) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.refresh),
                Text('${snap.exception?.message}')
              ],
            ),
          );
        } else if (snap is RemoteArticleLoaded) {
          return ListView.builder(
              itemCount: snap.articles.length,
              itemBuilder: (context, index) {
                return ArticleWidget(snap.articles[index]);
              });
        }
        return const SizedBox();
      });
    }

    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }
}
