import 'package:flutter/material.dart';
import 'package:kraftbase_chat_app/presentation/widgets/room_card.dart';

import 'package:provider/provider.dart';

import '../../logic/provider/chat/chat_provider.dart';
import 'home_app_bar.dart';



class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /**
         * chat title page
         */
        const HomeAppBar(),
        /**
         * content chat
         */
        Expanded(
          flex: 7,
          child: Consumer<ChatProvider>(
            builder: (context, value, child) {
              return StreamBuilder(
                stream: value.rooms,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return RoomCard(room: snapshot.data?[index],);
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        )
      ],
    );
  }
}