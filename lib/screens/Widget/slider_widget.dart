import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/theme.dart';
import 'package:films/utils/constants.dart';
import '../Detail/MovieDetail.dart';

class SliderWidgetContent extends StatelessWidget {
  const SliderWidgetContent(
      {Key? key,
      required this.imageUrl,
      required this.tittleSlider,
      required this.youtubeTittle,
      required this.id})
      : super(key: key);

  final String imageUrl;
  final String tittleSlider;
  final String youtubeTittle;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 325,
          height: 195,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black, Color.fromARGB(0, 0, 0, 0)],
            ).createShader(bounds),
            blendMode: BlendMode.dstIn,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetail(id: id),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 18),
            width: 104,
            height: 155,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 136, left: 180),
          child: Text(
            "'${tittleSlider}'",
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 158, left: 180),
          child: Text(
            ' Watch the trailer',
            style: nuninoWhiteTextStyle.copyWith(
                fontSize: 12, fontWeight: regular),
          ),
        ),
        GestureDetector(
          onTap: () {
            final String url = YoutubeUrl + youtubeTittle;
            launch(url);
          },
          child: Container(
            width: 40,
            margin: EdgeInsets.only(top: 134, left: 130),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              child: Image.asset('assets/play.png'),
            ),
          ),
        )
      ],
    );
  }
}
