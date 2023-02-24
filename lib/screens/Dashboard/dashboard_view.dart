import 'package:films/screens/Dashboard/dashboard_content.dart';
import 'package:films/screens/Dashboard/Dashboard_slider.dart';
import 'package:films/screens/Widget/navbar.dart';
import 'package:films/screens/wishlist/wislish_view.dart';
import 'package:films/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:films/utils/imgae.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: ListView(
        children: [
          Navbar(),
          header(),
          const SizedBox(
            height: 23,
          ),
          SliderWidget(),
          toppick(),
          TopContent(),
          watch()
        ],
      ),
    );
  }

  Widget header() {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/search');
        },
        child: Container(
          margin: const EdgeInsets.only(top: 21),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 60),
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Search for movies',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                const Icon(Icons.search),
              ],
            ),
          ),
        ));
  }

  Widget toppick() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                "Top Picks",
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
            height: 10,
          ),
          Text(
            "TV shows and movies just for you",
            style: nuninoWhiteTextStyle.copyWith(
                fontSize: 12, fontWeight: regular),
          ),
        ],
      ),
    );
  }

  Widget TopContent() {
    return Container(
      margin: const EdgeInsets.only(left: 17, top: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // WIDGED CONTENT
            DashboardContent(
              image: '${listImage[0]}',
              title: 'Project Power',
              url: 'tt7550000',
              widthContent: 122,
            ),
            // TUTUP WIDGET
            SizedBox(
              width: 12,
            ),
            // WIDGED CONTENT
            DashboardContent(
                image: '${listImage[1]}',
                title: 'My Spy',
                url: 'tt8242084',
                widthContent: 122),
            // TUTUP WIDGET

            SizedBox(
              width: 12,
            ),

            // WIDGED CONTENT
            DashboardContent(
                image: '${listImage[2]}',
                title: 'Birds of Prey',
                url: 'tt7713068',
                widthContent: 122),

            SizedBox(
              width: 12,
            )
          ],
        ),
      ),
    );
  }

  Widget watch() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                "Watch list",
                style: whiteTextStyle.copyWith(fontSize: 20, fontWeight: bold),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/wish');
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
            height: 10,
          ),
        ],
      ),
    );
  }
}
