import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  List<CurrencyModel>? currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  CurrencyModel? toCurrency;
  CurrencyModel? fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies![0];
    toCurrency = currencies![1];
  }

  void convert() {
    double value = double.tryParse(fromText.text) ?? 1.0;
    double returnValue = 0;

    if (toCurrency!.name == 'Real') {
      returnValue = value * fromCurrency!.real;
    } else if (toCurrency!.name == 'Dolar') {
      returnValue = value * fromCurrency!.dolar;
    } else if (toCurrency!.name == 'Euro') {
      returnValue = value * fromCurrency!.euro;
    } else if (toCurrency!.name == 'Bitcoin') {
      returnValue = value * fromCurrency!.bitcoin;
    }

    toText.text = returnValue.toStringAsFixed(2);

  }
}
