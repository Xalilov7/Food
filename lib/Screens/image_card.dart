import 'package:flutter/material.dart';

import '../constants.dart';
import '../demoData.dart';


class ImageCards extends StatefulWidget {
  const ImageCards({Key? key}) : super(key: key);


  @override
  _ImageCardsState createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 1.81,
      child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            PageView.builder(
                itemCount: demoBigImages.length,
                onPageChanged: (value){
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemBuilder:

                    (context, index) =>
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Image.asset(demoBigImages[index]))
            ),
            Positioned(
              bottom: defualtPadding,
              right: defualtPadding,
              child: Row(
                children:  List.generate(
                    demoBigImages.length,
                        (index) => Padding(padding: EdgeInsets.only(left: defualtPadding / 4),
                      child: IndicatorDot(isActive: index == _currentPage,),
                    )
                ),
              ),

            )
          ]
      ),
    );
  }
}


class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    Key? key, required this.isActive}) : super(key: key);
  final bool isActive ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ?  Colors.red : Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(12))
      ),
    );
  }
}