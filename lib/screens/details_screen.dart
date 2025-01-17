import 'package:flixkh/constants/constant.dart';
import 'package:flixkh/constants/style_color.dart';
import 'package:flixkh/constants/style_font.dart';
import 'package:flixkh/models/movie.dart';
import 'package:flixkh/widgets/back_button.dart';
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
            leading: const BackBtn(),
            backgroundColor: StyleColor.scaffoldBgColor,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title.toString(),
                  style: StyleFonts.kantumruyPro(fontSize: 17, bold: true)),
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                child: Image.network(
                  "${Constants.imagePath}${movie.posterPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text("ទិដ្ឋភាពទូទៅនៃរឿង",
                      style: StyleFonts.kantumruyPro(fontSize: 30, bold: true)),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    movie.overview.toString(),
                    style: StyleFonts.kantumruyPro(fontSize: 25),
                    // textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Text(
                              "ចេញផ្សាយ: ",
                              style: StyleFonts.kantumruyPro(
                                  fontSize: 14, bold: true),
                            ),
                            Text(
                              movie.releaseDate.toString(),
                              style: StyleFonts.kantumruyPro(
                                  fontSize: 14, bold: true),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Text(
                              "ការវាយតម្លៃ: ",
                              style: StyleFonts.kantumruyPro(
                                  fontSize: 14, bold: true),
                            ),
                            const Icon(
                              Icons.star,
                              color: StyleColor.ratingColor,
                              size: 14,
                            ),
                            Text(
                              "${movie.voteAverage?.toStringAsFixed(1)}/10",
                              style: StyleFonts.kantumruyPro(
                                  fontSize: 14, bold: true),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
