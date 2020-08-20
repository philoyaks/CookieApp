import 'package:cookiesapp/main.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  final String heroTag;
  final String named;
  final String price;

  InfoPage({this.heroTag, this.named, this.price});

  // InfoPage({Key key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Pickup"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: null,
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  widget.named,
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                        tag: widget.heroTag,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              widget.heroTag,
                              width: double.infinity,
                              height: 400,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.price,
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ut arcu sodales, ultricies ante id, viverra ante. Maecenas porttitor et urna sed iaculis. Praesent gravida volutpat augue eu congue. Proin ut diam id nulla vestibulum venenatis vitae a mi. Integer finibus dolor sit amet lectus aliquam pulvinar',
                      style:
                          TextStyle(fontWeight: FontWeight.w200, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Center(child: Text('Add to cart')),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomapp(context),
    );
  }
}
