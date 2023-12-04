import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/src/views/cart/cart_screen.dart';
import 'package:e_commerce_app/src/views/home/home_screen.dart';
import 'package:e_commerce_app/src/views/profile/profile_screen.dart';
import 'package:e_commerce_app/src/styles/font_size.dart';
import 'package:e_commerce_app/src/widgets/exit_alert_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class ButtonNavigationBarWidget extends StatefulWidget {
  int tabIndex = 0;
 
  ButtonNavigationBarWidget ({required this.tabIndex});

  @override
   _ButtonNavigationBarState createState() => _ButtonNavigationBarState();
}

class _ButtonNavigationBarState extends State<ButtonNavigationBarWidget> {
  _ButtonNavigationBarState();

  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  List screensWidgets = [
  const HomeScreen(),
  CartScreen(),
  UserProfileScreen()
  ];

  


  void onChangePage(){
    setState(() {
      _page=widget.tabIndex;
    });
  }






  @override
  void initState() {
    onChangePage();
    super.initState();
  }



  Widget build(BuildContext context) {
  fontSizes(context);
    return WillPopScope(
      onWillPop: () => ConfirmationAlert.exitAppAlertDialog(context),
      child: Scaffold(

        body:screensWidgets[_page],
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: _page,
          height:75.0,
          items: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const Icon(Icons.home,size:28,color:Colors.white,),
                  SizedBox(
                   width:100,
                    child: Center(
                      child: Text(
                        "Home",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500,
                          height: 1.2,
                          letterSpacing: .2,
                          color:  Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 const Icon(Icons.shopping_cart,size:28,color:Colors.white,),
                  SizedBox(
                   width:100,
                    child: Center(
                      child: Text(
                        "Cart",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500,
                          fontSize: fontSizes.sub2title,
                          height: 1.2,
                          letterSpacing: .2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                const Icon(Icons.person_2_rounded,size:28,color:Colors.white,),
                  SizedBox(
                     width:100,
                    child: Center(
                      child: Text(
                        "You",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w500,
                          fontSize: fontSizes.sub2title,
                          height: 1.2,
                          letterSpacing: .2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
           
          ],

          color: Colors.orange,
          buttonBackgroundColor: Colors.green,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }

}
