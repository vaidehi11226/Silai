import 'package:flutter/material.dart';

class Latestdesign extends StatefulWidget {
  const Latestdesign({Key? key}) : super(key: key);

  @override
  State<Latestdesign> createState() => _LatestdesignState();
}

class _LatestdesignState extends State<Latestdesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFfa8919),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Latest Design",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      /* Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: ((overscroll) {
              overscroll.disallowIndicator();
              return true;
            }),
            child:*/
      body: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white30,
                  image: DecorationImage(
                    image: AssetImage('images/ProjectPictures/Blouse/7.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image:
                        new AssetImage("images/ProjectPictures/Burkha/7.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image: new AssetImage("images/ProjectPictures/Gown/2.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image:
                        new AssetImage("images/ProjectPictures/Blouse/5.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image:
                        new AssetImage("images/ProjectPictures/Burkha/4.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image: new AssetImage(
                        "images/ProjectPictures/ChaniyaCholi/1.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image: new AssetImage("images/ProjectPictures/Gown/3.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image: new AssetImage("images/ProjectPictures/Kurti/1.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image: new AssetImage("images/ProjectPictures/Gown/5.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image:
                        new AssetImage("images/ProjectPictures/Peticoat/8.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image: new AssetImage(
                        "images/ProjectPictures/suit/Plazzo/12.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image: new AssetImage(
                        "images/ProjectPictures/suit/Pants/18.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image: new AssetImage(
                        "images/ProjectPictures/suit/Punjabi/5.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.white30,
                  image: new DecorationImage(
                    image: new AssetImage(
                        "images/ProjectPictures/ChaniyaCholi/8.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
    /*child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Ink.image(
                                image: AssetImage(
                                    "images/ProjectPictures/Blouse/6.jpg"),
                                child: InkWell(
                                  onTap: () {},
                                ),
                                height: 200,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 10,
                                right: 15,
                                left: 35,
                                child: Container(
                                  color: Colors.black,
                                  child: Text(
                                    "Blouse",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Ink.image(
                                image: AssetImage(
                                    "images/ProjectPictures/Burkha/7.jpg"),
                                child: InkWell(
                                  onTap: () {},
                                ),
                                height: 200,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 10,
                                right: 15,
                                left: 35,
                                child: Container(
                                  color: Colors.black,
                                  child: Text(
                                    "Burkha",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget buildImageControl() {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: AssetImage("images/ProjectPictures/6.jpg"),
            child: InkWell(
              onTap: () {},
            ),
            height: 200,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: Text(
              "Blouse",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
}*/
  }
}
