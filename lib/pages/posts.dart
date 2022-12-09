import 'package:bptracker/models/post_model.dart';
import 'package:bptracker/utils/colors.dart';
import 'package:bptracker/widgets/app_container.dart';
import 'package:bptracker/widgets/app_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class Posts extends StatelessWidget {
  Posts({Key? key}) : super(key: key);

  final List<PostModel> _posts = [
    PostModel(
      title: "How to lower blood pressure naturally?",
      content: [
        Para(
          txt:
              "The term “lifestyle changes” implies that you’ll need to change your entire life to bring your blood pressure down, but even small changes can go a long way — and over time, you can build up to making larger changes.",
        ),
        Para(
          txt:
              "Dr. Laffin weighs in on some of the recommended natural (non-pharmaceutical) modifications you can make to lower your blood pressure. ",
        ),
        H4(txt: "1. Eat less salt "),
        SizedBox(height: 10.h),
        Para(
          txt:
              "If you haven’t been diagnosed with hypertension, there’s debate about whether your salt intake actually impacts your blood pressure. If you’ve already been diagnosed with hypertension, though, listen up! ",
        ),
        Para(
            txt:
                "“Cutting your salt intake is probably the most important way to lower your blood pressure,” Dr. Laffin says. “In fact, studies show that a low-sodium diet has the same effect as one and a half to two blood pressure medications.” "),
        Para(
            txt:
                "The average American consumes 3,500 mg of sodium a day, which is more than double the American Heart Association (AHA) recommendation of no more than 1,500 mg (or about one teaspoon) of salt per day. Because this amount is so strict, though, Cleveland Clinic providers set the limit at 2,300 mg.  "),
        Para(
            txt:
                "“The AHA recommendation is an aspirational goal,” Dr. Laffin says. “If you can get there without changing your diet a radical amount and being miserable, that’s great — but getting to 2,300 milligrams or less can go a long way.” "),
        Para(
            txt:
                "Sodium is hidden in many foods, so avoiding it can be difficult, but it’s doable. Choosing smart salt substitutes like potassium chloride can help. It takes about 10 to 14 days to adjust to a low-sodium diet, and then some foods will begin to taste too salty for you. "),
        Para(
            txt:
                "IMPACT: Lowering your sodium intake from a whopping 3,500 mg to a much more moderate 2,300 mg should drop your blood pressure by 2 to 3 mmHg. Limiting your sodium intake to the AHA’s recommend stricter 1,500 mg a day should drop your blood pressure by 5 or 6 mmHg.   "),
        SizedBox(height: 10.h),
        H4(txt: "2. Consume more potassium"),
        SizedBox(height: 10.h),
        Para(
            txt:
                "Potassium can help lower your blood pressure because it gives your kidneys an assist in getting rid of excess sodium. And as you’ve just learned, lower sodium levels mean lower blood pressure levels.  "),
        Para(
            txt:
                "“Potassium is the inverse of sodium,” Dr. Laffin explains. “Too much sodium increases blood pressure, and too little potassium increases blood pressure.” "),
        Para(
            txt:
                "A diet that’s high in fast food, processed food, carbohydrates, potatoes and meat is a diet that’s likely to be low in potassium, which contributes to high blood pressure. Instead, try to take in 3,000 to 3,500 mg of potassium per day by eating foods like: Bananas, Tomatoes, Avocados, Cantaloupe, Carrots, Grapefruit, Kiwi..."),
        Para(
            txt:
                "If you have hypertension, increasing your potassium intake to recommended levels should drop your blood pressure by 4 to 5 mmHg."),
        SizedBox(height: 10.h),
        H4(txt: "3. Adopt the DASH diet "),
        SizedBox(height: 10.h),
        Para(
            txt:
                "The DASH diet — which stands for Dietary Approaches to Stop Hypertension — was created specifically to lower blood pressure. In fact, the research into this diet is so positive that it’s now considered one of the most important non-pharmaceutical measures for controlling hypertension. "),
        Para(
            txt:
                "“The DASH diet is a really balanced diet that’s rich in fruits, vegetables and whole grains and can be done in combination with a low-sodium diet,” Dr. Laffin says. “It can be really helpful in lowering your blood pressure, especially when you work with a dietitian or nutritionist to drill down on the basics.” "),
        Para(
            txt:
                "People who adopt the DASH diet usually meet low-sodium and high-potassium guidelines, and may lose weight, too.  "),
        Para(
            txt:
                "IMPACT: Following the DASH diet can drop systolic pressure up to 11 mmHg — and it can do it in just a few weeks. And that’s not the only major benefit: It could also lower your risk of breast cancer, colorectal cancer and metabolic syndrome. "),
        SizedBox(height: 10.h),
        H4(txt: "4. Get physical "),
        SizedBox(height: 10.h),
        Para(
            txt:
                "Darn it, desk jobs. “Being sedentary — meaning you’re not physically active — can increase blood pressure,” Dr. Laffin warns. So cue up the Olivia Newton-John because it’s time to get physical!  "),
        Para(
            txt:
                "Exercise, especially aerobic activity, is incredibly effective in reducing blood pressure. It forces your blood vessels to expand and contract, which keeps them flexible. It also increases blood flow and encourages the creation of new blood vessels, among other benefits."),
        Para(
            txt:
                "Other options include dynamic resistance exercises (like bicep curls with weights) and isometric resistance exercises (like wall push-ups). They have the potential to lower your blood pressure by 4 to 5 mmHg, but it depends on how often you do them, how many repetitions you do and, with dynamic resistance exercises, what weights you use.  "),
        Para(
            txt:
                "Doing 150 minutes of aerobic activity a week can lower blood pressure by 5 to 8 mmHg. And don’t be alarmed if you see your blood pressure rise immediately after you’ve worked out. “Blood pressure increases as we exercise, but is significantly lower following exercise,” Dr. Laffin notes. “That’s normal.” "),
        SizedBox(height: 10.h),
        H4(txt: "5. Limit alcohol use "),
        SizedBox(height: 10.h),
        Para(
            txt:
                "Drinking alcohol puts you at risk of developing high blood pressure. And if you’ve already been diagnosed with high blood pressure, alcohol may be a contributor.  "),
        Para(
            txt:
                "Dietary Guidelines for Americans defines “moderate drinking” as two drinks or less per day for men and one drink or less per day for women. But your height, weight and overall health all play a role in what’s safe for you, as an individual, so ask your healthcare provider for more personalized insight.  "),
        Para(
            txt:
                "And drinking less isn’t easy for everyone. If you’re having trouble changing your alcohol consumption habits, you may have alcohol use disorder — and help is available.  "),
        Para(
            txt:
                "If you have hypertension and regularly drink more alcohol than recommended, scaling back may drop your blood pressure by as much as 4 mmHg.  "),
        SizedBox(height: 10.h),
        H4(txt: "6. Achieve a healthy weight"),
        SizedBox(height: 10.h),
        Para(
            txt:
                "As your weight increases, so does your blood pressure, which means that losing even a few pounds can go a long way toward lowering your systolic blood pressure."),
        Para(
            txt:
                "“The fat cells that we get around our mid-section are metabolically active cells,” Dr. Laffin says. “They secrete all kinds of hormones, which ultimately raise blood pressure.”"),
        Para(
            txt:
                "Of course, it’s almost never as simple as, “Just lose weight.” Weight is a nuanced, complex topic, and lots of medical and lifestyle-related factors play a role. But here’s the thing: If you’re doing your best to follow steps one through five on this list, weight loss is likely to follow — especially if you’re working with your healthcare provider to make sure you’re doing things right."),
        Para(
            txt:
                " Every loss of 2.2 pounds should result in a drop of 1 mmHg in blood pressure. "),
      ],
      color: const Color(0xff6D67E4),
    ),
    PostModel(
        title: "How can you lower stress, anxiety and blood pressure? ",
        color: const Color(0xffFF7000),
        content: [
          Para(
              txt:
                  "We all have to deal with a certain amount of stress and anxiety, and the way we do so impacts our health."),
          Para(
              txt:
                  "“It really can come down to how someone perceives stress,” Dr. Laffin says. “Two people can be in the exact same situation, but it can be much more stressful to one than the other. Some people just deal better with stress and have healthier coping strategies or support systems.”"),
          Para(
              txt:
                  "He shares some of the ways you can lower your stress levels and get a handle on your anxiety, which can, in turn, lower your blood pressure."),
          SizedBox(height: 10.h),
          H4(txt: "1- Work it out"),
          SizedBox(height: 10.h),
          Para(
              txt:
                  "“Regular exercise is a great way to make people feel better, decrease stress levels and help them adapt to stressful situations,” Dr. Laffin says. The positive effects on your heart health are also important for your blood pressure."),
          SizedBox(height: 10.h),
          H4(txt: "2- Get enough high-quality sleep"),
          SizedBox(height: 10.h),
          Para(
              txt:
                  "Focus on both the quantity and the quality of your sleep, aiming for six to eight hours of uninterrupted sleep per night. “For stable blood pressures, you need to get about six to eight hours of uninterrupted sleep at night.”"),
          SizedBox(height: 10.h),
          H4(txt: "3- Remove stressors, when you can"),
          SizedBox(height: 10.h),
          Para(
              txt:
                  "To reduce your stress, it’s critical to try to remove some of the things that cause it. Of course, that’s easier said than done when your main stressor is your job or a family member. In these cases, additional steps, like therapy, may help you deal with your stress."),
          SizedBox(height: 10.h),
          H4(txt: "4- Maintain a heart-healthy diet"),
          SizedBox(height: 10.h),
          Para(
              txt:
                  "Foods high in salt and fat can increase your blood pressure even before you add stress and anxiety to the mix. To keep blood pressure down, try to scale way back on those foods while adding in heart-healthy, antioxidant-rich foods."),
          //   SizedBox(height: 10.h),
          // H4(txt: "3- Remove stressors, when you can"),
          // SizedBox(height: 10.h),
          // Para(txt: ""),
        ]),
    PostModel(
      title: "What can I do to manage my pulse pressure?",
      color: const Color(0xff54B435),
      content: [
        Para(
            txt:
                "Managing your pulse pressure goes hand-in-hand with taking care of your overall blood pressure. It's best if you do the following to take care of your blood pressure:"),
        SizedBox(height: 10.h),
        H4(txt: "1- Get a yearly checkup."),
        SizedBox(height: 10.h),
        Para(
            txt:
                "High blood pressure and related problems usually don’t have symptoms until they’re very advanced, so a yearly checkup or physical with your provider is essential to catch problems early."),
        SizedBox(height: 10.h),
        H4(txt: "2- Eat a healthy diet."),
        SizedBox(height: 10.h),
        Para(
            txt:
                "A diet low in sodium and salt — typically under 2,300 mg of salt per day, but lower if your provider recommends it — can help you manage your blood pressure. Your primary care provider can offer suggestions on diets that fit this guideline."),
        SizedBox(height: 10.h),
        H4(txt: "3- Stay active"),
        SizedBox(height: 10.h),
        Para(
            txt:
                "Physical activity is good for your heart and your circulation."),
        SizedBox(height: 10.h),
        H4(txt: "4- Drink alcohol in moderation"),
        SizedBox(height: 10.h),
        Para(
            txt:
                "The recommended amount for women is one alcohol-containing drink per day (no more than seven per week) or two alcohol-containing drinks per day for men (no more than 14 per week). Drinking more than these recommended amounts can cause higher blood pressure."),
        SizedBox(height: 10.h),
        H4(txt: "4- Know your risks"),
        SizedBox(height: 10.h),
        Para(
            txt:
                "Tell your primary care provider if you have a family history of heart problems, high blood pressure, diabetes, or high cholesterol. Having a family history of any one of these can increase your risk for one or more of the others."),
        SizedBox(height: 10.h),
        H4(txt: "5- Take your meds"),
        SizedBox(height: 10.h),
        Para(
            txt:
                "If your doctor finds your blood pressure is higher than it should be and prescribes medication, take your medicine as directed. If you only take it when you remember to or when you've got a doctor's visit coming up, you're at risk for future problems."),
        SizedBox(height: 10.h),
        H4(txt: "6- Check yourself"),
        SizedBox(height: 10.h),
        Para(
            txt:
                "If you want to monitor your blood pressure on your own, blood pressure cuffs are available in most pharmacies or online. Taking your blood pressure regularly can help you identify if your pressure tends to be higher than it should, which you can discuss with your healthcare provider.")
      ],
    ),
    PostModel(
        title:
            "When should I call my doctor or get medical care for my blood pressure?",
        color: const Color(0xffE0144C),
        content: [
          Para(
              txt:
                  "High blood pressure doesn’t usually have symptoms until it’s dangerously high. Taking your blood pressure regularly — at least once a year during a checkup with your primary care provider — is the best way to know if you have high blood pressure. If you check your blood pressure regularly and notice you have an unusually wide (60 mmHg or more) or narrow pulse pressure (where your pulse pressure is less than one-quarter of the top blood pressure number), you should schedule an appointment with your healthcare provider to talk about it. Use the following guidelines to understand blood pressure and the various stages of hypertension:"),
          SizedBox(height: 10.h),
          H4(txt: "1- Normal"),
          SizedBox(height: 10.h),
          Para(txt: "120/80 mmHg or lower. Sometimes called “normotension.”"),
          SizedBox(height: 10.h),
          H4(txt: "2- Elevated blood pressure"),
          SizedBox(height: 10.h),
          Para(
              txt:
                  "20-129/less than 80 mmHg. This is sometimes called pre-hypertension."),
          SizedBox(height: 10.h),
          H4(txt: "3- Stage I hypertension (Mild)"),
          SizedBox(height: 10.h),
          Para(txt: "130-139/80-89 mmHg."),
          SizedBox(height: 10.h),
          H4(txt: "4- Stage II hypertension (Moderate)"),
          SizedBox(height: 10.h),
          Para(txt: "140/90 mmHg or higher."),
          SizedBox(height: 10.h),
          H4(txt: "5- Stage III hypertension (Emergency)"),
          SizedBox(height: 10.h),
          Para(
              txt:
                  "180/120 mmHg or higher with symptoms. Pressure readings and symptoms, such as chest pain or shortness of breath, at this level or higher, are a medical emergency. This is because of the life-threatening risk of stroke, aneurysm or other deadly events."),
          SizedBox(height: 10.h),
          H4(txt: "A note from Cleveland Clinic"),
          SizedBox(height: 10.h),
          Para(
              txt:
                  "Your pulse pressure is a number that can help you better understand your body and live a healthier, happier life. If you have questions about your pulse pressure, blood pressure or how any of your body systems are functioning, your primary care provider can also be a great resource. They can answer questions and direct you to other experts or sources of information. That way, you can feel better prepared for whatever comes next.")
        ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: Container(
          //   padding: EdgeInsets.all(6.r),
          //   child: InkWell(
          //     splashColor: Colors.transparent,
          //     highlightColor: Colors.grey.withOpacity(.2),
          //     borderRadius: BorderRadius.circular(40.r),
          //     onTap: () {
          //       Get.back();
          //     },
          //     child: Ink(
          //       decoration: BoxDecoration(
          //           // color: Colors.blue,
          //           borderRadius: BorderRadius.circular(40.r)),
          //       child: Center(
          //         child: Icon(
          //           Icons.arrow_back_ios,
          //           size: 40.sp,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          toolbarHeight: 78.h,
          title: Text(
            "Guides",
            style: TextStyle(fontSize: 32.sp, color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.primary,
        ),
        body: AppContainer(
            child: Column(children: [
          Container(
            height: 200.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.red.withOpacity(0.16), BlendMode.color),
                    image: const AssetImage("assets/bg-guide.jpg"),
                    fit: BoxFit.cover),
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20.r))),
          ),
          SizedBox(height: 20.h),
          ..._posts.map((post) {
            return Column(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.black.withOpacity(.2),
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () {
                    Get.toNamed("/post_detail", arguments: {"post": post});
                  },
                  child: Ink(
                    padding: EdgeInsets.all(15.r),
                    width: 1.sw,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: post.color,
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    child: AppTitle(
                      txt: post.title,
                      fontSize: 28.sp,
                      maxLine: 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            );
          }).toList()
        ])));
  }
}

class H4 extends StatelessWidget {
  H4({Key? key, required this.txt}) : super(key: key);
  String txt;

  @override
  Widget build(BuildContext context) {
    return AppTitle(
      txt: txt,
      maxLine: 2,
      fontSize: 22.sp,
      color: Colors.black.withOpacity(.7),
      fontWeight: FontWeight.bold,
    );
  }
}

class Para extends StatelessWidget {
  Para({
    Key? key,
    required this.txt,
  }) : super(key: key);
  String txt;

  final TextStyle styles = TextStyle(
    color: Colors.black.withOpacity(.7),
    fontSize: 18.sp,
    wordSpacing: 1.w,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Text(
        txt,
        style: styles,
      ),
    );
  }
}
