import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Color.fromARGB(255, 237, 231, 249),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'MovieExpress',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 18,
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
                                  Positioned(
                                    top: 8,
                                    right: 8,
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
                                                  Color.fromARGB(255, 0, 0, 0)
                                                      .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Row(
                                            children: [
                                              Text(
                                                moveModel.voteAverage
                                                    .toString()
                                                    .substring(0, 3),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255)),
                                              ),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 12,
                                              )
                                            ],
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
                }),
            SizedBox(
              height: 22,
            ),
            Text(
              'Now Playing',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      width: 240,
                      height: 120,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 231, 222, 249)
                              .withOpacity(0.7),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                                'https://image.tmdb.org/t/p/w500/hu40Uxp9WtpL34jv3zyWLb5zEVY.jpg'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
