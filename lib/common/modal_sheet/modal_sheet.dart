import 'package:flutter/material.dart';

//TimekeepingFailModal
class TimekeepingFailModal extends StatelessWidget {
  const TimekeepingFailModal({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Checkin Thất bại",
            style: TextStyle(color: Color(0xffD10011), fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Image.asset(
              "assets/gonsa_character.png",
              fit: BoxFit.contain,
              height: 108,
              width: 108,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Vị trí checkin của bạn không thuộc địa điểm cho phép, vui lòng di chuyển đến địa điểm quy định để thực hiện lại.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff262626), fontSize: 14),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Nhanh chân lên kẻo trễ giờ bạn nhé 👋",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff262626), fontSize: 14),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width *0.45, 
                      40
                    ),
                    backgroundColor: const Color(0xffFDEFDB),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: ()=>Navigator.of(context).pop(), 
                    child: const Text(
                      "Trở về",
                      style: TextStyle(
                        color: Color(0xffFF5E00),
                        fontSize: 14,
                      ),
                    )
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width *0.45, 
                      40
                    ),
                    backgroundColor: const Color(0xffFF5E00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                  ),
                  onPressed: () {}, 
                  child: const Text(
                    "Checkin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



//TimekeepingSuccessModal
class TimekeepingSuccessModal extends StatelessWidget {
  const TimekeepingSuccessModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}






