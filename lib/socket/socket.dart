import 'dart:io';
import 'dart:convert';

import 'package:flutter_domotic_app/classes/Room.dart';

Future<bool> connectSocket(List<Room> rooms, Function refresh) async {
  // Connect to a TCP server
  try {
    Socket socket = await Socket.connect('127.0.0.1', 3500);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    // Send data to the server
    socket.write('Hello Server');

    List<String> ids = rooms.map((room) => room.getId()).toList();
    socket.write(json.encode(ids));

    // Listen for responses
    socket.listen(
      (data) {
        String message = utf8.decode(data);
        print('Message received : ${message}');
        List<String> order = message.split("-");
        switch (order[1]) {
          case "off":
            rooms.map((room)=>room.getId()==order[0] && room.switchLight()).toList();
			
            print("the room id : ${order[0]}");
			
            // rooms.map((room) {
            //   print("the actual room id ${room.getId()}");
            //   if (room.getId() == order[0]) {
            //     print("Room founded ${room.getId()}");
            //   }
            // }).toList();
          refresh();
          case "on":
            rooms.map((room) => room.getId() == order[0] && room.switchLight());
            refresh();
            break;
          default:
        }
      },
      onDone: () {
        print('Server disconnected');
        socket.destroy();
      },
      onError: (error) {
        print('Error: $error');
        socket.destroy();
      },
    );
    return true;
  } catch (e) {
    print("communication failed with the server $e");
    return false;
  }
}
