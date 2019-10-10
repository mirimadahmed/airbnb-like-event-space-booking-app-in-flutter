import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HeaderSection extends StatelessWidget {
  final List<String> imageList;
  HeaderSection({@required this.imageList});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        autoplay: imageList.length > 1 ? true : false,
        loop: imageList.length > 1 ? true : false,
        itemBuilder: (context, index){
          return new Image.network(imageList[index],fit: BoxFit.fill,);
        },
        itemCount: imageList.length,
        pagination: new SwiperPagination(),
      ),
    );
  }
}

