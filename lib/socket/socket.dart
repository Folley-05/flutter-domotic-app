import 'dart:convert';
import 'dart:io';

import 'package:flutter_domotic_app/classes/room.dart';

/// Function to handle socket connection with the server
Future<bool> connectSocket(List<Room> rooms, Function refresh) async {
  // Connect to a TCP server
  try {
    final socket = await Socket.connect('127.0.0.1', 3500);

    // Send data to the server
    // socket.write('Hello Server');

    final ids =
        rooms.map((room) => room.toJson()).toList();
    socket.write(json.encode(ids));

    // Listen for responses
    socket.listen(
      (data) {
        final  message = utf8.decode(data);
        final order = message.split("-");
        switch (order[1]) {
          case "off":
            rooms
                .map((room) => room.getId() == order[0] && room.switchLight())
                .toList();

            refresh();
          case "on":
            rooms
                .map((room) => room.getId() == order[0] && room.switchLight())
                .toList();
            refresh();
          case "switch":
            rooms
                .map((room) => room.getId() == order[0] && room.switchLight())
                .toList();
            refresh();
            final ids = rooms.map((room) => room.toJson()).toList();
            socket.write(json.encode(ids));

            break;
          default:
        }
      },
      onDone: socket.destroy,
      onError: (error) {
        socket.destroy();
      },
    );
    return true;
  } catch (e) {
    return false;
  }
}
