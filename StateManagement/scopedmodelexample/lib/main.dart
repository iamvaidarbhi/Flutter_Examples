import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scopedmodelexample/donationmodelscreen.dart';
import 'package:scopedmodelexample/model/donationmodel.dart';

void main() {
  runApp(MyApp());
}

DonationModel donationModel = DonationModel();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<DonationModel>(
      model: donationModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Scoped Model Demo',
        home: DonationModelScreen(),
      ),
    );
  }
}
