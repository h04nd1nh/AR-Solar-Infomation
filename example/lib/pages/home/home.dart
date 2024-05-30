import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../detail/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Map<String, String>> items = [
    {
      'title': 'Mặt Trời',
      'description':
          'Mặt Trời là ngôi sao trung tâm của Hệ Mặt Trời, cung cấp ánh sáng và năng lượng cho tất cả các hành tinh. Mặt Trời là một ngôi sao lùn vàng, chủ yếu gồm hydro và heli, và đóng vai trò quan trọng trong duy trì sự sống trên Trái Đất.',
      'image_path': 'assets/img/sun.png',
      'image_url':
          'https://nhadepso.com/wp-content/uploads/2023/01/50-hinh-anh-mat-troi-dep-nhat-an-tuong-nhat-khong-nen-bo-lo_20.jpg',
      'model_path': 'assets/models/sun.glb',
      'age': '4,6 tỷ năm',
      'size': '1,392,700 km (đường kính)',
      'weight': '1.989 × 10^30 kg'
    },
    {
      'title': 'Sao Thuỷ',
      'description':
          'Sao Thủy, còn được gọi là Mercury trong tiếng Anh, là hành tinh nhỏ nhất và gần Mặt Trời nhất trong Hệ Mặt Trời. Sao Thủy có bề mặt giống Mặt Trăng với nhiều hố va chạm và gần như không có bầu khí quyển.',
      'image_path': 'assets/img/neptune.png',
      'image_url':
          'https://vcdn-vnexpress.vnecdn.net/2021/12/04/sao-thuy-4633-1638620760.jpg',
      'model_path': 'assets/models/neptune.glb',
      'age': '4,5 tỷ năm',
      'size': '4,880 km (đường kính)',
      'weight': '3.285 × 10^23 kg'
    },
    {
      'title': 'Sao Kim',
      'description':
          'Sao Kim, còn được gọi là Venus trong tiếng Anh, là hành tinh thứ hai từ Mặt Trời và có kích thước gần bằng Trái Đất. Sao Kim nổi bật với bầu khí quyển dày đặc chứa chủ yếu là CO2 và bề mặt nóng bỏng.',
      'image_path': 'assets/img/mars.png',
      'image_url':
          'https://photo2.tinhte.vn/data/attachment-files/2023/01/6306647_cover_venus.jpg',
      'model_path': 'assets/models/mars.glb',
      'age': '4,5 tỷ năm',
      'size': '12,104 km (đường kính)',
      'weight': '4.867 × 10^24 kg'
    },
    {
      'title': 'Trái Đất',
      'description':
          'Trái Đất là hành tinh thứ ba từ Mặt Trời và là hành tinh duy nhất được biết có sự sống. Trái Đất có bầu khí quyển chứa oxy, nước ở dạng lỏng và địa hình đa dạng.',
      'image_path': 'assets/img/earth.png',
      'image_url':
          'https://vcdn1-vnexpress.vnecdn.net/2017/12/12/101-1513051780.jpg?w=1200&h=0&q=100&dpr=1&fit=crop&s=kYbI2d_xKlxWjJxrp3Vp9w',
      'model_path': 'assets/models/mars.glb',
      'model_path': 'assets/models/earth.glb',
      'age': '4,5 tỷ năm',
      'size': '12,742 km (đường kính)',
      'weight': '5.972 × 10^24 kg'
    },
    {
      'title': 'Sao Hoả',
      'description':
          'Sao Hỏa, còn được gọi là Mars trong tiếng Anh, là hành tinh thứ tư từ Mặt Trời và được biết đến với biệt danh "Hành tinh Đỏ" do bề mặt chứa nhiều oxit sắt.',
      'image_path': 'assets/img/mercury.png',
      'image_url':
          'https://gcs.tripi.vn/public-tripi/tripi-feed/img/473499PdF/image-55-hinh-anh-sao-hoa-o-moi-goc-do-an-tuong-va-thu-vi-nhat-167937202878288.jpg',
      'model_path': 'assets/models/mercury.glb',
      'age': '4,6 tỷ năm',
      'size': '6,779 km (đường kính)',
      'weight': '6.39 × 10^23 kg'
    },
    {
      'title': 'Sao Mộc',
      'description':
          'Sao Mộc, còn được gọi là Jupiter trong tiếng Anh, là hành tinh lớn nhất trong Hệ Mặt Trời. Sao Mộc chủ yếu là một hành tinh khí khổng lồ, gồm chủ yếu là hydro và heli. Nó có thể có một lõi đá hoặc kim loại nhỏ nằm sâu bên trong. Dưới đây là một số thông tin chi tiết về sao Mộc.',
      'image_path': 'assets/img/venus.png',
      'image_url':
          'https://vcdn-vnexpress.vnecdn.net/2022/08/23/sao-moc-1-1851-1661225244.jpg',
      'model_path': 'assets/models/venus.glb',
      'age': '4,603 tỷ năm',
      'size': '142,984 km (đường kính)',
      'weight': '1.898 × 10^27 kg'
    },
    {
      'title': 'Sao Thổ',
      'description':
          'Sao Thổ, còn được gọi là Saturn trong tiếng Anh, là hành tinh thứ sáu từ Mặt Trời và nổi tiếng với hệ thống vành đai băng đá rộng lớn.',
      'image_path': 'assets/img/saturn.png',
      'image_url':
          'https://thienvanhanoi.org/wp-content/uploads/2018/10/sao-th%E1%BB%95.jpg',
      'model_path': 'assets/models/saturn.glb',
      'age': '4,5 tỷ năm',
      'size': '116,460 km (đường kính)',
      'weight': '5.683 × 10^26 kg'
    },
    {
      'title': 'Sao Thiên Vương',
      'description':
          'Sao Thiên Vương, còn được gọi là Uranus trong tiếng Anh, là hành tinh thứ bảy từ Mặt Trời và có màu xanh lam do chứa khí metan trong khí quyển.',
      'image_path': 'assets/img/uranus.png',
      'image_url':
          'https://vcdn-vnexpress.vnecdn.net/2021/04/03/sao-thien-vuong-6146-1617441932.jpg',
      'model_path': 'assets/models/uranus.glb',
      'age': '4,5 tỷ năm',
      'size': '50,724 km (đường kính)',
      'weight': '8.681 × 10^25 kg',
    },
    {
      'title': 'Sao Hải Vương',
      'description':
          'Sao Hải Vương, còn được gọi là Neptune trong tiếng Anh, là hành tinh xa nhất từ Mặt Trời và nổi bật với các cơn bão mạnh và khí quyển xanh thẫm.',
      'image_path': 'assets/img/jupiter.png',
      'image_url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs_OCjmZt7eRmF0q9X2gz3zuMPX1mKkwtqW9NwoxO9LA&s',
      'model_path': 'assets/models/jupiter.glb',
      'age': '4,5 tỷ năm',
      'size': '49,244 km (đường kính)',
      'weight': '1.024 × 10^26 kg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff015fc5), Color(0xff56007c)],
          )),
          child: SingleChildScrollView(
            child: Container(
              // padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Hi, Hoan Dinh',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Image.asset('assets/img/banner.png')),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Các hành tinh',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200,
                      enlargeCenterPage: true,
                      viewportFraction: 0.7,
                    ),
                    items: items.map((item) {
                      return Builder(
                        builder: (BuildContext context) {
                          return MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                      child: DetailPage(
                                        title: item['title']!,
                                        description: item['description']!,
                                        image_path: item['image_path']!,
                                        model_path: item['model_path']!,
                                        age: item['age']!,
                                        size: item['size']!,
                                        weight: item['weight']!,
                                        image_url: item['image_url']!,
                                      )));
                            },
                            child: Container(
                                child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 150,
                                  margin: EdgeInsets.only(top: 50),
                                  decoration: BoxDecoration(
                                      gradient: RadialGradient(
                                        radius: 0.4,
                                        focalRadius: 0.9,
                                        colors: [
                                          Color(0xff0965ab),
                                          Color(0xff021860)
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'assets/img/crack.png',
                                          fit: BoxFit.fill,
                                          opacity:
                                              const AlwaysStoppedAnimation(.5),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            item['title']!,
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    child: Image.asset(
                                      item['image_path']!,
                                      scale: 0.6,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                          );
                        },
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
