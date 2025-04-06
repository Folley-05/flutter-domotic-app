import 'package:flutter_domotic_app/functions.dart';

/// class representing a room in the house
class Room {
  /// Room ID
  final String _id;

  /// Room name
  String name;

  /// Image shown when the light is on
  final String _imageOn;

  /// Image shown when the light is off
  final String _imageOff;

  /// Current light state
  bool _isOn;

  /// Constructor
  Room(this.name, this._imageOn, this._imageOff, this._isOn)
    : _id = generateRandomString(8);

  /// Serialization to JSON
  Map<String, dynamic> toJson() => {
    '_id': _id,
    'name': name,
    '_imageOn': _imageOn,
    '_imageOff': _imageOff,
    '_isOn': _isOn,
  };

  @override
  String toString() => "$name : ${_isOn ? "light is on " : "light is off"}";

  /// Function to switch light state
  bool switchLight() {
    _isOn = !_isOn;
    return true;
  }

  /// return the state of the room
  bool getState() => _isOn;

  /// return the image path of the room
  String getImage() => _isOn ? _imageOn : _imageOff;

  /// return the id of the room
  String getId() => _id;
}
