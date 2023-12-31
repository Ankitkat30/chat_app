import 'package:flutter/material.dart';

import '../../data/models/chat/message/message.dart';
import '../../data/models/chat/room/room_data.dart';
import '../constants/divider.dart';

class ChatCardReceiver extends StatelessWidget {
  const ChatCardReceiver({
    super.key,
    required this.message,
    required this.room,
  });

  final MessageData? message;
  final RoomData room;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefault * 1.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefault * 1.2, vertical: kDefault),
                margin: const EdgeInsets.only(right: kDefault / 2),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(kDefault),
                        bottomLeft: Radius.circular(kDefault))),
                child: Text(message?.message ?? 'unknown'),
              )),
          SizedBox(
            width: kCircle,
            height: kCircle,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                room.receiverImgUrl ??
                    'https://starsunfolded.com/wp-content/uploads/2021/02/Amulya-Rattan.jpg',
              ),
              radius: kCircle,
            ),
          ),
        ],
      ),
    );
  }
}