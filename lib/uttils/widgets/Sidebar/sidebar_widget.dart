import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sspos/screens/home/home_screen.dart';
import 'package:sspos/uttils/constant.dart';
import 'package:sspos/uttils/widgets/constant.dart';

List<String> getTitleList({required BuildContext context}) {
  List<String> titleList = [
    "Dashboard",
    "POS Sale",
    "Purchase",
    "Product",
    "Suplaier List",
    "Customer List",
    // 'Sale List',
    // 'Quotation List',
    // 'Purchase List',
    "Due List",
    "Ledger",
    "Loss Profit",
    "Expense",
    "Income",
    "Daily Transantion",
    "Reports",
    // lang.S.of(context).subscription,
    "User Role"
  ];
  return titleList;
}

List<IconData> iconList = [
  Icons.dashboard,
  Icons.style,
  FontAwesomeIcons.cartShopping,
  FeatherIcons.package,
  FontAwesomeIcons.fileLines,
  FontAwesomeIcons.userGroup,
  // MdiIcons.scriptText,
  // Icons.featured_play_list,
  // MdiIcons.scriptText,
  Icons.list_alt,
  Icons.pie_chart,
  Icons.add_chart_outlined,
  Icons.account_balance_wallet_rounded,
  Icons.insert_chart,
  Icons.account_balance_outlined,
  FontAwesomeIcons.fileLines,
  Icons.subscriptions,
  FontAwesomeIcons.usersRectangle,
];

List<String> screenList = [
  // MtHomeScreen.route,
  // PosSale.route,
  // Purchase.route,
  // Product.route,
  // SupplierList.route,
  // CustomerList.route,
  // // SaleList.route,
  // // QuotationList.route,
  // // PurchaseList.route,
  // DueList.route,
  // LedgerScreen.route,
  // LossProfitScreen.route,
  // ExpensesList.route,
  // IncomeList.route,
  // DailyTransactionScreen.route,
  // Reports.route,
  // SubscriptionPage.route,
  // UserRoleScreen.route,
];

class SideBarWidget extends StatefulWidget {
  const SideBarWidget(
      {Key? key, required this.index, required this.isTab, this.subManu})
      : super(key: key);
  final int index;
  final bool isTab;
  final String? subManu;

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  // CurrentSubscriptionPlanRepo currentSubscriptionPlanRepo =
  //     CurrentSubscriptionPlanRepo();

  // SubscriptionModel subscriptionModel = SubscriptionModel(
  //   subscriptionName: '',
  //   subscriptionDate: DateTime.now().toString(),
  //   saleNumber: 0,
  //   purchaseNumber: 0,
  //   partiesNumber: 0,
  //   dueNumber: 0,
  //   duration: 0,
  //   products: 0,
  // );
  // void checkSubscriptionData() async {
  //   subscriptionModel =
  //       await currentSubscriptionPlanRepo.getCurrentSubscriptionPlans();

  //   setState(() {
  //     subscriptionModel;
  //   });
  // }

  List<String> titleList = [];

  @override
  void initState() {
    // checkSubscriptionData();
    super.initState();
  }

  bool firstTime = true;

