import 'package:finalproject/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatefulWidget {
  static const id = 'profile';

  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<int> selectedTab = ValueNotifier<int>(0);

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      selectedTab.value = _tabController.index; // Update ValueNotifier
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    selectedTab.dispose(); // Dispose the ValueNotifier

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ValueListenableBuilder<int>(
            valueListenable: selectedTab,
            builder: (context, currentTab, child) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.grey,
                                size: 20.sp,
                              )),
                          Text(
                              style: TextStyle(
                                  color: kprimaryColor,
                                  fontFamily: 'rubik',
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w600),
                              'الصفحة الشخصية'),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.menu,
                                color: Colors.grey,
                                size: 20.sp,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      height: 150.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/man1.jpg',
                          ),
                          fit: BoxFit
                              .cover, // Ensures the image fits within the circle
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      'عمر حمدان',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                          fontFamily: 'rubik'),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w200,
                            fontSize: 15.sp,
                            fontFamily: 'rubik'),
                        'طالب في مدرسة ذكور تل الهوا الإعدادية أ\n'
                        'ثامن 3\n'
                        'فلسطين / غزة - تل الهوا'),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                fontFamily: 'rubik'),
                            'المنشورات'),
                        Text(
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                fontFamily: 'rubik'),
                            'متابعين'),
                        Text(
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                                fontFamily: 'rubik'),
                            'تتابع'),
                      ],
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      height: 35.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(3.0, 3.0),
                              blurRadius: 8.0.r,
                              spreadRadius: 2.0.r,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(6.r),
                          gradient: LinearGradient(
                              colors: [orangeColor, Colors.blueAccent])),
                      child: Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontFamily: 'Poppines',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.edit_note_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Stack(
                      children: [
                        Center(
                          child: Container(
                              height: 50.h,
                              width: 200.w,
                              decoration: BoxDecoration(
                                  color: kprimaryColor,
                                  borderRadius: BorderRadius.circular(30.r))),
                        ),
                        currentTab == 0
                            ? Padding(
                                padding: EdgeInsets.only(
                                  left: 75.0.sp,
                                  bottom: 400.sp,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 8.sp,
                                      left: 16.0.sp,
                                      right: 16.sp),
                                  child: TabBar(
                                    tabAlignment: TabAlignment.center,
                                    dividerHeight: 0,
                                    controller: _tabController,
                                    indicator: BoxDecoration(),
                                    labelColor: kprimaryColor,
                                    unselectedLabelColor: Colors.white,
                                    labelStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'rubik',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    unselectedLabelStyle: TextStyle(
                                      fontFamily: 'rubik',
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    tabs: <Widget>[
                                      Container(
                                          height: 30.h,
                                          width: 80.w,
                                          child: Tab(text: 'حضور لقاء'),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(30.r))),
                                      Tab(text: "عمل لقاء"),
                                    ],
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                  left: 75.0.sp,
                                  bottom: 400.sp,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 8.sp,
                                      right: 16.0.sp,
                                      left: 16.sp),
                                  child: TabBar(
                                    tabAlignment: TabAlignment.center,
                                    dividerHeight: 0,
                                    controller: _tabController,
                                    indicator: BoxDecoration(),
                                    labelColor: kprimaryColor,
                                    unselectedLabelColor: Colors.white,
                                    labelStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'rubik',
                                      fontWeight: FontWeight.w600,
                                    ),
                                    unselectedLabelStyle: TextStyle(
                                      fontFamily: 'rubik',
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    tabs: <Widget>[
                                      Tab(text: "حضور لقاء"),
                                      Container(
                                          height: 30.h,
                                          width: 80.w,
                                          child: Tab(text: 'عمل لقاء'),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(30.r))),
                                    ],
                                  ),
                                ),
                              )
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
