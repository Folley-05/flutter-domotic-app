import 'package:flutter/material.dart';
import 'package:flutter_domotic_app/classes/Room.dart';

final List<Room> rooms = [
  new Room(
    "bed room up stairs",
    "assets/images/b1-on.jpeg",
    "assets/images/b1-off.jpeg",
    false,
  ),
  new Room(
    "living room",
    "assets/images/lv1-on.jpeg",
    "assets/images/lv1-off.jpeg",
    false,
  ),
  new Room(
    "meeting room",
    "assets/images/room-on.jpeg",
    "assets/images/room-off.jpeg",
    false,
  ),
  new Room(
    "stairs",
    "assets/images/stairs-on.jpeg",
    "assets/images/stairs-off.jpeg",
    false,
  ),
  new Room(
    "dinner room",
    "assets/images/dinner-on.jpeg",
    "assets/images/dinner-off.jpeg",
    false,
  ),
  new Room(
    "stairs",
    "assets/images/stairs-on.jpeg",
    "assets/images/stairs-off.jpeg",
    false,
  ),
  new Room(
    "bed room down stairs",
    "assets/images/bd2-on.jpeg",
    "assets/images/bd2-off.jpeg",
    false,
  ),
];

class RoomRow extends StatefulWidget {
  const RoomRow({super.key, required this.room, required this.action});

  final Room room;
  final Function action;

  @override
  State<RoomRow> createState() => _RoomRowState();
}

class _RoomRowState extends State<RoomRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
}

class HouseGrid extends StatefulWidget {
  // const HouseGrid({super.key, required})

  @override
  State<HouseGrid> createState() => _HouseGridState();
}

class _HouseGridState extends State<HouseGrid> {
  bool isOff = true;
  final List<String> imagePathsOff = [
    "assets/images/b1-off.jpeg",
    "assets/images/lv1-off.jpeg",
    "assets/images/room-off.jpeg",
    "assets/images/stairs-off.jpeg",
    "assets/images/dinner-off.jpeg",
    "assets/images/stairs-off.jpeg",
    "assets/images/bd2-off.jpeg",
  ];
  final List<String> imagePathsOn = [
    "assets/images/b1-on.jpeg",
    "assets/images/lv1-on.jpeg",
    "assets/images/room-on.jpeg",
    "assets/images/stairs-on.jpeg",
    "assets/images/dinner-on.jpeg",
    "assets/images/stairs-on.jpeg",
    "assets/images/bd2-on.jpeg",
  ];

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

    // print(rooms[0].toString());
  }

  void switchRoomLight() {
    setState(() {});
    print("switch a room light executed");
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
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: switchLight,
                child: Text("Switch Light"),
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
            ],
          ),
        ),
      ],
    ),
  );
}

// children: <Widget>rooms.map((room, index){
// 					return RoomRow({index: index, action: switchRoomLight})
// 				}).toList(),
