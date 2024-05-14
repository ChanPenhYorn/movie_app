import 'package:flutflix/constants/constant.dart';
import 'package:flutter/material.dart';

class MovieSlide extends StatelessWidget {
  const MovieSlide({
    super.key,
    required this.snapshot,
    required this.length,
  });

  final AsyncSnapshot snapshot;
  final int length;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 150,
                  height: 200,
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      '${Constants.imagePath}${snapshot.data[index].posterPath}'),
                ),
              ),
            );
          }),
    );
  }
}
