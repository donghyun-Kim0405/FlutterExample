import 'package:geolocator/geolocator.dart';

class LocationRepository {
  final _geoLocator = Geolocator();

  Future<Position> getCurrentLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }//getCurrentLocation()



}