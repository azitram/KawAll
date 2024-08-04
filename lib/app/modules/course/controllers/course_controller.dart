import 'package:get/get.dart';
import 'package:kaw_all/app/modules/supportsystem/supportsystem_menu/supportsystem_menu_page.dart';
import '../../allabout_sexualabuse/allabout_sexualabuse_menu/allabout_sexualabuse_menu_page.dart';
import '../../selfdefense/selfdefense_menu/selfdefense_menu_page.dart';

class CourseController extends GetxController {
  final courseList = [
    {
      'courseBackground': 'assets/images/first_course_card.png',
      'courseTitle': 'Self\nDefense',
      'courseIcon': 'assets/images/first_course_icon.png',
      'page': const SelfDefenseMenu(),
    },
    {
      'courseBackground': 'assets/images/second_course_card.png',
      'courseTitle': 'All About\nSexual Abuse',
      'courseIcon': 'assets/images/second_course_icon.png',
      'page': const AllAboutSexualAbuseMenu(),
    },
    {
      'courseBackground': 'assets/images/third_course_card.png',
      'courseTitle': 'Support\nSystem',
      'courseIcon': 'assets/images/third_course_icon.png',
      'page': const SupportSystemMenu(),
    },
  ];



}
