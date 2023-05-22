import 'package:flutter/material.dart';
import 'package:lendyv1/pages/investor/investor_home_page.dart';

class InvestorRoot extends StatefulWidget {
  const InvestorRoot({super.key});

  @override
  State<InvestorRoot> createState() => _InvestorRootState();
}

class _InvestorRootState extends State<InvestorRoot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: InvestorHomePage()),
    );
  }
}
