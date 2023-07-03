
import 'package:flutter/material.dart';

import '../../data/models/user/user_data.dart';
import '../../logic/provider/chat/chat_provider.dart';
import '../../logic/provider/navigation/nav_provider.dart';
import '../constants/divider.dart';


class UserCreateChatRoomChat extends StatelessWidget {
  const UserCreateChatRoomChat({
    super.key,
    this.userData,
    required this.chatProvider, required this.navProvider,
  });

  final UserData? userData;
  final ChatProvider chatProvider;
  final NavProvider navProvider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ///create chat room here
        if (userData == null) {
          return;
        }

        chatProvider.createChatRoom(
            userData: userData!,
            success: () {
              ///create room success to home content
              navProvider.tabChange(0);
            },
            error: () {
              ///show dialog error
              const snackBar = SnackBar(
                content: Text('Create Chat Room Failure!'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
      },
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(kCircle),
          child: Image.network(
            userData?.imageUrl ??
                'https://starsunfolded.com/wp-content/uploads/2021/02/Amulya-Rattan.jpg',
            fit: BoxFit.cover,
            width: kCircle,
            height: kCircle,
          ),
        ),
        title:  Text(userData?.username ?? 'username'),
      ),
    );
  }
}