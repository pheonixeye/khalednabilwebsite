// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:khalednabilwebsite/api/hx_clinic.dart';
import 'package:khalednabilwebsite/models/clinic_model.dart';

class PxClinicGet extends ChangeNotifier {
  List<Clinic>? _clinics = [];
  List<Clinic>? get clinics => _clinics;

  Future fetchClinics() async {
    var c = await HxClinic.fetchAllClinics();
    _clinics = Clinic.clinicList(c);
    notifyListeners();
  }

  int _page = 0;
  int get page => _page;

  void setPage() {
    _page == _clinics!.length ? _page = 0 : _page++;
  }
}
