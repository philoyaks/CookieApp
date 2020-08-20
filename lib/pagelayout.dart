import 'package:cookiesapp/infopage.dart';
import 'package:flutter/material.dart';

class PageLaout extends StatefulWidget {
  final List images;
  final List title;
  final List price;

  PageLaout({this.images, this.title, this.price});

  @override
  _PageLaoutState createState() => _PageLaoutState();
}

class _PageLaoutState extends State<PageLaout> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 10,
      padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
      crossAxisCount: 2,
      children: <Widget>[
        boxes(context, widget.images[0], widget.title[0], widget.price[0]),
        boxes(context, widget.images[1], widget.title[1], widget.price[1]),
        boxes(context, widget.images[2], widget.title[2], widget.price[2]),
        boxes(context, widget.images[3], widget.title[3], widget.price[3]),
      ],
    );
  }
}

Widget boxes(
    BuildContext context, String imagePath, String name, String price) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) =>
                InfoPage(heroTag: imagePath, named: name, price: price)),
      );
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 0, top: 10, right: 10),
      child: Container(
        padding: EdgeInsets.only(top: 10),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment,
          crossAxisAlignment: CrossAxisAlignment.end,

          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.favorite_border)),
            Align(
              alignment: Alignment.center,
              child: Container(
                  height: 50,
                  width: 150,
                  child: Hero(
                    tag: imagePath,
                    child: Image.asset(imagePath),
                  )),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  price,
                  style: TextStyle(color: Colors.orange),
                )),
            Align(
              alignment: Alignment.center,
              child: Text(name),
            ),
            Divider(),
            Align(
                alignment: Alignment.center,
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 30,
                    ),
                    Icon(Icons.shopping_cart),
                    Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.orange),
                    )
                  ],
                )),
          ],
        ),
      ),
    ),
  );
}
