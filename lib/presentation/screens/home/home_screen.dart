import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:my_resume/config/utils/responsive.dart';
import 'package:my_resume/presentation/providers/theme_provider.dart';
import 'package:my_resume/presentation/screens/screens.dart';
import 'package:my_resume/presentation/widgets/custom_appbar.dart';

class HomeScreen extends ConsumerWidget {
  static const String name = 'home_screen';
  final int pageIndex;

  const HomeScreen({
    required this.pageIndex,
    super.key
  });

  final viewRoutes = const <Widget>[
    _HomeView(),
    AboutMeScreen(),
    SkillsScreen(),
    MyWorkScreen()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric( horizontal: size.width * 0.08 ),
        child: Stack(
          children: [
            
            IndexedStack(
              index: pageIndex,
              children: viewRoutes,
            ),
            
            if(Responsive.isDesktop(context))
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  height: size.height * 0.05,
                  color: Colors.greenAccent.shade400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text( 'All rights reserved' ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _HomeView extends ConsumerWidget {

  const _HomeView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkmode;
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.blue.shade500,
      height: size.height * 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      
          Container(
            width: size.width * 0.5,
            height: double.maxFinite,
            color: Colors.green.shade400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Padding(
                  padding: EdgeInsets.symmetric( vertical: size.height * 0.01 ),
                  child: Text(
                    'This is a big title',
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? size.width * 0.05 : size.width * 0.03
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric( vertical: size.height * 0.01 ),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? size.width * 0.03 : size.width * 0.015
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric( vertical: size.height * 0.01 ),
                  child: Row(
                    children: [

                      TextButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: isDarkMode ? WidgetStateProperty.all(Colors.grey.shade900) : WidgetStateProperty.all(Colors.white),
                          padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: size.width * 0.01, horizontal: size.width * 0.0125 )),
                        ),
                        child: Text(
                          'Button 1',
                          style: TextStyle(
                            fontSize: Responsive.isMobile(context) ? size.width * 0.03 : size.width * 0.015
                          ),
                        ),
                      ),

                      SizedBox( width: size.width * 0.01 ),

                      TextButton(
                        onPressed: (){},
                        style: ButtonStyle(
                          backgroundColor: isDarkMode ? WidgetStateProperty.all(Colors.grey.shade900) : WidgetStateProperty.all(Colors.white),
                          padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: size.width * 0.01, horizontal: size.width * 0.0125 )),
                        ),
                        child: Text(
                          'Button 1',
                          style: TextStyle(
                            fontSize: Responsive.isMobile(context) ? size.width * 0.03 : size.width * 0.015
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric( vertical: size.height * 0.01 ),
                  child: Text(
                    'About me ──',
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? size.width * 0.0225 : size.width * 0.01
                    ),
                  ),
                ),

              ],
            )
          ),
      
          Container(
            width: size.width * 0.28,
            height: double.maxFinite,
            color: Colors.purple.shade300,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(              
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.white,
                    width:  size.width * 0.005,
                  ),
                ),
              ),
            )
          ),
      
        ],
      ),
    );
  }
}
