import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinik_shoes_project/module/camerapage/view/camerapage_view.dart';
import 'package:klinik_shoes_project/module/categories_page/controllers/deep_cleaning_controller.dart';

class DeepCleaningView extends StatelessWidget {
  final controller = Get.put(DeepCleaningController()); // Register controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAFBF9), // Warna latar hijau muda
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: controller.onBackPressed,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul
            const Text(
              "Deep Cleaning",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Gambar
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: const DecorationImage(
                  image: AssetImage('asset/simple_cleaning_logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Deskripsi
            const Text(
              "Jasa deep cleaning sepatu yang menyeluruh...",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // Dropdown Pair
            const Text("Choose Pair",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Obx(() => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: controller.selectedPair.value,
                      items: controller.pairOptions
                          .map((pair) => DropdownMenuItem(
                                value: pair,
                                child: Text(pair),
                              ))
                          .toList(),
                      onChanged: controller.onPairChanged,
                    ),
                  ),
                )),
            const SizedBox(height: 20),

            // Date Picker
            const Text("Pick Date",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Obx(() => InkWell(
                  onTap: () => controller.pickDate(context),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 16, color: Colors.black54),
                        const SizedBox(width: 8),
                        Text(controller.selectedDate.value),
                      ],
                    ),
                  ),
                )),
            const SizedBox(height: 20),

            // Tambah Foto
            const Text("Tambahkan Foto atau Video Sepatu",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => Get.to(() => CameraPageView()),
              icon: const Icon(Icons.camera_alt, color: Colors.white),
              label: const Text("Buka Kamera"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Harga
            Obx(() => Column(
                  children: [
                    buildPriceRow("Subtotal", controller.subtotal.value),
                    buildPriceRow("Delivery Fee", controller.deliveryFee),
                    const Divider(height: 30, thickness: 1),
                    buildPriceRow("Total Price", controller.totalPrice.value,
                        isBold: true),
                  ],
                )),
            const SizedBox(height: 20),

            // Checkout Button
            ElevatedButton.icon(
              onPressed: controller.checkout,
              icon: const Icon(Icons.attach_money, color: Colors.white),
              label: const Text("Checkout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk harga
  Widget buildPriceRow(String title, int price, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        Text("Rp. $price",
            style: TextStyle(
                fontSize: 16,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
      ],
    );
  }
}
