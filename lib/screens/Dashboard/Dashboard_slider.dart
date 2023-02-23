import 'package:films/screens/Widget/slider_widget.dart';
import 'package:films/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselSliderWidget();
  }
}

class _CarouselSliderWidget extends State<SliderWidget> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<Widget> MyData = [
    SliderWidgetContent(
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BMDIzM2FlNTctNjAzZi00YzhkLThjYWQtMDY5Njc0NjdmMGVlXkEyXkFqcGdeQXVyMTUzOTcyODA5._V1_.jpg',
      tittleSlider: 'Ant-Man',
      youtubeTittle: 'Ant-Man',
      id: 'tt10954600',
    ),
    SliderWidgetContent(
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BNjUzNzc3NjQ4OF5BMl5BanBnXkFtZTgwNzgyODI4NjM@._V1_.jpg',
      tittleSlider: 'Spider-Man',
      youtubeTittle: 'Spider-Man: Into the Spider-Verse',
      id: 'tt4633694',
    ),
    SliderWidgetContent(
      imageUrl:
          'https://m.media-amazon.com/images/M/MV5BMTcyMzAzNDE0Ml5BMl5BanBnXkFtZTcwNjA5NjI0Mg@@._V1_.jpg',
      tittleSlider: 'Fast & Furious',
      youtubeTittle: 'Fast & Furious',
      id: 'tt1013752',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CarouselSlider(
          items: MyData,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: MyData.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Color.fromARGB(255, 255, 255, 255))
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}
