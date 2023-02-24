import 'package:films/screens/Widget/navbar.dart';
import 'package:films/screens/detail/MovieDetail.dart';
import 'package:films/utils/theme.dart';
import 'package:flutter/material.dart';
import 'MovieListViewModel.dart';
import 'package:films/model/MovieModel.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final _searchController = TextEditingController();
  final _viewModel = MovieViewModel();
  String _searchText = 'Cari';

  Future<List<Movie>>? _moviesFuture;

  void _searchMovies(String query) {
    setState(() {
      _searchText = query;
      _moviesFuture = _viewModel.fetchMovies(_searchText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      // Item
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Navbar(),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: SizedBox(
              width: 288,
              height: 35,
              child: TextField(
                style: TextStyle(fontSize: 12),
                controller: _searchController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: whiteColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  hintText: 'Search for movies',
                  suffixIcon: IconButton(
                    onPressed: () => _searchMovies(_searchController.text),
                    icon: Icon(Icons.search),
                  ),
                ),
                onSubmitted: (value) => _searchMovies(value),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12, left: 33),
            child: Row(
              children: [
                Text(
                  "Result for '${_searchController.text}'",
                  style: nuninoWhiteTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 25,
                    margin: EdgeInsets.only(right: 44),
                    child: ColorFiltered(
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      child: Image.asset('assets/back.png'),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Movie>>(
              future: _moviesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Container(
                    height: 40,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          'Back to home',
                          style: blackTextStyle.copyWith(
                              fontSize: 12, fontWeight: regular),
                        ),
                      ),
                    ),
                  ));
                } else {
                  final movies = snapshot.data!;
                  return ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MovieDetail(
                                id: movie.id,
                                imageA: movie.image,
                                thisname: movie.title,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Card(
                            color: Colors.black,
                            child: ListTile(
                              leading: Image.network(movie.image),
                              title: Text(
                                movie.title,
                                style: whiteTextStyle.copyWith(
                                    fontSize: 12, fontWeight: bold),
                              ),
                              subtitle: Text(
                                movie.year.toString(),
                                style: whiteTextStyle.copyWith(fontSize: 8),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
