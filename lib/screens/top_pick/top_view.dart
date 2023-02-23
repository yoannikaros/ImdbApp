import 'package:films/utils/theme.dart';
import 'package:flutter/material.dart';

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
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Navbar(),
            SizedBox(
              height: 20,
            ),
            header(),
            SizedBox(
              height: 20,
            ),
            content()
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Row(
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
      ],
    );
  }

  Widget content() {
    return Column(
      children: [
        Row(
          children: [
            DashboardContent(
              image: 'assets/ant.jpg',
              title: 'Ant-Man',
              url: 'tt10954600',
            ),
            const SizedBox(
              width: 10,
            ),
            DashboardContent(
              image: 'assets/ant.jpg',
              title: 'Ant-Man',
              url: 'tt10954600',
            ),
          ],
        )
      ],
    );
  }
}
