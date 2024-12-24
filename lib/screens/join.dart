import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/util/constants.dart';
import 'login.dart';
import 'register.dart';

class JoinScreen extends StatefulWidget {
  static const String id = '/join';

  const JoinScreen({Key? key}) : super(key: key);

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<int> selectedTab = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      selectedTab.value = _tabController.index; // Update ValueNotifier
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    selectedTab.dispose(); // Dispose the ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    return ScreenUtilInit(
      enableScaleText: () => false,
      enableScaleWH: () => false,
      child: Scaffold(
        body: ValueListenableBuilder<int>(
          valueListenable: selectedTab,
          builder: (context, currentTab, child) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  currentTab == 0
                      ? Image.asset(
                          'assets/images/logo.png',
                          height: 300.h,
                          width: 300.w,
                        )
                      : Image.asset(
                          'assets/images/logo.png',
                          height: 150.h,
                          width: 150.w,
                        ),
                  currentTab != 0
                      ? AnimatedContainer(
                          height: 800.h,
                          duration: Duration(seconds: 5),
                          child: Stack(
                            children: [
                              AnimatedContainer(
                                height: 200.h,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35.r),
                                    topLeft: Radius.circular(35.r),
                                  ),
                                  gradient: LinearGradient(colors: [
                                    kprimaryColor,
                                    kinProgressStatus
                                  ]),
                                ),
                                duration: const Duration(seconds: 5),
                              ),
                              AnimatedContainer(
                                margin: EdgeInsets.only(top: 75.sp),
                                height: 800.sp,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35.r),
                                    topLeft: Radius.circular(35.r),
                                  ),
                                  color: Colors.white,
                                ),
                                duration: const Duration(seconds: 5),
                              ),
                              TabBar(
                                dividerHeight: 0,
                                padding: EdgeInsets.all(8.sp),
                                controller: _tabController,
                                indicator: BoxDecoration(),
                                labelColor: Colors.white,
                                unselectedLabelColor: Colors.grey[400],
                                labelStyle: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'rubik',
                                  fontWeight: FontWeight.w600,
                                ),
                                unselectedLabelStyle: TextStyle(
                                  fontFamily: 'rubik',
                                  fontSize: 18.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                tabs: const <Widget>[
                                  Tab(text: "تسجيل الدخول"),
                                  Tab(text: "إنشاء حساب"),
                                ],
                              ),
                              Positioned(
                                top: 100.sp,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    Login(selectedTab: currentTab),
                                    Register(selectedTab: currentTab),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          child: Stack(
                            children: [
                              AnimatedContainer(
                                height: 500.h,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35.r),
                                    topLeft: Radius.circular(35.r),
                                  ),
                                  color: kprimaryColor,
                                ),
                                duration: const Duration(seconds: 5),
                              ),
                              AnimatedContainer(
                                height: 500.h,
                                width: MediaQuery.sizeOf(context).width,
                                margin: EdgeInsets.only(top: 70.sp),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(35.r),
                                    topLeft: Radius.circular(35.r),
                                  ),
                                  color: Colors.white,
                                ),
                                duration: const Duration(seconds: 5),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: TabBar(
                                  dividerHeight: 0,
                                  controller: _tabController,
                                  indicator: BoxDecoration(),
                                  labelColor: Colors.white,
                                  unselectedLabelColor: Colors.grey[400],
                                  labelStyle: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'rubik',
                                    fontWeight: FontWeight.w600,
                                  ),
                                  unselectedLabelStyle: TextStyle(
                                    fontFamily: 'rubik',
                                    fontSize: 18.0.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  tabs: const <Widget>[
                                    Tab(text: "تسجيل الدخول"),
                                    Tab(text: "إنشاء حساب"),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 100.sp,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    Login(selectedTab: currentTab),
                                    Register(selectedTab: currentTab),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
