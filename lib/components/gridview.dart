import 'package:flutter/material.dart';
import 'package:flutter_domotic_app/classes/Room.dart';
import 'package:flutter_domotic_app/socket/socket.dart';

/// The list of room
final List<Room> rooms = [
  Room(
    "bed room up stairs",
    "assets/images/b1-on.jpeg",
    "assets/images/b1-off.jpeg",
    false,
  ),
  Room(
    "living room",
    "assets/images/lv1-on.jpeg",
    "assets/images/lv1-off.jpeg",
    false,
  ),
  Room(
    "meeting room",
    "assets/images/room-on.jpeg",
    "assets/images/room-off.jpeg",
    false,
  ),
  Room(
    "stairs",
    "assets/images/stairs-on.jpeg",
    "assets/images/stairs-off.jpeg",
    false,
  ),
  Room(
    "dinner room",
    "assets/images/dinner-on.jpeg",
    "assets/images/dinner-off.jpeg",
    false,
  ),
  Room(
    "stairs",
    "assets/images/stairs-on.jpeg",
    "assets/images/stairs-off.jpeg",
    false,
  ),
  Room(
    "bed room down stairs",
    "assets/images/bd2-on.jpeg",
    "assets/images/bd2-off.jpeg",
    false,
  ),
];

/// Class to represent a room as a line with the name and an  action button
class RoomRow extends StatefulWidget {
  /// Class's constructor
  const RoomRow({super.key, required this.room, required this.action});

  /// The room
  final Room room;

  /// The action button's function
  final Function action;

  @override
  State<RoomRow> createState() => _RoomRowState();
}

class _RoomRowState extends State<RoomRow> {
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(widget.room.name),
      Switch(
        value: widget.room.getState(),
        onChanged: (val) {
          widget.room.switchLight();
          widget.action();
        },
      ),
    ],
  );
}

/// Grid displaying the different house's rooms
class HouseGrid extends StatefulWidget {
	/// Grid constructor
  const HouseGrid({super.key});

  // const HouseGrid({super.key, required})

  @override
  State<HouseGrid> createState() => _HouseGridState();
}

class _HouseGridState extends State<HouseGrid> {
  void switchLight() {
    // setState(() {
    //   isOff = !isOff;
    // });
    print("switch light");
    for (final room in rooms) {
      print(room);
      room.switchLight();
      print(room);
    }
    setState(() {});
  }

  void switchRoomLight() {
    setState(() {});
    print("switch a room light executed");
  }

  void testSocket() {
    print("trying to connect to socket ");
    connectSocket(rooms, switchRoomLight);
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height:
        MediaQuery.of(context).size.height *
        0.60, // Set the height to half of the screen
    width: MediaQuery.of(context).size.width * 0.60, // Take full width
    child: Column(
      children: [
        // First row (3 images)
        Expanded(
          child: Row(
            children: List.generate(
              4,
              (index) => Image.asset(rooms[index].getImage()),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: List.generate(
              3,
              (index) => Image.asset(rooms[index + 4].getImage()),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: switchLight,
                child: const Text("Switch Light"),
              ),
              Container(
                child: Column(
                  children:
                      rooms
                          .map(
                            (room) =>
                                RoomRow(room: room, action: switchRoomLight),
                          )
                          .toList(),
                ),
              ),

              ElevatedButton(
                onPressed: testSocket,
                child: const Text("Connect To Server"),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}