  @override
  Widget build(BuildContext context) {
    titleList = getTitleList(context: context);
    return Container(
      height: context.height(),
      decoration: const BoxDecoration(color: kDarkGreyColor),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                          text: '7SS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          children: <InlineSpan>[
                            TextSpan(
                              text: 'POS',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: kYellowColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ])),
                  Text(
                    "Amjad Shopping Mall",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
              // decoration: const BoxDecoration(
              //   shape: BoxShape.circle,
              //   image: DecorationImage(
              //     image: AssetImage('images/mlogo.png'),
              //   ),
              // ),
            ),
            const Divider(
              thickness: 1.0,
              color: kGreyTextColor,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: titleList.length,
                itemBuilder: (_, i) {
                  return titleList[i] == "POS Sale" ||
                          titleList[i] == "Purchase"
                      ? saleExpandedManu(
                          selected: widget.subManu ?? '',
                          manu: titleList[i],
                          context: context)
                      : Container(
                          color: widget.index == i ? kYellowColor : null,
                          child: ListTile(
                            selectedTileColor: kBlueTextColor,
                            onTap: (() {
                              checkPermission(item: titleList[i])
                                  ? Navigator.of(context)
                                      .pushNamed(screenList[i])
                                  : EasyLoading.showError('Access Denied!');
                            }),
                            leading: Icon(iconList[i], color: kWhiteTextColor),
                            title: Text(
                              titleList[i],
                              style:
                                  kTextStyle.copyWith(color: kWhiteTextColor),
                            ),
                            trailing: const Icon(
                              FeatherIcons.chevronRight,
                              color: Colors.white,
                              size: 18.0,
                            ),
                          ),
                        ).visible(
                          !((isSubUser && titleList[i] == "User Role") ||
                              (isSubUser && titleList[i] == "Subscription")));
                }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * .50,
                height: MediaQuery.of(context).size.height * 0.1,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.green),
                // child: Row(
                //   children: [
                //     Container(
                //       decoration: BoxDecoration(border: Border.all(width: 1, color: kDarkGreyColor.withOpacity(0.3)), borderRadius: BorderRadius.circular(10)),
                //       height: 70,
                //       width: 45,
                //       child: const Center(
                //         child: Icon(
                //           FontAwesomeIcons.crown,
                //           color: kYellowColor,
                //           size: 30.0,
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 10.0),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'You are using \n${subscriptionModel.subscriptionName} Plan',
                //           style: kTextStyle.copyWith(color: kWhiteTextColor),
                //           maxLines: 3,
                //         ),
                //         Text(
                //           'Expires in ${(DateTime.parse(subscriptionModel.subscriptionDate).difference(DateTime.now()).inDays.abs() - subscriptionModel.duration).abs()} Days',
                //           style: kTextStyle.copyWith(color: kWhiteTextColor),
                //           maxLines: 3,
                //         ).visible(subscriptionModel.subscriptionName != 'Lifetime'),
                //       ],
                //     )
                //     // Row(
                //     //   mainAxisAlignment: MainAxisAlignment.end,
                //     //   children: [
                //     //     Text(
                //     //       'Upgrade On Mobile App',
                //     //       style: kTextStyle.copyWith(color: kYellowColor, fontWeight: FontWeight.bold),
                //     //     ),
                //     //     const Icon(
                //     //       FontAwesomeIcons.arrowRight,
                //     //       color: kYellowColor,
                //     //     ),
                //     //   ],
                //     // ).visible(false),
                //   ],
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget saleExpandedManu(
    {required String selected,
    required String manu,
    required BuildContext context}) {
  String selectedItems = selected;
  if (manu == "POS Sale") {
    return StatefulBuilder(builder: (context, manuSetState) {
      return ExpansionTile(
        initiallyExpanded: selectedItems == "POS Sale" ||
                selectedItems == "Sales List" ||
                selectedItems == "Quotation"
            ? true
            : false,
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: Text(
          "Sales",
          style: const TextStyle(color: Colors.white),
        ),
        leading: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ), //add icon
        childrenPadding: const EdgeInsets.only(left: 20), //children padding
        children: [
          ///_______________POS Sale_________________________________________________
          Container(
            color: selectedItems == 'Sales' ? kBlueTextColor : null,
            child: ListTile(
              leading: const Icon(
                Icons.point_of_sale_sharp,
                color: Colors.white,
              ),
              title: const Text(
                "Pos Sale",
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              onTap: () {
                manuSetState(() {
                  selectedItems = 'POS Sale';
                  // Navigator.pushNamed(context, PosSale.route);
                  // checkPermission(item: selectedItems)
                  //     ? Navigator.of(context).pushNamed(PosSale.route)
                  //     : EasyLoading.showError('Access Denied!');
                });
                //action on press
              },
            ),
          ),

          ///_______________Sales List_________________________________________________

          Container(
            color: selectedItems == 'Sales List' ? kBlueTextColor : null,
            child: ListTile(
              leading: const Icon(
                Icons.list,
                color: Colors.white,
              ),
              title: const Text(
                "Sales List",
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              onTap: () {
                manuSetState(() {
                  selectedItems = 'Sales List';
                  // Navigator.pushNamed(context, SaleList.route);
                  // checkPermission(item: selectedItems)
                  //     ? Navigator.of(context).pushNamed(SaleList.route)
                  //     : EasyLoading.showError('Access Denied!');
                });
              },
            ),
          ),

          ///_______________Quotation List_________________________________________________

          Container(
            color: selectedItems == 'Quotation List' ? kBlueTextColor : null,
            child: ListTile(
              leading: const Icon(
                Icons.list,
                color: Colors.white,
              ),
              title: const Text(
                "Quotation List",
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              onTap: () {
                manuSetState(() {
                  selectedItems = 'Quotation List';
                  // checkPermission(item: selectedItems)
                  //     ? Navigator.of(context).pushNamed(QuotationList.route)
                  //     : EasyLoading.showError('Access Denied!');
                  // Navigator.pushNamed(context, QuotationList.route);
                });
              },
            ),
          ),
          //more child menu
        ],
      );
    });
  } else {
    return StatefulBuilder(builder: (context, manuSetState) {
      return ExpansionTile(
        initiallyExpanded: selectedItems == 'Purchase List' ? true : false,
        iconColor: Colors.white,
        collapsedIconColor: Colors.white,
        title: const Text(
          "Purchase",
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ), //add icon
        childrenPadding: const EdgeInsets.only(left: 20), //children padding
        children: [
          ///_______________Purchase_________________________________________________
          Container(
            color: selectedItems == 'Purchase' ? kBlueTextColor : null,
            child: ListTile(
              leading: const Icon(
                Icons.point_of_sale_sharp,
                color: Colors.white,
              ),
              title: const Text(
                "Purchase",
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              onTap: () {
                manuSetState(() {
                  selectedItems = 'Purchase';
                  // Navigator.pushNamed(context, Purchase.route);
                  // checkPermission(item: selectedItems)
                  //     ? Navigator.of(context).pushNamed(Purchase.route)
                  //     : EasyLoading.showError('Access Denied!');
                });
                //action on press
              },
            ),
          ),

          ///_______________Purchase List_________________________________________________

          Container(
            color: selectedItems == 'Purchase List' ? kBlueTextColor : null,
            child: ListTile(
              leading: const Icon(
                Icons.list,
                color: Colors.white,
              ),
              title: const Text(
                "Purchase List",
                style: TextStyle(color: Colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_right,
                color: Colors.white,
              ),
              onTap: () {
                manuSetState(() {
                  selectedItems = 'Purchase List';
                  // checkPermission(item: selectedItems)
                  //     ? Navigator.of(context).pushNamed(PurchaseList.route)
                  //     : EasyLoading.showError('Access Denied!');
                  // Navigator.pushNamed(context, PurchaseList.route);
                });
              },
            ),
          ),

          //more child menu
        ],
      );
    });
  }
}

bool checkPermission({required String item}) {
  if (item == 'POS Sale') {
    return finalUserRoleModel.salePermission;
  } else if (item == 'Supplier List' || item == 'Customer List') {
    return finalUserRoleModel.partiesPermission;
  } else if (item == 'Purchase') {
    return finalUserRoleModel.purchasePermission;
  } else if (item == 'Product') {
    return finalUserRoleModel.productPermission;
  } else if (item == 'Due List') {
    return finalUserRoleModel.dueListPermission;
  } else if (item == 'Stock') {
    return finalUserRoleModel.stockPermission;
  } else if (item == 'Reports') {
    return finalUserRoleModel.reportsPermission;
  } else if (item == 'Sales List') {
    return finalUserRoleModel.salesListPermission;
  } else if (item == 'Purchase List') {
    return finalUserRoleModel.purchaseListPermission;
  } else if (item == 'Loss/Profit') {
    return finalUserRoleModel.lossProfitPermission;
  } else if (item == 'Expenses') {
    return finalUserRoleModel.addExpensePermission;
  } else if (item == 'Ledger') {
    return finalUserRoleModel.ledgerPermission;
  } else if (item == 'Income') {
    return finalUserRoleModel.incomePermission;
  } else if (item == 'Daily Transaction') {
    return finalUserRoleModel.dailyTransActionPermission;
  }
  return true;
}
