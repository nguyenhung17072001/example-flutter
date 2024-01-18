import 'package:example/common/index.dart';
import 'package:example/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';



class Timekeeping extends StatefulWidget {
  const Timekeeping({super.key});

  @override
  State<Timekeeping> createState() => _TimekeepingState();
}

class _TimekeepingState extends State<Timekeeping> {
  final storage = const FlutterSecureStorage();
  //late  timekeepingData;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permission();
    
    
  }

  


  void checkIn () async{
   
    final String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final String time = DateFormat('HH:mm').format(DateTime.now());
    print(date);
    final uid = await storage.read(key: 'uid');
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    await FirebaseUtils.instance.setData("timekeeping/$uid/$date/checkin", {
      "name": "Hung",
      "createAt": time.toString(),
      "location": {
        'lat': position.latitude,
        "lon": position.longitude,
      }, 


    });
  }

  void checkOut () async{

    final String date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final uid = await storage.read(key: 'uid');
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    await FirebaseUtils.instance.setData("timekeeping/$uid/$date/checkout", {
      "name": "Hung",
      "createAt": DateTime.now().toString(),
      "location": {
        'lat': position.latitude,
        "lon": position.longitude,
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



  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: TextButton.icon(
                onPressed: checkIn,
                label: const Text('Check In'), 
                icon: Icon(Icons.touch_app),
              ),
            ),
            Container(
              child: TextButton.icon(
                onPressed: checkOut,
                label: const Text('Check out'), 
                icon: Icon(Icons.touch_app),
              ),
            ),

            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: AgentTextField(
                controller: textEditingController,
                labelText: 'Tên đối tác đầy đủ',
                onChanged: (String text) {
                  print(textEditingController.text);
                },
              ),
            )
            
            
          ],
        )
      ),
    );
  }
}