import 'package:khalednabilwebsite/models/clinic_model.dart';

class Booking {
  final String? id;
  final String clinicId;
  final Schedule day;
  final String date;
  final String ptName;
  final String ptPhone;

  Booking({
    this.id,
    required this.clinicId,
    required this.day,
    required this.date,
    required this.ptName,
    required this.ptPhone,
  });

  static Booking fromJson(dynamic json) {
    return Booking(
      id: json['_id'],
      clinicId: json['clinicid'],
      day: Schedule.fromJson(json['day']),
      date: json['date'],
      ptName: json['ptname'],
      ptPhone: json['ptphone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'clinicid': clinicId,
      'day': day.toJson(),
      'date': date,
      'ptname': ptName,
      'ptphone': ptPhone,
    };
  }

  static List<Booking> bookingList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => Booking.fromJson(e)).toList();
  }
}
