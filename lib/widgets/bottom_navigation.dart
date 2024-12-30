import 'package:finalproject/screens/apointments.dart';
import 'package:finalproject/screens/community.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/util/constants.dart';
import '../providers/bottom_nav.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({
    super.key,
  });

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return ScreenUtilInit(
      child: Container(
        width: MediaQuery.sizeOf(context).width.w,
        height: MediaQuery.sizeOf(context).height - 620.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0.0, 0.1),
              blurRadius: 8.0.r,
              spreadRadius: 2.0.r,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            unselectedLabelStyle: TextStyle(
                fontFamily: 'rubik',
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
            selectedLabelStyle: TextStyle(
                fontFamily: 'rubik',
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
            currentIndex: navigationProvider.currentIndex,
            onTap: (index) {
              // Set the index in the provider
              navigationProvider.setIndex(index);
              // navigationProvider.setIndex(index)
              // Perform specific actions based on the index
              switch (index) {
                case 0: // First icon action
                  _navigateToCommunity(context);
                  break;
                case 1: // Second icon action
                  _navigateToPlatform(context);
                  break;
                case 2: // Third icon action
                  _navigateToClasses(context);
                  break;
                case 3: // Fourth icon action
                  _navigateToMeetings(context);
                  break;
                default:
                  break;
              }
            },
            selectedItemColor: kprimaryColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.group_solid),
                label: 'المجتمع',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tag_outlined),
                label: 'المنصة',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.class_outlined),
                label: 'الصفوف',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.tv),
                label: 'الاجتماعات',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Methods for each action
  void _navigateToCommunity(BuildContext context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => Community()));

  void _navigateToPlatform(BuildContext context) =>
      Navigator.pushReplacementNamed(context, AppointmentsPage.id);

  void _navigateToClasses(BuildContext context) =>
      Navigator.pushReplacementNamed(context, AppointmentsPage.id);

  void _navigateToMeetings(BuildContext context) =>
      Navigator.pushReplacementNamed(context, AppointmentsPage.id);
}
