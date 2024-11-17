import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:my_resume/presentation/providers/theme_provider.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {

  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkmode;
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric( horizontal: size.width * 0.08 ),
      child: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        title: Text('racMart'),
        actions: [       
      
          Padding(
            padding: EdgeInsets.symmetric( horizontal: size.width * 0.005 ),
            child: Row(
              children: [
      
                IconButton(
                  icon: Icon(isDarkMode
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined),
                  onPressed: () {
                    ref.read(themeNotifierProvider.notifier).toggleDarkMode();
                  },
                ),
      
                TextButton(
                  onPressed: (){
                    context.go('/home/0');
                  },
                  child: Text("Home")
                ),
      
                TextButton(
                  onPressed: (){
                    context.go('/home/1');
                  },
                  child: Text("About me")
                ),
      
                TextButton(
                  onPressed: (){
                    context.go('/home/2');
                  },
                  child: Text("Skills")
                ),
      
                TextButton(
                  onPressed: (){
                    context.go('/home/3');
                  },
                  child: Text("My Work")
                ),
      
              ],
            ),
          ),
      
        ],
      ),
    );
  }
}