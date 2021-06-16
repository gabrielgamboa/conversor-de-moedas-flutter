import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final HomeController homeController = HomeController(toText: toText, fromText: fromText);

  test('Deve converter de Real para Dólar', () {
    fromText.text = '2.0';
    homeController.convert();
    expect(toText.text, '0.36');
  }); 
}