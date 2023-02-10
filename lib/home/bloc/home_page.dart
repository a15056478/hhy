import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hhy/miscellaneous/hexcolors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> _homePageCardPaths = [
    'assets/safety.svg',
    'assets/elderly.svg',
    'assets/pregnancy.svg',
    'assets/operative.svg',
    'assets/doctor.svg',
    'assets/lab.svg',
    'assets/pharmacy.svg',
    'assets/medical.svg',
    'assets/overseas.svg',
    'assets/general.svg',
  ];

  final List<String> _cardTitles = [
    'SAFETY TRAINING',
    'ELDERLY CARE',
    'PREGNANCY CARE',
    'OPERATIVE CARE',
    'DOCTOR CONSULTATION',
    'LAB TEST',
    'PHARMACY',
    'MEDICAL ASTROLOGY',
    'OVERSEAS SERVICE',
    'GENERAL WELLNESS',
  ];
  final List<Widget> _list = [];
  @override
  void initState() {
    for (int i = 0; i < _homePageCardPaths.length; i++) {
      _list.add(HomePageCard(
          imgPath: _homePageCardPaths[i], cardTitle: _cardTitles[i]));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return SafeArea(
        top: false,
        child: Scaffold(
          key: _scaffoldKey,
          endDrawer: Drawer(
            child: Padding(
              padding: EdgeInsets.only(top: 54.h),
              child: Container(
                color: Colors.white70,
                child: Column(
                  children: List.generate(
                      5,
                      (index) => ListTile(
                            title: Text('Drawer Item ${index + 1}'),
                          )),
                ),
              ),
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size(
              double.infinity,
              height / 9,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 30.h, left: 10.w, right: 10.w, bottom: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: height / 9,
                    width: height / 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo_2.png',
                        height: width / 4,
                        width: height / 9,
                      ),
                      IconButton(
                          onPressed: () {
                            _scaffoldKey.currentState!.openEndDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 5.h,
                ),
                child: SizedBox(
                    height: height * 0.05,
                    child: const CupertinoSearchTextField()),
              ),
              SizedBox(
                height: height * 0.7,
                width: width,
                child: GridView.count(
                  padding: EdgeInsets.all(10.w),
                  mainAxisSpacing: 5.w,
                  crossAxisSpacing: 10.w,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: width * 3.5 / height,
                  children: _list,
                ),
              ),
            ],
          ),
        ));
  }
}

class HomePageCard extends StatelessWidget {
  final String imgPath;
  final String cardTitle;
  const HomePageCard({
    Key? key,
    required this.imgPath,
    required this.cardTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          height: height / 11,
          width: width / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              color: HexColor(
                Hexcolors.borderGreen,
              ),
            ),
          ),
          child: SvgPicture.asset(
            imgPath,
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          cardTitle,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
