// import 'package:flutter/material.dart';
// import 'package:one_store/page/setting/change_address.dart';
// import '../../data/model/address_model.dart';

// class ItemAddressGridView extends StatelessWidget {
//   final Address address;
//   ItemAddressGridView(this.address);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ChangeAddressScreen(address: addresses[index])));
//       },
//       child: Container(
//         padding:
//             const EdgeInsets.only(left: 31, top: 20, right: 31, bottom: 20),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       '${address.userName}',
//                       style: const TextStyle(
//                           fontSize: 16, fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 6,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       '${address.phoneNumber}',
//                       style: const TextStyle(fontSize: 13),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       '${address.address}',
//                       style: const TextStyle(fontSize: 13),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     if (address.isDefault == true)
//                       Container(
//                         padding: const EdgeInsets.all(
//                             3), // Khoảng cách giữa chữ và khung chữ nhật
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: const Color(0xFFF3B664),
//                             width: 1.0,
//                           ),
//                           borderRadius: BorderRadius.circular(
//                               0), // Độ bo góc của khung chữ nhật
//                         ),
//                         child: const Text(
//                           'Mặc định',
//                           style: TextStyle(
//                               fontSize: 13, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                   ],
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:one_store/data/model/address_model.dart';
import 'package:one_store/page/setting/addressuser/change_address.dart';

class ItemAddressGridView extends StatelessWidget {
  final Address address;

  ItemAddressGridView(this.address);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeAddressScreen(address: address),
          ),
        );
      },
      child: Container(
        padding:
            const EdgeInsets.only(left: 31, top: 20, right: 31, bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${address.userName}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Text(
                        '${address.phoneNumber}',
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${address.address}',
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      if (address.isDefault == true)
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xFFF3B664),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: const Text(
                            'Mặc định',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
