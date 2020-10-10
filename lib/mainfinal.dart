import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double width , height;
  @override
  Widget build(BuildContext context) {
width = MediaQuery.of(context).size.width;
height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF485079),
        elevation: 0,
        leading: Container(padding: EdgeInsets.symmetric(vertical: 6),child: Image.asset("assets/images/logo.png")),
        title: GestureDetector(child: Text("EduWorld" , style: TextStyle(color: Colors.white),)),
        centerTitle: true,
        actions: <Widget>[
            GestureDetector(
                          child: IconButton(
                
                icon: Image.network("https://cdn2.iconfinder.com/data/icons/ios-7-icons/50/user_male2-512.png"),
                onPressed: null,
              ),
            )
          ],
      ),
      backgroundColor: Color(0xFF485079),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
      Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      height: 125,
      child: InkWell(
        onTap: null,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF727CAB), 
                
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: 'a',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  
                  child: Image.asset("assets/images/book.png",
                    height: 80,
                    width: 80,
                    
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 100,
                width: width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      child: Text(
                        ("Subjects"),style: TextStyle(fontSize: 22 , color: Color(0xFFE5E7F3)),
                        
                      ),
                    ),
                   
                    Spacer(),
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      height: 125,
      child: InkWell(
        onTap: null,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF727CAB), 
                
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Hero(
                tag: 'b',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  
                  child: Image.asset("assets/images/location.png",
                    height: 80,
                    width: 80,
                    
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 100,
                width: width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      child: Text(
                        ("Location"),style: TextStyle(fontSize: 22 , color: Color(0xFFE5E7F3)),
                        
                      ),
                    ),
                   
                    Spacer(),
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      height: 125,
      child: InkWell(
        onTap: null,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF727CAB), 
                
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Hero(
                tag: 'c',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  
                  child: Image.asset("assets/images/language.png",
                    height: 80,
                    width: 80,
                    
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 100,
                width: width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      child: Text(
                        ("Language"),style: TextStyle(fontSize: 22 , color: Color(0xFFE5E7F3)),
                        
                      ),
                    ),
                   
                    Spacer(),
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      height: 125,
      child: InkWell(
        onTap: null,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            
            Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF727CAB),
                
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Hero(
                tag: 'd',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  
                  child: Image.asset("assets/images/teacher.png",
                    height: 80,
                    width: 80,
                    
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SizedBox(
                height: 100,
                width: width - 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20),
                      child: Text(
                        ("Mode Of Teaching"), style: TextStyle(fontSize: 22 , color: Color(0xFFE5E7F3)),
                        
                      ),
                    ),
                   
                    Spacer(),
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
          ],
        ),
      ),
    );
  }
}
