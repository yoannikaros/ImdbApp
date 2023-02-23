import 'package:films/screens/Widget/navbar.dart';
import 'package:films/utils/theme.dart';
import 'package:flutter/material.dart';
import 'MovieDetailViewModel.dart';
import 'package:films/model/MovieDetailModel.dart';
import 'package:films/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetail extends StatefulWidget {
  MovieDetail({required this.id});

  final String id;

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late MovieApi _api;
  late Future<Movie> _futureMovie;

  @override
  void initState() {
    super.initState();
    _api = MovieApi();
    _futureMovie = _api.fetchMovie(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: FutureBuilder<Movie>(
        future: _futureMovie,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final movie = snapshot.data!;

            return ListView(
              children: [
                Column(
                  children: [
                    Navbar(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 25,
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                                child: Image.asset('assets/back.png'),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            child: Container(
                              width: 25,
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                                child: Image.asset('assets/menu.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 325,
                              height: 580,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(12)),
                            ),

                            //BACKGROUND
                            Container(
                              width: 325,
                              height: 280,
                              decoration: BoxDecoration(
                                color: background,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                ),
                              ),
                              child: ShaderMask(
                                shaderCallback: (bounds) => LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black,
                                    Color.fromARGB(0, 0, 0, 0)
                                  ],
                                ).createShader(bounds),
                                blendMode: BlendMode.dstIn,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      topLeft: Radius.circular(12)),
                                  child: Image.network(
                                    movie.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            //IMAGE LAYER
                            Container(
                              margin: EdgeInsets.only(left: 19, top: 20),
                              width: 144,
                              height: 215,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(3),
                                  topRight: Radius.circular(3),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(movie.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                width: 5,
                                child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      Colors.white, BlendMode.srcIn),
                                  child: GestureDetector(
                                    onTap: () {
                                      final String url =
                                          YoutubeUrl + movie.title;
                                      launch(url);
                                    },
                                    child: Image.asset(
                                      'assets/play.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            //Detail Movie
                            Container(
                              margin: EdgeInsets.only(left: 170, top: 23),
                              child: Column(
                                children: [
                                  // Text(
                                  //   movie.title,
                                  //   style: whiteTextStyle.copyWith(
                                  //       fontSize: 10, fontWeight: bold),
                                  // ),
                                  // Text(
                                  //   'Genre: ${movie.genre.join(', ')}',
                                  //   style: whiteTextStyle.copyWith(
                                  //       fontSize: 10, fontWeight: bold),
                                  // ),
                                  // Text(
                                  //   'actors: ${movie.actors.join(', ')}',
                                  //   style: whiteTextStyle.copyWith(
                                  //       fontSize: 10, fontWeight: bold),
                                  // )
                                ],
                              ),
                            ),

                            //PLOT
                            Container(
                                width: 325,
                                padding: EdgeInsets.all(12),
                                margin: EdgeInsets.only(top: 300),
                                child: Text(
                                  movie.plot,
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 12, fontWeight: regular),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
      endDrawer: Sidebar(),
    );
  }

  Widget Sidebar() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}


// 'Genre: ${movie.genre.join(', ')}'
