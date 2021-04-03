import 'package:agriteck_user/styles/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StretchingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: primaryDark,
          expandedHeight: 300,
          stretch: true,
          onStretchTrigger: () {
            print('trigger');
            return;
          },
          stretchTriggerOffset: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Elastigirl',
              style: GoogleFonts.inconsolata(fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
              StretchMode.blurBackground,
            ],
            background: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://static0.srcdn.com/wordpress/wp-content/uploads/2018/09/Elastigirl-from-The-Incredibles.jpg?q=50&fit=crop&w=960&h=500&dpr=1.5',
                  fit: BoxFit.cover,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, 0.5),
                      end: Alignment(0.0, 0.0),
                      colors: <Color>[
                        Color(0x60000000),
                        Color(0x00000000),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([

          ]),
        )
      ],
    );
  }
}
