import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedFood = 'BURGUER';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 400,
              ),
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/images/tokyo.jpg',
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'JAPAN',
                  style: TextStyle(
                    fontSize: 75,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.3),
                    letterSpacing: 10,
                  ),
                ),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(Icons.menu),
                  ),
                ),
              ),
              Positioned(
                top: 2,
                right: 5,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Color(0xFFFD3664),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 40,
                child: Column(
                  children: <Widget>[
                    Text(
                      'WELCOME TO',
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 235,
                left: 40,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'TOKYO',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFD3664),
                          ),
                        ),
                        Text(
                          ',',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'JAPAN',
                          style: TextStyle(
                            fontFamily: 'Oswald',
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 320,
                left: 25,
                right: 25,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF262626),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Lets explore some food here...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                      ),
                      contentPadding: EdgeInsets.only(top: 15),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('BURGUER', Icons.fastfood),
              _buildMenuItem('TEA', Icons.local_drink),
              _buildMenuItem('BEER', Icons.local_drink),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('CAKE', Icons.cake),
              _buildMenuItem('COFFEE', Icons.cloud),
              _buildMenuItem('MEAT', Icons.restaurant),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildMenuItem('ICE', Icons.insert_chart),
              _buildMenuItem('FISH', Icons.filter_tilt_shift),
              _buildMenuItem('DONUTS', Icons.donut_small),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String foodName, iconData) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        selectMenuOption(foodName);
      },
      child: AnimatedContainer(
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 300),
        height: selectedFood == foodName ? 100 : 75,
        width: selectedFood == foodName ? 100 : 75,
        color:
            selectedFood == foodName ? Color(0xFFFD3566) : Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              color: selectedFood == foodName ? Colors.white : Colors.grey,
              size: 25,
            ),
            SizedBox(height: 12),
            Text(
              foodName,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: selectedFood == foodName ? Colors.white : Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  selectMenuOption(String foodName) {
    setState(() {
      selectedFood = foodName;
    });
  }
}
