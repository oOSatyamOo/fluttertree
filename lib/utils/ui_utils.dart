import '../enums/device_screen_type.dart';

DeviceScreenType getDeviceType(double deviceWidth) {
  switch(deviceWidth){
    case >1024:
      return DeviceScreenType.Desktop;
    case >600:
      return DeviceScreenType.Tablet;
    default:
      return DeviceScreenType.Mobile;
  }
}
