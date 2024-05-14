import 'package:flutflix/constants/style_font.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset(
            "assets/flutflix.png",
            fit: BoxFit.cover,
            height: 40,
            filterQuality: FilterQuality.high,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text("Trending Movies",
                  style: StyleFonts.kantumruyPro(
                    fontSize: 25,
                  )),
              SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 200,
                      height: 300,
                      color: Colors.amber,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
