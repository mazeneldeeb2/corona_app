import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

class HeaderContanier extends StatelessWidget {
  const HeaderContanier({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/virus.png'),
        ),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: [
            kHeaderColorBegin,
            kHeaderColorEnd,
          ],
        ),
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                SvgPicture.asset(
                  'assets/doctor.svg',
                  fit: BoxFit.fitWidth,
                  width: 230,
                  alignment: Alignment.topCenter,
                ),
                const Expanded(
                  child: Text(
                    "All you need is stay at home.",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
