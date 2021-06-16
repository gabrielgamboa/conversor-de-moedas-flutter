import 'package:conversor_de_moedas/app/components/currency_box.dart';
import 'package:conversor_de_moedas/app/controllers/home_controller.dart';
import 'package:conversor_de_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();

  HomeController? homeController;
  
  @override
  void initState() {
    super.initState();
    homeController = new HomeController(toText: toText, fromText: fromText);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 100, bottom: 20, left: 20, right: 20),
          child: Column(
            children: [
              Image.asset(
                'assets/images/TATAKAE.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 50,
              ),
              CurrencyBox(
                selectedItem: homeController!.fromCurrency,
                controller: fromText,
                items: homeController!.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController!.fromCurrency = model;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              CurrencyBox(
                selectedItem: homeController!.toCurrency,
                controller: toText,
                items: homeController!.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController!.toCurrency = model;
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),

              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.amber,
                onPressed: () {
                  homeController!.convert();
                },
                child: Text('CONVERTER'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
