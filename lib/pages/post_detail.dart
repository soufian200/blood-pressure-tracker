import 'package:bptracker/models/post_model.dart';
import 'package:bptracker/utils/admob_ads_manager.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_card.dart';
import 'package:bptracker/widgets/app_container.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class PostsDetail extends StatefulWidget {
  const PostsDetail({Key? key}) : super(key: key);

  @override
  State<PostsDetail> createState() => _PostsDetailState();
}

class _PostsDetailState extends State<PostsDetail> {
  ///
  late AdmobAdsManager admobAdsManager;
  bool bannerLoaded = false;
  @override
  void initState() {
    admobAdsManager = AdmobAdsManager();
    admobAdsManager.loadBannerAd((val) {
      setState(() {
        bannerLoaded = val;
      });
    });
    admobAdsManager.loadIntertitialAd();
    super.initState();
  }

  @override
  void dispose() {
    admobAdsManager.disposeBannerAd();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    PostModel post = Get.arguments["post"];
    return Scaffold(
        bottomNavigationBar:
            bannerLoaded ? admobAdsManager.getBannerAd() : const SizedBox(),
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
