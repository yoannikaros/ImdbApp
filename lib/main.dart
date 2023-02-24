import 'package:films/screens/Dashboard/dashboard_view.dart';
import 'package:films/screens/List/MovieList.dart';
import 'package:films/screens/top_pick/top_view.dart';
import 'package:films/screens/wishlist/wislish_view.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => DashboardPage(),
        '/search': (context) => MovieList(),
        '/top': (context) => TopPickPage(),
        '/wish': (context) => WishlistPage(),
      },
    );
  }
}
