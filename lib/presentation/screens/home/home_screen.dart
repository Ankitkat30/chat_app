import 'package:flutter/material.dart';
import 'package:kraftbase_chat_app/presentation/screens/auth/signup/signupScreen.dart';
import 'package:kraftbase_chat_app/presentation/screens/people/people.dart';
import 'package:kraftbase_chat_app/presentation/screens/profile/logout.dart';

import 'package:provider/provider.dart';


import '../../../logic/provider/chat/chat_provider.dart';
import '../../../logic/provider/navigation/nav_provider.dart';
import '../../constants/divider.dart';
import '../../widgets/create_room.dart';
import '../../widgets/home_content.dart';
import '../../widgets/navigation_item.dart';
import '../../widgets/silver_sized_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(
          create: (context) => NavProvider(),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ChatProvider chatProvider;
  late NavProvider navProvider;

  @override
  void initState() {
    super.initState();
    chatProvider = Provider.of(context, listen: false);
    navProvider = Provider.of(context, listen: false);
    Future.delayed(const Duration(milliseconds: 350), () {
      chatProvider.currentUser();
      chatProvider.getUsers();
      chatProvider.getRooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        slivers: [
          SliverSizedBox(
            height: size.height * .9,
            child: Consumer<NavProvider>(
              builder: (context, value, child) {
                return IndexedStack(
                  index: value.index,
                  children: [
                    HomeContent(size: size),
                    const CreateRoom(),
                    PeopleScreen(),
                    LogoutScreen()
                  ],
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBottomBar() {
    return Container(
      padding: const EdgeInsets.only(
        right: kDefault,
        left: kDefault,
        top: kDefault / 2,
        bottom: kDefault * 1.4
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(.0, 3),
                color: Colors.black12.withOpacity(.23),
                blurRadius: kDefault)
          ]),
      child: Consumer<NavProvider>(
        builder: (context, value, child) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NavigationItem(
                icon: Icons.chat,
                label: "Chat",
                isActive: value.index == 0,
                tab: () {
                  navProvider.tabChange(0);
                },
              ),
              NavigationItem(
                icon: Icons.call,
                label: "Call",
                isActive: value.index == 1,
                tab: () {
                  navProvider.tabChange(1);
                },
              ),
              NavigationItem(
                icon: Icons.history,
                label: "History",
                isActive: value.index == 2,
                tab: () {
                  navProvider.tabChange(2);
                },
              ),
              NavigationItem(
                icon: Icons.man,
                label: "Profile",
                isActive: value.index == 3,
                tab: () {
                  navProvider.tabChange(3);
                },
              )
            ],
          );
        },
      ),
    );
  }
}


