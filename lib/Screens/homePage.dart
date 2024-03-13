import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:move_app/Services/apiServices.dart';
import 'package:move_app/models/moveModel.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.deepPurpleAccent,
                  ),
                  Spacer(),
                  Text(
                    'MovieExpress',
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            FutureBuilder(
                future: ApiService().getpopularMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  List<moveModel> movies = snapshot.data!;
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: size.height * 0.20,
                      autoPlay: true,
                    ),
                    items: movies.map((moveModel) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          moveModel.backdropPath))),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 5,
                                    left: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        bottom: 5,
                                      ),
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Text(
                                            moveModel.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                })
          ],
        ),
      ),
    );
  }
}
