import 'package:flutter_domotic_app/functions.dart';

/// Room class representation
class Room {
  ///
  final String _id = generateRandomString(8);

  ///
  String name;

  ///
  final String _imageOn;

  ///
  final String _imageOff;

  ///
  bool _isOn;

  @override
  String toString() => "$name : ${_isOn ? "light is on " : "light is off"}";

  /// function to switch light state of the room
  bool switchLight() {
    _isOn = !_isOn;
    print("room $_id switched");
    return true;
  }

  ///
  bool getState() => _isOn;

  ///
  String getImage() => _isOn ? _imageOn : _imageOff;

  ///
  String getId() => _id;

  /// Class constructor
  Room(this.name, this._imageOn, this._imageOff, this._isOn);
}
