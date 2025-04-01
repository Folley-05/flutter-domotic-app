import 'package:flutter_domotic_app/functions.dart';

class Room {
  String _id=generateRandomString(8);
  String name;
  String _imageOn;
  String _imageOff;
  bool _isOn;

  String toString() => "$name : ${_isOn ? "light is on " : "light is off"}";

  bool switchLight() {
    _isOn = !_isOn;
	print("room $_id switched");
    return true;
  }

  bool getState() => _isOn;

  String getImage() => _isOn ? _imageOn : _imageOff;

  String getId()=>_id;

  Room(this.name, this._imageOn, this._imageOff, this._isOn);

}
