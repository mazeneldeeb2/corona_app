import 'package:corona_app/cases_widget.dart';
import 'package:corona_app/http_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class CasesWidgetsRow extends StatelessWidget {
  const CasesWidgetsRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CasesWidget(
          cases: Provider.of<HttpHelper>(context, listen: false)
              .getCountryStatsCases,
          color: kInfectedColor,
          text: "Infected",
        ),
        CasesWidget(
          cases: Provider.of<HttpHelper>(context, listen: false)
              .getCountryStatsDeaths,
          color: kDeathColor,
          text: "Death",
        ),
        CasesWidget(
          cases: Provider.of<HttpHelper>(context, listen: false)
              .getCountryStatsRecovered,
          color: kRecovercolor,
          text: "Recovered",
        )
      ],
    );
  }
}
