import 'package:flutter/material.dart';
//Note: declare assets/gonsa_character.png


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
            "Checkin Thất Bại",
            style: TextStyle(color: Color(0xffD10011), fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                  onPressed: () => Navigator.of(context).pop(), 
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
// ignore: must_be_immutable
class TimekeepingSuccessModal extends StatelessWidget {
  late String timekeepingStatus;
  late String name;
  late String role;
  TimekeepingSuccessModal({
    super.key, 
    required this.timekeepingStatus, 
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            timekeepingStatus,
            style: const TextStyle(color: Color(0xff25B946), fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              "assets/avatar_test.png",
              fit: BoxFit.contain,
              height: 80,
              width: 80,
            ),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xff262626), fontSize: 16),
          ),
          Container(
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: const Color(0xffFDEFDB),
              borderRadius: BorderRadius.circular(100.0)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              child: Text(
                role,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xffFF5E00), fontSize: 14),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Chúc mừng bạn đã chấm công thành công lúc 06:45 hôm nay. Bạn là người thứ 2 trong ngày chấm công.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff262626), fontSize: 14),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Cảm ơn vì những đóng góp của bạn 🎉",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xff262626), fontSize: 14),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                minimumSize: Size(
                  MediaQuery.of(context).size.width *0.9, 
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
          )
        ],
      ),
    );
  }
}



class UpdateAvatartModal extends StatelessWidget {
  const UpdateAvatartModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close, size: 24, color: Color(0xff7E8A9A),)
              ),
              const Text(
                "Cập nhật ảnh đại diện",
                style: TextStyle(
                  color: Color(0xff262626), 
                  fontSize: 16, 
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(width: 24.0,)
            ],
          ),

          TextButton.icon(
            onPressed: (){}, 
            icon: Container(
              decoration: BoxDecoration(
                color: Color(0xffFDEFDB)
              ),
              child: Icon(Icons.image),
            ), 
            label: Text("Tải ảnh trong thiết bị của bạn")
          )
          
          
          
        ],
      ),
    );
  }
}







