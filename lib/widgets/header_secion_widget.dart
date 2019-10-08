import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        autoplay: true,
        loop: true,
        itemBuilder: (context, index){
          return new Image.network("https://picsum.photos/250?image=9",fit: BoxFit.fill,);
        },
        itemCount: 5,
        pagination: new SwiperPagination(),
      ),
    );
  }
}
