import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sspos/screens/login_with_email.dart';
import 'package:provider/provider.dart' as pro;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  getPaypalInfo();
    // Subscription.getUserLimitsData(context: context,wannaShowMsg: true);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        title: '7SSPOS',
        theme: ThemeData(fontFamily: 'Display'),
        //   onGenerateRoute: generateRoute,
        initialRoute: '/',
        routes: {
          '/': (context) => const LogInEmail(isEmailLogin: true, panelName: ''),
          // '/': (context) => const MtHomeScreen(),
          // MtHomeScreen.route: (context) => const MtHomeScreen(),
          // PosSale.route: (context) => const PosSale(),
          // Purchase.route: (context) => const Purchase(),
          // Product.route: (context) => const Product(),
          // SupplierList.route: (context) => const SupplierList(),
          // CustomerList.route: (context) => const CustomerList(),
          // ExpensesList.route: (context) => const ExpensesList(),
          // LanguageScreen.route: (context) => const LanguageScreen(),
          // IncomeList.route: (context) => const IncomeList(),
          // NewExpense.route: (context) => const NewExpense(),
          // NewIncome.route: (context) => const NewIncome(),
          // UserRoleScreen.route: (context) => const UserRoleScreen(),
          // Reports.route: (context) => Reports(
          //     name:
          //         ModalRoute.of(context)!.settings.arguments.toString()),
          // // PricingPage.route: (context) =>  PricingPage(),
          // PaymentSuccess.route: (context) => const PaymentSuccess(),
          // PaymentCancel.route: (context) => const PaymentCancel(),
          // SaleList.route: (context) => const SaleList(),
          // QuotationList.route: (context) => const QuotationList(),
          // PurchaseList.route: (context) => const PurchaseList(),
          // // LogIn.route: (context) => const LogIn(),
          // ForgotPassword.route: (context) => const ForgotPassword(),
          // SignUp.route: (context) => const SignUp(),
          // TabletLogIn.route: (context) => const TabletLogIn(),
          // TabletSignUp.route: (context) => const TabletSignUp(),
          // DailyTransactionScreen.route: (context) =>
          //     const DailyTransactionScreen(),

          // //Tablet
          // TablateHome.route: (context) => const TablateHome(),
          // TabletProductScreen.route: (context) =>
          //     const TabletProductScreen(),
          // TabletAddProduct.route: (context) => const TabletAddProduct(),
          // LedgerScreen.route: (context) => const LedgerScreen(),
          // LossProfitScreen.route: (context) => const LossProfitScreen(),
          // DueList.route: (context) => const DueList(),
          // SubscriptionPage.route: (context) => const SubscriptionPage(),
        } // TabletSaleReport.route: (context) => const TabletSaleReport(),
        );
  }
}
