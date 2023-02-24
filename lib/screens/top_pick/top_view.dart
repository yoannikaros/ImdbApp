import 'package:films/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:films/utils/imgae.dart';
import '../Dashboard/dashboard_content.dart';
import '../Widget/navbar.dart';

class TopPickPage extends StatefulWidget {
  const TopPickPage({Key? key}) : super(key: key);

  @override
  State<TopPickPage> createState() => _TopPickPageState();
}

class _TopPickPageState extends State<TopPickPage> {
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
                'Top Pick',
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DashboardContent(
                image: '${listImage[0]}',
                title: 'Project Power',
                url: 'tt7550000',
                widthContent: 112,
              ),
              // TUTUP WIDGET
              SizedBox(
                width: 9,
              ),
              // WIDGED CONTENT
              DashboardContent(
                  image: '${listImage[1]}',
                  title: 'My Spy',
                  url: 'tt8242084',
                  widthContent: 112),
              // TUTUP WIDGET

              SizedBox(
                width: 9,
              ),

              // WIDGED CONTENT
              DashboardContent(
                  image: '${listImage[2]}',
                  title: 'Birds of Prey',
                  url: 'tt7713068',
                  widthContent: 110),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DashboardContent(
                  image: '${listImage[3]}',
                  title: 'Spenser C',
                  url: 'tt8629748',
                  widthContent: 110),
              const SizedBox(
                width: 10,
              ),
              DashboardContent(
                  image: '${listImage[4]}',
                  title: 'Extraction',
                  url: 'tt8936646',
                  widthContent: 110),
              const SizedBox(
                width: 10,
              ),
              DashboardContent(
                  image: '${listImage[5]}',
                  title: 'All the Bright',
                  url: 'tt3907584',
                  widthContent: 110),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              DashboardContent(
                  image: '${listImage[6]}',
                  title: 'As bestas',
                  url: 'tt15006566',
                  widthContent: 110),
              const SizedBox(
                width: 10,
              ),
              DashboardContent(
                  image: '${listImage[7]}',
                  title: 'Tenet',
                  url: 'tt6723592',
                  widthContent: 110),
              const SizedBox(
                width: 10,
              ),
              DashboardContent(
                  image: '${listImage[8]}',
                  title: 'Milea: Suara dari Dilan',
                  url: 'tt11127878',
                  widthContent: 110),
            ],
          ),
        )
      ],
    );
  }
}
