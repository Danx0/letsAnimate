import 'package:auto_route/auto_route.dart';
import 'package:lets_animate/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ImplicitRoute.page),
        AutoRoute(page: ExplicitRoute.page),
        AutoRoute(page: HeroRoute.page),
        AutoRoute(page: ContainerTransformRoute.page),
      ];
}
