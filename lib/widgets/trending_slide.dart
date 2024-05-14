import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutflix/constants/constant.dart';
import 'package:flutter/material.dart';

class TrendingSlide extends StatelessWidget {
  const TrendingSlide({
    super.key,
    required this.snapshot,
    required this.lenght,
  });

  final AsyncSnapshot snapshot;
  final int lenght;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: lenght,
        options: CarouselOptions(
            height: 300,
            autoPlay: true,
            viewportFraction: 0.55,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            enlargeCenterPage: true,
            pageSnapping: true),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 200,
              height: 300,
              child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}'),
            ),
          );
        },
      ),
    );
  }
}
