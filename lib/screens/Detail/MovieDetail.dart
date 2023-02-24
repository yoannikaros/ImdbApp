import 'package:films/screens/Widget/navbar.dart';
import 'package:films/utils/theme.dart';
import 'package:flutter/material.dart';
import '../Dashboard/dashboard_content.dart';
import 'MovieDetailViewModel.dart';
import 'package:films/model/MovieDetailModel.dart';
import 'package:films/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:films/utils/imgae.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieDetail extends StatefulWidget {
  MovieDetail({required this.id, required this.imageA, required this.thisname});

  final String id;
  final String imageA;
  final String thisname;

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
            var thisname = movie.title;
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
                              height: 420,
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
                                borderRadius: const BorderRadius.only(
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
                                  Container(
                                    width: 148,
                                    child: Text(
                                      movie.title,
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 19, fontWeight: bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 148,
                                    child: Text(
                                      'Type: ${movie.contentType}',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 10, fontWeight: bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 148,
                                    child: Text(
                                      'Genre: ${movie.genre.join(', ')}',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 10, fontWeight: bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: 148,
                                    child: Text(
                                      'Actors: ${movie.actors.join(', ')}',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 10, fontWeight: bold),
                                    ),
                                  )
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
                                )),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    recomendation()
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
          const SizedBox(
            height: 40,
          ),
          ListTile(
            title: Text('Save'),
            onTap: () {
              String nama = widget.thisname;
              String gambar = widget.imageA;
              String urlWish = widget.id;
              saveData(nama, gambar, urlWish);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Data tersimpan ke wish list'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget recomendation() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 25,
                width: 2,
                color: secondary,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Recomendation",
                style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/top');
                },
                child: Image.asset(
                  "assets/next.png",
                  color: whiteColor,
                  width: 7,
                  height: 12,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                DashboardContent(
                    image: '${listImage[2]}',
                    title: 'Birds of Prey',
                    url: 'tt7713068',
                    widthContent: 122),
                const SizedBox(
                  width: 10,
                ),
                DashboardContent(
                    image: '${listImage[6]}',
                    title: 'As bestas',
                    url: 'tt15006566',
                    widthContent: 122),
                const SizedBox(
                  width: 10,
                ),
                DashboardContent(
                    image: '${listImage[4]}',
                    title: 'Extraction',
                    url: 'tt8936646',
                    widthContent: 122),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

void saveData(String nama, String gambar, String urlWish) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('nama', nama);
  await prefs.setString('gambar', gambar);
  await prefs.setString('url', urlWish);
  print(nama);
}
