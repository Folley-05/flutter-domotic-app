class Room {
  String name;
  String _imageOn;
  String _imageOff;
  bool _isOn;

  String toString() => "$name : ${_isOn ? "light is on " : "light is off"}";

  bool switchLight() {
    _isOn = !_isOn;
    return true;
  }

  bool getState()=>_isOn;

  String getImage() => _isOn ? _imageOn : _imageOff;

  Room(this.name, this._imageOn, this._imageOff, this._isOn);
}

