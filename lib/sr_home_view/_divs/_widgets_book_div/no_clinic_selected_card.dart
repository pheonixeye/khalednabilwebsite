import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/exports/exports.dart';
import 'package:khalednabilwebsite/styles/styles.dart';

class NoClinicSelectedCard extends StatelessWidget {
  const NoClinicSelectedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: Styles.CARDSHAPE,
      color: Colors.grey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            context.loc.no_clinic_selected,
            style: Styles.TITLESTEXTSYTYLE(context),
          ),
        ),
      ),
    );
  }
}

class NoDaySelectedCard extends StatelessWidget {
  const NoDaySelectedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: Styles.CARDSHAPE,
      color: Colors.grey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            context.loc.no_day_selected,
            style: Styles.TITLESTEXTSYTYLE(context),
          ),
        ),
      ),
    );
  }
}

class NoDateSelectedCard extends StatelessWidget {
  const NoDateSelectedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: Styles.CARDSHAPE,
      color: Colors.grey,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            context.loc.no_date_selected,
            style: Styles.TITLESTEXTSYTYLE(context),
          ),
        ),
      ),
    );
  }
}
