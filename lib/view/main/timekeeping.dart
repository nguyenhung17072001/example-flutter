import 'package:example/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';




class Timekeeping extends StatefulWidget {
  const Timekeeping({super.key});

  @override
  State<Timekeeping> createState() => _TimekeepingState();
}

class _TimekeepingState extends State<Timekeeping> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permission();
  }
  void checkIn () async{
    //Intl.defaultLocale = 'vi';
    //Intl.defaultLocale = 'es';
    final String formatter = DateFormat('dd/MM/yyyy').format(DateTime.now());
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     await Firebase_Utils.instance.setData("timekeeping", {
      "name": "Hung",
      "createAt": formatter,
      "location": {
        'lat': position.latitude,
        "lon": position.longitude,
      }, 


    });
  }
  void checkOut () async{
    
     await Firebase_Utils.instance.setData("timekeeping", {
      "name": "Hung",
      "createAt": DateTime.now().toString(),
      "location": {
        'lat': "21.020688",
        "lon": "105.847199"
      }, 


    });
  }

  Future<void> permission ()async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
      
        return Future.error('Location permissions are denied');
      }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: TextButton(
                onPressed: checkIn,
                child: const Text('Check In'),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: checkOut,
                child: const Text('Check Out'),
              ),
            ),
            
          ],
        )
      ),
    );
  }
}