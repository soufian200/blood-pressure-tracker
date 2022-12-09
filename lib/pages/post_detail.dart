import 'package:bptracker/models/post_model.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_card.dart';
import 'package:bptracker/widgets/app_container.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class PostsDetail extends StatelessWidget {
  const PostsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostModel post = Get.arguments["post"];
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            padding: EdgeInsets.all(6.r),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(40.r),
              onTap: () {
                Get.back();
              },
              child: Ink(
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 40.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          toolbarHeight: 78.h,
          title: Text(
            "Details",
            style: TextStyle(fontSize: 32.sp, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primary,
        ),
        body: AppContainer(
            child: SizedBox(
          width: .9.sw,
          child: Column(children: [
            AppTitle(
              txt: post.title,
              maxLine: 3,
              fontSize: 28.sp,
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10.h),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: post.content,
              ),
            ),
            SizedBox(height: 10.h),
            AppTitle(
              txt: "Source: health.clevelandclinic.org",
              fontSize: 15.sp,
              color: Colors.grey,
            ),
            SizedBox(height: 10.h),
          ]),
        )));
  }
}
