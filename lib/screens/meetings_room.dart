import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class MeetingsRoom extends StatefulWidget {
  static const id = '/room';
  const MeetingsRoom({Key? key}) : super(key: key);

  @override
  State<MeetingsRoom> createState() => _MeetingsRoomState();
}

class _MeetingsRoomState extends State<MeetingsRoom> {
  final TextEditingController _roomController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _serverUrlController = TextEditingController();
  final TextEditingController _tokenController = TextEditingController();

  final JitsiMeet _jitsiMeet = JitsiMeet();

  void _joinMeeting() {
    final String room = _roomController.text.trim();
    final String userName = _userNameController.text.trim();
    final String? serverUrl = _serverUrlController.text.trim().isNotEmpty
        ? _serverUrlController.text.trim()
        : null;
    final String? token = _tokenController.text.trim().isNotEmpty
        ? _tokenController.text.trim()
        : null;

    if (room.isNotEmpty && userName.isNotEmpty) {
      final userInfo = JitsiMeetUserInfo(
        displayName: userName,
      );

      final options = JitsiMeetConferenceOptions(
        serverURL: serverUrl,
        room: room,
        token: token,
        userInfo: userInfo,
        configOverrides: {
          'prejoinPageEnabled': false,
          'disableDeepLinking': true,
        },
        featureFlags: {
          'call-integration.enabled': false,
          'pip.enabled': true,
        },
      );

      _jitsiMeet.join(options);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال اسم الغرفة واسم المستخدم.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('غرفة الاجتماعات'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _roomController,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  labelText: 'اسم الغرفة',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _userNameController,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  labelText: 'اسم المستخدم',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _serverUrlController,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  labelText: 'عنوان الخادم (اختياري)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _tokenController,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  labelText: 'الرمز (اختياري)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _joinMeeting,
                child: const Text('الانضمام إلى الاجتماع'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _roomController.dispose();
    _userNameController.dispose();
    _serverUrlController.dispose();
    _tokenController.dispose();
    super.dispose();
  }
}
