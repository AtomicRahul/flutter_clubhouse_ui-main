import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/config/palette.dart';
import 'package:flutter_clubhouse_ui/data.dart';

class UpcomingRooms extends StatelessWidget {
  const UpcomingRooms({
    Key? key,
    required this.upcomingRooms,
  }) : super(key: key);

  final List<Room> upcomingRooms;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Palette.secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(3, 3),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, top: 4.0, bottom: 4.0),
          child: Column(
            children: upcomingRooms
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(top: e.club.isNotEmpty ? 0 : 0),
                            child: Text(e.time),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (e.club.isNotEmpty)
                                  Flexible(
                                    child: Text(
                                      '${e.club} 🏠'.toUpperCase(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .overline!
                                          .copyWith(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 17,
                                            letterSpacing: 1.0,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(e.name),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        ));
  }
}
