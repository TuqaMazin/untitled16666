import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/color.dart';
import 'package:untitled16666/choose_your_plan/choose_your_plan_screen.dart';
import '../common/constant.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // استخدام Scaffold لتجنب الشاشة الحمراء
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 16.0, // قيمة height
          horizontal: 20.0, // قيمة width
        ),
        child: Column(
          children: [
            _widgetSelectedPlan(context),
            _textBodyFocus(),
            _bodyFocusGrid(),
            _textDaily(),
            _widgetWaterTracker(),
          ],
        ),
      ),
    );
  }



  Widget _widgetSelectedPlan(BuildContext context) {
    return InkWell(
      onTap: () {
        // لم يعد هناك استدعاء للمسارات
      },
      child: SizedBox(
        height: 350.0, // قيمة ثابتة بدلاً من AppSizes.height_42
        width: 360.0, // قيمة ثابتة بدلاً من AppSizes.fullWidth
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(0.0, 2.5),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage('assets/images/lose_weight_keep.webp'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16.0,
              left: 16.0,
              child: InkWell(
                onTap: () {
                  // الانتقال إلى ChooseYourPlanScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChooseYourPlanScreen()),
                  );
                },
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/ic_homepage_change.webp'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        offset: const Offset(0.0, 2.0),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: 360.0,
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  Text(
                    "Selected Plan Name",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 12.0, top: 6.0, bottom: 6.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: LinearProgressIndicator(
                        value: 0.5,
                        minHeight: 8.0,
                        backgroundColor: Colors.white,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  Text(
                    "30 Days Left",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    width: 360.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.green,
                          Colors.lightGreen,
                        ],
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        // الانتقال إلى ChooseTargetWeightScreen عند الضغط على الزر
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  ChooseYourPlanScreen()),
                        );
                      },
                      style: ButtonStyle(
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: const BorderSide(
                              color: Colors.transparent,
                              width: 0.7,
                            ),
                          ),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Day 1",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _textBodyFocus() {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      width: double.infinity,
      child: AutoSizeText(
        "Body Focus".tr,
        textAlign: TextAlign.left,
        maxLines: 1,
        style: TextStyle(
          color: AppColor.black,
          fontSize: 19.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _bodyFocusGrid() {
    return Container(
      height: 150.0, // قيمة height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        image: DecorationImage(
          image: AssetImage('assets/images/cover_full_body.webp'), // هنا تضيف الصورة
          fit: BoxFit.cover,
          // لجعل الصورة تغطي الحاوية بالكامل
        ),
      ),
      child: InkWell(
        onTap: () {
          // هنا يمكنك إضافة المنطق الذي ترغب في تنفيذه عند الضغط على الزر
          print("Button Pressed: Full Body");
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent, // لجعل اللون الأساسي شفاف
            borderRadius: BorderRadius.circular(20.0), // ديكوريشن الحواف
          ),
          child: Center(
            child: Text(
              "Full Body",
              style: TextStyle(
                color: AppColor.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget _textDaily() {
    return Container(
      margin: EdgeInsets.only(top: 16.0, bottom: 12.0),
      width: double.infinity,
      child: AutoSizeText(
        "Daily".tr,
        textAlign: TextAlign.left,
        maxLines: 1,
        style: TextStyle(
          color: AppColor.black,
          fontSize: 19.0,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _widgetWaterTracker() {
    int currentGlass = 5; // عدد الكؤوس الحالي (مثال ثابت)
    bool isWaterTrackerOn = true; // حالة تتبع المياه (مثال ثابت)

    return Card(
      margin: const EdgeInsets.all(0.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: 360.0, // عرض البطاقة
        decoration: BoxDecoration(
          color: AppColor.cardBackgroundColor,
          borderRadius: BorderRadius.circular(12.0),
          shape: BoxShape.rectangle,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 24.0, // هوامش رأسية
          horizontal: 32.0, // هوامش أفقية
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WaterTracker".tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19.0, // حجم الخط
                      color: AppColor.black,
                    ),
                  ),
                  if (isWaterTrackerOn) ...{
                    Container(
                      margin: EdgeInsets.only(
                        top: 8.0, // مسافة من الأعلى
                        bottom: 20.0, // مسافة من الأسفل
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            currentGlass.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 21.0, // حجم الخط
                              color: AppColor.commonBlueColor,
                            ),
                          ),
                          Text(
                            "\t${"Cups".tr}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0, // حجم الخط
                              color: AppColor.txtColor666,
                            ),
                          ),
                        ],
                      ),
                    ),
                  },
                  if (!isWaterTrackerOn) ...{
                    Container(
                      margin: EdgeInsets.only(
                        top: 8.0, // مسافة من الأعلى
                        bottom: 20.0, // مسافة من الأسفل
                      ),
                      child: Text(
                        "txtWaterOffMessage".tr,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.5, // حجم الخط
                          color: AppColor.txtColor666,
                        ),
                      ),
                    ),
                  },
                  SizedBox(
                    width: double.infinity, // عرض الزر
                    child: TextButton(
                      onPressed: () {
// قم بإضافة المنطق هنا إذا كنت ترغب في تنفيذ إجراء معين عند الضغط على الزر
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            AppColor.commonBlueColor),
                        elevation: WidgetStateProperty.all(2),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            side: const BorderSide(
                              color: AppColor.transparent,
                              width: 0.7,
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0), // ارتفاع الزر
                        child: Text(
                          "Drink".tr.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 19.0, // حجم الخط
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 90.0, // ارتفاع الدائرة
              width: 90.0, // عرض الدائرة
              margin: EdgeInsets.only(left: 16.0),
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    backgroundColor: AppColor.commonBlueLightColor,
                    value: currentGlass / 8,
                    valueColor: const AlwaysStoppedAnimation(
                        AppColor.commonBlueColor),
                    strokeWidth: 4.0, // سمك الدائرة
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Image.asset(
                      Constant.getAssetIcons() + "ic_homepage_drink.webp",
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}