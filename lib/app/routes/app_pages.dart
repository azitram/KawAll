import 'package:get/get.dart';

import '../modules/bayar_chat/bindings/bayar_chat_binding.dart';
import '../modules/bayar_chat/views/bayar_chat_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/coming_soon/bindings/coming_soon_binding.dart';
import '../modules/coming_soon/views/coming_soon_view.dart';
import '../modules/course/bindings/course_binding.dart';
import '../modules/course/views/course_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dokter_chat_page/bindings/dokter_chat_page_binding.dart';
import '../modules/dokter_chat_page/views/dokter_chat_page_view.dart';
import '../modules/dokter_home/bindings/dokter_home_binding.dart';
import '../modules/dokter_home/views/dokter_home_view.dart';
import '../modules/donasi/bindings/donasi_binding.dart';
import '../modules/donasi/views/donasi_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kolak/bindings/kolak_binding.dart';
import '../modules/kolak/views/kolak_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/mentimeter/bindings/mentimeter_binding.dart';
import '../modules/mentimeter/views/mentimeter_view.dart';
import '../modules/navigation_bar/bindings/navigation_bar_binding.dart';
import '../modules/navigation_bar/views/navigation_bar_view.dart';
import '../modules/panas/bindings/panas_binding.dart';
import '../modules/panas/views/panas_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/pelaporan/bindings/pelaporan_binding.dart';
import '../modules/pelaporan/views/pelaporan_view.dart';
import '../modules/pilih_psikolog/bindings/pilih_psikolog_binding.dart';
import '../modules/pilih_psikolog/views/pilih_psikolog_view.dart';
import '../modules/profile_dokter/bindings/profile_dokter_binding.dart';
import '../modules/profile_dokter/views/profile_dokter_view.dart';
import '../modules/profile_relawan/bindings/profile_relawan_binding.dart';
import '../modules/profile_relawan/views/profile_relawan_view.dart';
import '../modules/receipt/bindings/receipt_binding.dart';
import '../modules/receipt/views/receipt_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/ticketing/bindings/ticketing_binding.dart';
import '../modules/ticketing/views/ticketing_view.dart';
import '../modules/volunteer_hiring/bindings/volunteer_hiring_binding.dart';
import '../modules/volunteer_hiring/views/volunteer_hiring_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.PILIH_PSIKOLOG,
      page: () => const PilihPsikologView(),
      binding: PilihPsikologBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION_BAR,
      page: () => const NavigationBarView(),
      binding: NavigationBarBinding(),
    ),
    GetPage(
      name: _Paths.COURSE,
      page: () => const CourseView(),
      binding: CourseBinding(),
    ),
    GetPage(
      name: _Paths.MENTIMETER,
      page: () => const MentimeterView(),
      binding: MentimeterBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.TICKETING,
      page: () => const TicketingView(),
      binding: TicketingBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_RELAWAN,
      page: () => const ProfileRelawanView(),
      binding: ProfileRelawanBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DOKTER,
      page: () => const ProfileDokterView(),
      binding: ProfileDokterBinding(),
    ),
    GetPage(
      name: _Paths.COMING_SOON,
      page: () => const ComingSoonView(),
      binding: ComingSoonBinding(),
    ),
    GetPage(
      name: _Paths.VOLUNTEER_HIRING,
      page: () => const VolunteerHiringView(),
      binding: VolunteerHiringBinding(),
    ),
    GetPage(
      name: _Paths.DOKTER_HOME,
      page: () => const DokterHomeView(),
      binding: DokterHomeBinding(),
    ),
    GetPage(
      name: _Paths.DOKTER_CHAT_PAGE,
      page: () => const DokterChatPageView(),
      binding: DokterChatPageBinding(),
    ),
    GetPage(
      name: _Paths.DONASI,
      page: () => const DonasiView(),
      binding: DonasiBinding(),
    ),
    GetPage(
      name: _Paths.KOLAK,
      page: () => const KolakView(),
      binding: KolakBinding(),
    ),
    GetPage(
      name: _Paths.PANAS,
      page: () => const PanasView(),
      binding: PanasBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PELAPORAN,
      page: () => const PelaporanView(),
      binding: PelaporanBinding(),
    ),
    GetPage(
      name: _Paths.RECEIPT,
      page: () => const ReceiptView(),
      binding: ReceiptBinding(),
    ),
    GetPage(
      name: _Paths.BAYAR_CHAT,
      page: () => const BayarChatView(),
      binding: BayarChatBinding(),
    ),
  ];
}
