import 'package:finalproject/core/util/constants.dart';
import 'package:finalproject/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../data/chat_data.dart';
import '../providers/fields.dart';
import '../widgets/chat_row.dart';

class Chats extends StatefulWidget {
  static const id = '/chats';

  const Chats({Key? key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  late List<Map<String, dynamic>> chatData; // Original chat data
  late List<Map<String, dynamic>> filteredChatData; // Filtered chat data
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chatData = getChatData; // Initialize chat data
    filteredChatData = chatData; // Initially, show all chats
    searchController.addListener(_filterChats);
  }

  void _filterChats() {
    setState(() {
      String query = searchController.text.toLowerCase();
      filteredChatData = chatData
          .where((chat) => chat['sender'].toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kscaffoldBackgroundColor,
        body: Padding(
          padding: EdgeInsets.only(top: 40.0.sp, left: 26, right: 26),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 24.sp,
                    ),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, HomePage.id),
                  ),
                  Text(
                    style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                        color: kprimaryColor,
                        fontFamily: 'rubik'),
                    'المحادثات',
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.menu_sharp,
                      color: Colors.grey,
                      size: 24.sp,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.sp),
                child: Container(
                  width: 370.w,
                  height: 65.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0.0, 0.1),
                        blurRadius: 20.r,
                        spreadRadius: 0.r,
                      )
                    ],
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      cursorColor: Colors.grey[400],
                      controller: searchController,
                      style: TextStyle(
                        fontFamily: 'rubik',
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        hintText: 'ابحث عن صديقك',
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Container(
                          height: 100.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(0.0, 0.1),
                                  blurRadius: 20.r,
                                  spreadRadius: 0.r,
                                )
                              ],
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [
                                Colors.grey,
                                orangeColor,
                              ])),
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                        ),
                      ),
                      autofocus: false,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: filteredChatData.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    var chat = filteredChatData[index];
                    return Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ChatRow(
                        sender: chat['sender'],
                        msg: chat['msg'],
                        time: chat['time'],
                        timeUnit: chat['timeUnit'],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0.0, 0.1),
                            blurRadius: 20.r,
                            spreadRadius: 0.r,
                          )
                        ],
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Colors.blue,
                          Colors.grey,
                          orangeColor,
                        ])),
                    child: Icon(
                      size: 36.sp,
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
