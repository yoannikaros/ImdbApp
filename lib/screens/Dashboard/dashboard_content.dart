import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:films/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../../utils/theme.dart';
import '../Detail/MovieDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardContent extends StatefulWidget {
  final String image;
  final String url;
  final String title;
  final int widthContent;
  const DashboardContent(
      {Key? key,
      required this.image,
      required this.url,
      required this.title,
      required this.widthContent})
      : super(key: key);

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  bool _isImageVisible = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetail(
              id: widget.url,
              imageA: widget.image,
              thisname: widget.title,
            ),
          ),
        );
      },
      child: Container(
        width: widget.widthContent.toDouble(),
        height: 219,
        decoration: BoxDecoration(
            color: primary, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: whiteColor),
                ),
                GestureDetector(
                    onTap: () async {
                      String nama = widget.title;
                      String gambar = widget.image;
                      String urlWish = widget.url;
                      saveData(nama, gambar, urlWish);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Data tersimpan ke wish list'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      setState(() {
                        _isImageVisible = false;
                      });
                    },
                    child: _isImageVisible
                        ? Container(
                        margin: EdgeInsets.only(top: 5, left: 90),
                        width: 20,
                        child: Image.asset(
                          'assets/unwish-list.png',
                          alignment: Alignment.topRight,
                        ))
                : Container(),
                ),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              widget.title,
              style: whiteTextStyle.copyWith(fontSize: 10, fontWeight: bold),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                final String url = YoutubeUrl + widget.title;
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
            ),
          ],
        ),
      ),
    );
  }

  void saveData(String nama, String gambar, String urlWish) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nama', nama);
    await prefs.setString('gambar', gambar);
    await prefs.setString('url', urlWish);
    print(nama);
  }
}
