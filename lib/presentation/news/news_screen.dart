import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/repo/auth_repo.dart';
import 'package:news_app/presentation/auth/login_screen.dart';
import 'package:news_app/presentation/auth/sign_up_screen.dart';
import 'package:news_app/presentation/utils/info_toast.dart';
import 'package:news_app/presentation/news/news_detail_screen.dart';
import 'package:news_app/presentation/utils/loading_widget.dart';

import '../../application/auth_bloc/auth_bloc.dart';
import '../../application/news bloc/news_bloc.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsBloc newsBloc = NewsBloc();
  AuthRepo authRepo = AuthRepo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsBloc.add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    User? _user = authRepo.getCurrentUser();
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
                    authBloc.add(LogOutEvent());
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
                Text(
                  _user?.email ?? "",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
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
