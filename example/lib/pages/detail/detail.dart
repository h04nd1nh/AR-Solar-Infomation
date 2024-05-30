import 'package:flutter/material.dart';
import 'package:my_fox_example/pages/detail/ar_view.dart';
import 'package:page_transition/page_transition.dart';

import 'model_view.dart';

class DetailPage extends StatefulWidget {
  DetailPage(
      {super.key,
      required this.title,
      required this.description,
      required this.image_path,
      required this.model_path,
      required this.age,
      required this.size,
      required this.weight,
      required this.image_url});
  String title;
  String description;
  String image_path;
  String model_path;
  String age;
  String size;
  String weight;
  String image_url;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                      Container(
                        child: Image.asset(
                          widget.image_path,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      widget.title,
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Tuổi: ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.age,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Text(
                          'Kích thước: ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.size,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          'Khối lượng: ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.weight,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(widget.image_url),
                        ),
                        Text('Hình ảnh thực tế')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: ARViewPage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.5), // Màu của bóng đổ
                              spreadRadius: 5, // Bán kính lan tỏa
                              blurRadius: 7, // Bán kính làm mờ
                              offset:
                                  Offset(0, 3), // Độ lệch của bóng đổ (x, y)
                            ),
                          ],
                        ),
                        height: 60,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/img/ar.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeftWithFade,
                                child: ModelViewPage(
                                  path: widget.model_path,
                                )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.5), // Màu của bóng đổ
                              spreadRadius: 5, // Bán kính lan tỏa
                              blurRadius: 7, // Bán kính làm mờ
                              offset:
                                  Offset(0, 3), // Độ lệch của bóng đổ (x, y)
                            ),
                          ],
                        ),
                        height: 60,
                        padding: EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/img/3d.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                )),
          )
        ],
      )),
    );
  }
}
