import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/data.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile_image.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({Key? key, required this.room}) : super(key: key);
  final Room room;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.0)),
        color: Colors.blue.shade100,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${room.club} 🏠'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
                      letterSpacing: 1.0,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                room.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: 100.0,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 28,
                            top: 28,
                            child: UserProfileImage(
                              imageUrl: room.speakers[1].imageUrl,
                              size: 48.0,
                            ),
                          ),
                          UserProfileImage(
                            imageUrl: room.speakers[0].imageUrl,
                            size: 48.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers.map(
                            (e) => Text(
                              '${e.givenName} ${e.familyName} 💬',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 16.0),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text.rich(
                              TextSpan(
                                  children: [
                                    TextSpan(
                                        text:
                                            '${room.speakers.length + room.followedBySpeakers.length + room.others.length}'),
                                    const WidgetSpan(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 3, bottom: 1.5),
                                      child: Icon(
                                        CupertinoIcons.person_fill,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                    )),
                                    TextSpan(
                                        text: ' / ${room.speakers.length} '),
                                    const WidgetSpan(
                                      child: Icon(
                                        CupertinoIcons.chat_bubble_fill,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                  style: Theme.of(context)
                                      .textTheme
                                      .overline!
                                      .copyWith(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        letterSpacing: 1.0,
                                      )),
                            ),
                          )
                        ],
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
