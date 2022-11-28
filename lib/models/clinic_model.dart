import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:khalednabilwebsite/functions/dyn_string_fns.dart';
import 'package:khalednabilwebsite/functions/time_fns.dart';
import 'package:khalednabilwebsite/providers/locale_p.dart';
import 'package:provider/provider.dart';

class Clinic extends Equatable {
  final String? id;
  final String nameEn;
  final String nameAr;
  final String govEn;
  final String govAr;
  final String distEn;
  final String distAr;
  final String addressEn;
  final String addressAr;
  final String? venueEn;
  final String? venueAr;
  final String locationEmbedLink;
  final List<Schedule> schedule;
  final List<String> offDates;
  final bool hasSpecialSchedule;
  final String? specialScheduleEn;
  final String? specialScheduleAr;

  const Clinic({
    this.id,
    required this.nameEn,
    required this.nameAr,
    required this.govEn,
    required this.govAr,
    required this.distEn,
    required this.distAr,
    required this.addressEn,
    required this.addressAr,
    required this.venueEn,
    required this.venueAr,
    required this.locationEmbedLink,
    required this.schedule,
    required this.offDates,
    required this.hasSpecialSchedule,
    required this.specialScheduleEn,
    required this.specialScheduleAr,
  });

  static Clinic fromJson(dynamic json) {
    return Clinic(
      id: json['_id'],
      nameEn: json['nameen'],
      nameAr: json['namear'],
      govEn: json['goven'],
      govAr: json['govar'],
      distEn: json['disten'],
      distAr: json['distar'],
      addressEn: json['addressen'],
      addressAr: json['addressar'],
      venueEn: json['venueen'],
      venueAr: json['venuear'],
      locationEmbedLink: json['locationembedlink'],
      schedule: Schedule.scheduleListFromJson(json['schedule']),
      offDates: stringListFromDynamic(json['offdates']),
      hasSpecialSchedule: json['hasspecialschedule'],
      specialScheduleEn: json['specialscheduleen'],
      specialScheduleAr: json['specialschedulear'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nameen': nameEn,
      'namear': nameAr,
      'goven': govEn,
      'govar': govAr,
      'disten': distEn,
      'distar': distAr,
      'addressen': addressEn,
      'addressar': addressAr,
      'venueen': venueEn,
      'venuear': venueAr,
      'locationembedlink': locationEmbedLink,
      'schedule': Schedule.scheduleListToJson(schedule),
      'offdates': offDates,
      'hasspecialschedule': hasSpecialSchedule,
      'specialscheduleen': specialScheduleEn,
      'specialschedulear': specialScheduleAr,
    };
  }

  static List<Clinic> clinicList(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => Clinic.fromJson(e)).toList();
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [id];
}

class Schedule extends Equatable {
  final int intDay;
  final String weekdayEn;
  final String weekdayAr;
  final int startHour;
  final int endHour;
  final int startMinute;
  final int endMinute;

  const Schedule({
    required this.startHour,
    required this.endHour,
    required this.startMinute,
    required this.endMinute,
    required this.intDay,
    required this.weekdayEn,
    required this.weekdayAr,
  });

  static Schedule fromJson(dynamic json) {
    return Schedule(
      intDay: json['intday'],
      weekdayEn: json['weekdayen'],
      weekdayAr: json['weekdayar'],
      startHour: json['starthour'],
      endHour: json['endhour'],
      startMinute: json['startminute'],
      endMinute: json['endminute'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'intday': intDay,
      'weekdayen': weekdayEn,
      'weekdayar': weekdayAr,
      'starthour': startHour,
      'endhour': endHour,
      'startminute': startMinute,
      'endminute': endMinute,
    };
  }

  bool isEnglish(BuildContext context) => context.read<PxLocale>().lang == 'en';

  String scheduleString(BuildContext context) => isEnglish(context)
      ? 'From ${modifyTime(startHour, startMinute, context)} To ${modifyTime(endHour, endMinute, context)}'
      : 'من ${modifyTime(startHour, startMinute, context)} حتي ${modifyTime(endHour, endMinute, context)}';
  String dayString(BuildContext context) {
    return isEnglish(context) ? weekdayEn : weekdayAr;
  }

  static List<Schedule> scheduleListFromJson(List<dynamic>? list) {
    if (list == null) return [];
    return list.map((e) => Schedule.fromJson(e)).toList();
  }

  static List<dynamic> scheduleListToJson(List<Schedule>? list) {
    if (list == null) return [];
    return list.map((e) => e.toJson()).toList();
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [intDay];
}
