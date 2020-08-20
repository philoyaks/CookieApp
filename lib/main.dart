import 'package:flutter/material.dart';
import 'package:cookiesapp/pagelayout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cokies',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Cookies'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List cakeCookie = [
    'images/peanutcookiecake.png',
    'images/halloweencookiecake.png',
    'images/oreocookie.png',
    'images/redvalvetcookie.png'
  ];
  List cookie = [
    'images/florentines.png',
    'images/chocholatcrinkles.png',
    'images/pecansandies.png',
    'images/snickerdoodles.png'
  ];

  List prices1 = ['N300', 'N1200', 'N1500', 'N400'];
  List prices2 = ['N300', 'N1200', 'N1500', 'N400'];
  List prices3 = ['N300', 'N1200', 'N1500', 'N400'];

  List caketitle = [
    'Peanut cookiecake',
    'Halloween cookie',
    'Oreo cookie',
    'Redvalvet cookie'
  ];
  List cookietitle = [
    'Florentines',
    'Chocholate Crinkles',
    'Pecansandies',
    'Snickerdoodles'
  ];

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white.withOpacity(3),

      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.access_alarm,
              color: Colors.orange,
            ),
            onPressed: null,
          ),
        ],
        title: Text(widget.title),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
        children: <Widget>[
          Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
          ),
          SizedBox(
            height: 10,
          ),
          DefaultTabController(
              length: 5,
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.red,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.blue,
                tabs: <Widget>[
                  _namedText('Cookie', Colors.orange),
                  _namedText('Cake Cookie', Colors.orange),
                  _namedText('Ice Cream', Colors.orange),
                ],
              )),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                PageLaout(
                  images: cookie,
                  price: prices1,
                  title: cookietitle,
                ),
                PageLaout(
                  images: cakeCookie,
                  price: prices2,
                  title: caketitle,
                ),
                PageLaout(
                  images: cookie,
                  price: prices3,
                  title: caketitle,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.orange,
        child: Icon(
          Icons.fastfood,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomapp(context),
    );
  }
}

Text _namedText(String name, Color color) {
  return Text(
    name,
    style: TextStyle(
      color: color,
      fontSize: 24,
    ),
  );
}

Widget bottomapp(BuildContext context) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    clipBehavior: Clip.antiAlias,
    elevation: 9,
    notchMargin: 9,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2 - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.home),
                Icon(Icons.portrait),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2 - 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.search),
                Icon(Icons.shopping_basket),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
