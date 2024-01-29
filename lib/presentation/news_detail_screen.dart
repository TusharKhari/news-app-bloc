// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:news_app/domain/models/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final Article article;
  const NewsDetailScreen({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.source.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                  "Published at : ${article.publishedAt.toIso8601String().substring(0, 10)}"),
              const SizedBox(
                height: 10,
              ),
              Image.network(
                article.urlToImage ?? "",
                errorBuilder: (context, error, stackTrace) =>
                    const Text("Image not available"),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Title :\n ${article.title}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Text(article.description ?? "N/A"),
              Text(
                "Description :\n ${article.description ?? "N/A"}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Content :\n ${article.content ?? "N/A"}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
