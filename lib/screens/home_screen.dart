import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/widgets/upcoming_rooms.dart';
import 'package:flutter_clubhouse_ui/widgets/widgets.dart';

import '../data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 12, left: 12),
          child: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.search),
              onPressed: () {},
              iconSize: 30,
            ),
            actions: [
              IconButton(
                icon: const Icon(CupertinoIcons.envelope),
                iconSize: 30,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.bell),
                onPressed: () {},
                iconSize: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 10.0, 20.0, 10.0),
                  child: UserProfileImage(
                    imageUrl: currentUser.imageUrl,
                    size: 36.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 120.0),
            children: [
              UpcomingRooms(upcomingRooms: upcomingRoomsList),
              const SizedBox(
                height: 12.0,
              ),
              ...roomsList.map((e) => RoomCard(room: e)),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                      Theme.of(context).scaffoldBackgroundColor,
                    ]))),
          )
        ],
      ),
    );
  }
}
