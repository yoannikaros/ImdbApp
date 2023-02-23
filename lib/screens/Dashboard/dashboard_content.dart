import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:films/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../Detail/MovieDetail.dart';

class DashboardContent extends StatelessWidget {
  final String image;
  final String url;
  final String title;
  const DashboardContent(
      {Key? key, required this.image, required this.url, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetail(id: url),
          ),
        );
      },
      child: Container(
        width: 122,
        height: 219,
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: whiteColor),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              title,
              style: whiteTextStyle.copyWith(fontSize: 10, fontWeight: bold),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                final String url = YoutubeUrl + title;
                launch(url);
              },
              child: Container(
                width: 82,
                height: 19,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: secondary, borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Text(
                      'Watch Trailer',
                      style: blackTextStyle.copyWith(
                          fontSize: 7, fontWeight: bold),
                    ),
                    Spacer(),
                    Image.asset(
                      'assets/next.png',
                      height: 5,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
