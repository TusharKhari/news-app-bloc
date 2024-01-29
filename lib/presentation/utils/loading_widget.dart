import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(
          5,
          (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    Shimmer.fromColors(
                        baseColor: Colors.grey[350]!,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                            baseColor: Colors.grey[350]!,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 15,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Shimmer.fromColors(
                            baseColor: Colors.grey[350]!,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 10,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Shimmer.fromColors(
                            baseColor: Colors.grey[350]!,
                            highlightColor: Colors.white,
                            child: Container(
                              height: 5,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                            )),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}
