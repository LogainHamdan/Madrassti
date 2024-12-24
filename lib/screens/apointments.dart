import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/meetings.dart';
import '../widgets/appointment_card.dart';
import '../widgets/bottom_navigation.dart';

class AppointmentsPage extends StatelessWidget {
  static const id = '/appointment';

  const AppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> appointments = getMeetings;
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: kscaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, HomePage.id),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: kprimaryColor,
                ),
              ),
              Text(
                'المواعيد',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                ),
              ),
              TextButton(
                child: Text(
                  'إضافة',
                  style: TextStyle(
                    color: orangeColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: kscaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: appointments.length,
                separatorBuilder: (context, index) => SizedBox(height: 5.h),
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  return AppointmentCard(
                    img: appointment['img']!,
                    name: appointment['name']!,
                    time: appointment['time']!,
                    description: appointment['description']!,
                  );
                },
              ),
            ),
            BottomNavigationBarCustom(),
          ],
        ),
      ),
    );
  }
}
