import 'package:flutter/material.dart';



class AlertCheckin extends StatelessWidget {
  String? title;
  AlertCheckin({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 20.0, bottom: 10.0), 
      icon: Image.asset(
        "assets/alert_icon.png",
        height: 53.3,
        width: 53.3,
      ),
      title: Text(
        title!,
        style: const TextStyle(
          color: Color(0xff1C2430),
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Bạn có muốn thực hiện checkin tại cửa hàng này không?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xff4F5764),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.symmetric(vertical: 8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                minimumSize: Size(
                  MediaQuery.of(context).size.width *0.72, 
                  48
                ),
                backgroundColor: const Color(0xffFF5E00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: (){}, 
              child: const Text(
                "Checkin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              )
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(bottom: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                minimumSize: Size(
                  MediaQuery.of(context).size.width *0.72, 
                  48
                ),
                backgroundColor: const Color(0xffFDEFDB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text(
                "Trở về",
                style: TextStyle(
                  color: Color(0xffFF5E00),
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              )
            ),
          ),
        ],
      ),
      
    );
  }
}



//AlertDeleteAvatar
// ignore: must_be_immutable
class AlertDeleteAvatar extends StatelessWidget {
  String? title;
  void Function()? onDelete;
  AlertDeleteAvatar({super.key, required this.title, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 20.0, bottom: 10.0), // Adjust padding as needed
      icon: Image.asset(
        "assets/alert_icon.png",
        height: 53.3,
        width: 53.3,
      ),
      title: Text(
        title!,
        style: const TextStyle(
          color: Color(0xff1C2430),
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Bạn có muốn xóa ảnh đại diện không? Sau khi xóa, ảnh đại diện sẽ được cài đặt mặc định',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              // fontWeight: FontWeight.w400,
              color: Color(0xff4F5764),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.symmetric(vertical: 8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                minimumSize: Size(
                  MediaQuery.of(context).size.width *0.72, 
                  48
                ),
                backgroundColor: const Color(0xffFF5E00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: onDelete, 
              child: const Text(
                "Xóa",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              )
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(bottom: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                minimumSize: Size(
                  MediaQuery.of(context).size.width *0.72, 
                  48
                ),
                backgroundColor: const Color(0xffFDEFDB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text(
                "Thoát ngay",
                style: TextStyle(
                  color: Color(0xffFF5E00),
                  fontSize: 16,
                  fontWeight: FontWeight.w700
                ),
              )
            ),
          ),
        ],
      ),
      
    );
  }
}
