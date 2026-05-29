import 'package:flutter/material.dart';
import 'package:flutter_challenge/feature/offer_details/offer_details_screen_controller.dart';
import 'package:flutter_challenge/feature/shared_widget/the_button.dart';
import 'package:flutter_challenge/feature/shared_widget/the_network_image.dart';
import 'package:flutter_challenge/util/constants/app_colors.dart';
import 'package:flutter_challenge/util/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OfferDetailsScreen extends GetView<OfferDetailsScreenController> {
  const OfferDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('offer_details'.tr)),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        final offer = controller.offer.value;
        if (offer == null) {
          return Center(child: Text('error_generic'.tr));
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TheNetworkImage(imageUrl: offer.imageUrl, height: 220.h),
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(offer.title, style: Styles.boldText18()),
                          SizedBox(height: 4.h),
                          Text(offer.storeName, style: Styles.regularText14()),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Text('฿${offer.discountedPrice}',
                                  style: Styles.boldText18(color: AppColors.primary)),
                              SizedBox(width: 8.w),
                              Text('฿${offer.originalPrice}',
                                  style: Styles.regularText14().copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  )),
                              SizedBox(width: 8.w),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                decoration: BoxDecoration(
                                  color: AppColors.badgeDiscount,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text('-${offer.discountPercent}%',
                                    style: Styles.sBoldText12(color: Colors.white)),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Text('${'pickup_window'.tr}: ${offer.pickupWindow}',
                              style: Styles.regularText14()),
                          SizedBox(height: 4.h),
                          Text('${'quantity_left'.tr}: ${offer.quantityLeft}',
                              style: Styles.regularText14()),
                          SizedBox(height: 4.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: Colors.green.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text('🌱 ${offer.co2Kg} kg CO₂ saved',
                                style: Styles.sBoldText12(color: Colors.green)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Obx(() => Row(
                    children: [
                      IconButton(
                        onPressed: controller.decrement,
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text('${controller.quantity.value}',
                          style: Styles.boldText18()),
                      IconButton(
                        onPressed: controller.increment,
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  )),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TheButton(
                      label: 'add_to_bag'.tr,
                      onPressed: controller.addToBag,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}