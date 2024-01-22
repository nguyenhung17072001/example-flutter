import 'package:flutter/material.dart';

class AgencyItem extends StatefulWidget {
  final String agencyName;
  final String? fullName;
  final String? phoneNumber;
  final String? address;

  AgencyItem({
    super.key, 
    required this.agencyName, 
    required this.fullName, 
    required this.phoneNumber,
    required this.address,
  });

  @override
  State<AgencyItem> createState() => _AgencyItemState();
}

class _AgencyItemState extends State<AgencyItem> {
  late String _agencyName;
  late String _fullName;
  late String _phoneNumber;
  late String _address;


  @override
  void initState() {
    super.initState();
    _agencyName = widget.agencyName;
    _fullName = widget.fullName ?? "";
    _phoneNumber = widget.phoneNumber ?? "";
    _address = widget.address ?? "";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 400, 
      width: double.infinity,
      color: Colors.white,
      //margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
              height: 10,
              width: double.infinity,
              color: const Color(0xffF2F5F8),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                const Row(
                  children: [
                    Text(
                      'Tuyến Phân Đình Phùng',
                      
                    ),
                    Text('03 - Chỉ đạo BOD'),
                  ],
                ),
                Text(
                  _agencyName,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff262626),
                    fontWeight: FontWeight.w600
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.phone, color: Color(0xff837C73), size: 18,),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "$_fullName - $_phoneNumber",
                          style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff837C73),
                          fontWeight: FontWeight.w400
                        ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Color(0xff837C73), size: 18),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          _address,
                          softWrap: true,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff837C73),
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {}, 
                        icon: Image.asset(
                          "assets/agency_report_icon.png",
                          width: 16.5,
                          height: 16.5,
                          fit: BoxFit.contain,
                        ), 
                        label: const Text(
                          "Báo cáo",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffF89C0D),
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {}, 
                        icon: Image.asset(
                          "assets/agency_visit_icon.png",
                          width: 16.5,
                          height: 16.5,
                          fit: BoxFit.contain,
                        ), 
                        label: const Text(
                          "Ghé thăm",
                          //softWrap: false,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffF89C0D),
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ),
                    ),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {}, 
                        icon: Image.asset(
                          "assets/agency_order_icon.png",
                          width: 16.5,
                          height: 16.5,
                          fit: BoxFit.contain,
                        ), 
                        label: const Text(
                          "Lên đơn",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xffFF5E00),
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}