import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:movies_app/service/movie_service.dart';

class ListMovies extends StatefulWidget {
  const ListMovies({super.key});

  @override
  State<ListMovies> createState() => _ListMoviesState();
}

class _ListMoviesState extends State<ListMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                SvgPicture.asset(
                'assets/logo.svg',
                    semanticsLabel: 'Be Connect Logo',
                ),
                Positioned(
                  left: 8.5,
                  top: 8.5,
                  child: Image.asset(
                    'assets/beeconnect.png',
                    width: 19.65,
                    height: 22.4,
                  ),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
      body: FutureBuilder(
        future: getMovies(),
        builder: (context, AsyncSnapshot<List<Movies>> snapshot) {
          return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromRGBO(44, 44, 44, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Image.network(
                            snapshot.data![index].image.toString(),
                            width: 100,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      snapshot.data![index].name.toString(),
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    snapshot.data![index].release_year.toString(),
                                    style: const TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  const Icon(
                                    Icons.access_time,
                                    color: Colors.white
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    snapshot.data![index].duration.toString(),
                                    style: const TextStyle(
                                      color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    int.parse(snapshot.data![index].stars),
                                    (index) => const Icon(Icons.star, color: Colors.yellow),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            );
        },
      )
    );
  }
}