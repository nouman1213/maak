import 'package:flutter/material.dart';
import 'package:maak_prject/Screens/Const/colors.dart';
import 'package:maak_prject/Screens/Home/services.dart';

import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../AppProviders/appProvider.dart';
import '../Account/profile.dart';
import '../Const/images.dart';
import 'Booking/booking.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  static final List<Widget> _widgetOptions = <Widget>[
    const ServicesScreen(),
    const BookingScreen(),
    const ProfileScreen()
  ];

  void _onItemTapped(int index) {
    print(index);
    var appPro = Provider.of<AppProvider>(context, listen: false);
    setState(() {
      appPro.setBottomIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Consumer<AppProvider>(builder: (context, appPro, _) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Center(
            child: _widgetOptions.elementAt(appPro.selectedIndex!),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  height: 4.h,
                  width: 4.h,
                  child: Image.asset(
                    servicesIcon,
                    color: appPro.selectedIndex! == 0
                        ? kPrimaryOrange
                        : Colors.grey,
                  ),
                ),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 4.h,
                  width: 4.h,
                  child: Image.asset(
                    bookingIcon,
                    color: appPro.selectedIndex! == 1
                        ? kPrimaryOrange
                        : Colors.grey,
                  ),
                ),
                label: 'Booking',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 4.h,
                  width: 4.h,
                  child: Image.asset(
                    accountIcon,
                    color: appPro.selectedIndex! == 2
                        ? kPrimaryOrange
                        : Colors.grey,
                  ),
                ),
                label: 'Account',
              ),
            ],
            currentIndex: appPro.selectedIndex!,
            selectedItemColor: kPrimaryOrange,
            onTap: _onItemTapped,
          ),
        );
      }),
    );
  }
}
