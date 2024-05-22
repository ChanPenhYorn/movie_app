import 'package:flutflix/constants/style_color.dart';
import 'package:flutflix/models/movie.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              height: 70,
              width: 70,
              decoration:
                  const BoxDecoration(color: StyleColor.ScaffoldBgColor),
            ),
          )
        ],
      ),
    );
  }
}
