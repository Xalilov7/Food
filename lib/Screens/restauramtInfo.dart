import 'package:flutter/material.dart';

import '../constants.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({Key? key, required this.title, required this.deliveryTime, required this.rating, required this.press, required this.image, required  this.location}) : super(key: key);
  final String title, image, location ;
  final int deliveryTime;
  final double rating;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: SizedBox(
          width: 200,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(aspectRatio: 1.25,
                child: Image.asset(image),
              ),
              SizedBox(height: defualtPadding / 5,),
              Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(location,
                maxLines: 1,
                style: TextStyle(color: kBodyTextColor),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defualtPadding / 2),
                child: DefaultTextStyle(
                  style: TextStyle(color: Colors.black, fontSize: 12),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: kActiveColor, borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: EdgeInsets.symmetric(
                            horizontal: defualtPadding / 2 ,
                            vertical:  defualtPadding / 8
                        ),
                        child: Text(rating.toString(), style: TextStyle(color: Colors.white),),
                      ),
                      Spacer(),
                      Text("$deliveryTime min"),
                      Spacer(),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: Color(0xFF868686),
                      ),
                      Spacer(),
                      Text("Free delivery"),
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
