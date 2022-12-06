// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tubee/utils/config.dart';

// class LinkField extends StatelessWidget {
//   const LinkField({
//     Key? key,
//     required this.textEditingController,
//   }) : super(key: key);

//   final TextEditingController textEditingController;

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: textEditingController,
//       textInputAction: TextInputAction.done,
//       enableSuggestions: false,
//       autocorrect: false,
//       maxLines: 1,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//           hintStyle: TextStyle(fontSize: 18.sp, color: Colors.grey),
//           contentPadding:
//               EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
//           filled: true,
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(56.r),
//             borderSide: BorderSide(
//               color: Config.primary,
//               width: 2.0,
//             ),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(56.r),
//             borderSide: BorderSide(color: Config.drawer),
//           ),
//           fillColor: Config.drawer,
//           focusColor: Config.primary,
//           hintText: 'Paste link here'),
//     );
//   }
// }
