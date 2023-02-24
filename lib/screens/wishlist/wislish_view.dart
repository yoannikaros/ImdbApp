import 'package:films/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Dashboard/dashboard_content.dart';
import '../Widget/navbar.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  String nama = '';
  String gambar = '';
  String urlWish = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('nama') ?? '';
      gambar = prefs.getString('gambar') ?? '';
      urlWish = prefs.getString('url') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Navbar(),
            const SizedBox(
              height: 30,
            ),
            header(),
            const SizedBox(
              height: 40,
            ),
            content()
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 25,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  child: Image.asset('assets/back.png'),
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Wishlist',
                textAlign: TextAlign.center,
                style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
            )
          ],
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              'TV shows and movies just for you',
              style: whiteTextStyle.copyWith(fontSize: 12, fontWeight: regular),
            ),
          ),
        ),
      ],
    );
  }

//
  Widget content() {
    return Column(
      children: [
        Row(
          children: [
            DashboardContent(
                image: gambar, title: nama, url: urlWish, widthContent: 110),
          ],
        ),
      ],
    );
  }
}
