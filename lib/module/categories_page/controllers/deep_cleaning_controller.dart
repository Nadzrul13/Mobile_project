import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeepCleaningController extends GetxController {
  // Pilihan pair sepatu
  var pairOptions = ["Pair 1", "Pair 2", "Pair 3"].obs;
  var selectedPair = "Pair 1".obs;

  // Pilihan tanggal
  var selectedDate = "Pilih Tanggal".obs;

  // Harga dan biaya
  var subtotal = 50000.obs;
  var deliveryFee = 10000;
  var totalPrice = 60000.obs;

  // Method untuk memilih pair
  void onPairChanged(String? value) {
    selectedPair.value = value!;
  }

  // Method untuk memilih tanggal
  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate.toLocal().toString().split(' ')[0];
    }
  }

  // Method untuk kembali
  void onBackPressed() {
    Get.back();
  }

  // Method untuk checkout
  void checkout() {
    Get.snackbar("Checkout", "Pesanan Anda telah diproses!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
  }
}
