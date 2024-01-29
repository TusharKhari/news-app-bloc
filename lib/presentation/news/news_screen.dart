import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/application/news_bloc.dart';
import 'package:news_app/presentation/auth/sign_up_screen.dart';
import 'package:news_app/presentation/utils/info_toast.dart';
import 'package:news_app/presentation/news/news_detail_screen.dart';
import 'package:news_app/presentation/utils/loading_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsBloc newsBloc = NewsBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsBloc.add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsBloc, NewsState>(
      bloc: newsBloc,
      listener: (context, state) {
        if (state is NewsErrorState) {
          InfoToast.errorToast(context, state.errors.toString());
        }
        if (state is NewsSuccessState) {
          InfoToast.successToast(context, "Fetched Successfully");
        }
      },
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return const Scaffold(
            body: AppLoadingWidget(),
            //Center(child: CircularProgressIndicator()),
          );
        }
        if (state is NewsErrorState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Assignment"),
              actions: [
                IconButton(
                  onPressed: () {
                    newsBloc.add(GetNewsEvent());
                  },
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
              ],
            ),
            body: const Center(
              child: Text("Please try again later"),
            ),
          );
        }
        if (state is NewsSuccessState) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Assignment"),
              actions: [
                IconButton(
                  onPressed: () {
                    newsBloc.add(GetNewsEvent());
                  },
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ));
                  },
                  icon: const Icon(
                    Icons.logout,
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    // itemCount: 1,
                    itemCount: state.articles.length,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var article = state.articles[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  NewsDetailScreen(article: article),
                            ));
                          },
                          child: ListTile(
                            title: Text(article.title),
                            leading: CircleAvatar(
                              child: Image.network(
                                article.urlToImage ?? "",
                                errorBuilder: (context, error, stackTrace) =>
                                    const Text("N/A"),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const Scaffold();
      },
    );
  }
}
