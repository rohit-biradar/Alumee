import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : SignUpWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : SignUpWidget(),
        ),
        FFRoute(
          name: HomeWidget.routeName,
          path: HomeWidget.routePath,
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'Home') : HomeWidget(),
        ),
        FFRoute(
          name: LoginWidget.routeName,
          path: LoginWidget.routePath,
          builder: (context, params) => LoginWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(),
        ),
        FFRoute(
          name: EmailVerificationWidget.routeName,
          path: EmailVerificationWidget.routePath,
          builder: (context, params) => EmailVerificationWidget(),
        ),
        FFRoute(
          name: ProfileEditorWidget.routeName,
          path: ProfileEditorWidget.routePath,
          builder: (context, params) => ProfileEditorWidget(),
        ),
        FFRoute(
            name: DonationWidget.routeName,
            path: DonationWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Donation')
                : NavBarPage(
                    initialPage: 'Donation',
                    page: DonationWidget(),
                  )),
        FFRoute(
          name: PaymentWidget.routeName,
          path: PaymentWidget.routePath,
          builder: (context, params) => PaymentWidget(),
        ),
        FFRoute(
            name: AlumniPageWidget.routeName,
            path: AlumniPageWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'AlumniPage')
                : NavBarPage(
                    initialPage: 'AlumniPage',
                    page: AlumniPageWidget(),
                  )),
        FFRoute(
          name: AlumniProfileWidget.routeName,
          path: AlumniProfileWidget.routePath,
          builder: (context, params) => AlumniProfileWidget(
            userProfile: params.getParam<UserRow>(
              'userProfile',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: PostOpportunityWidget.routeName,
          path: PostOpportunityWidget.routePath,
          builder: (context, params) => PostOpportunityWidget(),
        ),
        FFRoute(
          name: AdminDashboardWidget.routeName,
          path: AdminDashboardWidget.routePath,
          builder: (context, params) => AdminDashboardWidget(),
        ),
        FFRoute(
          name: HelpFeedbackWidget.routeName,
          path: HelpFeedbackWidget.routePath,
          builder: (context, params) => HelpFeedbackWidget(),
        ),
        FFRoute(
          name: SupportWidget.routeName,
          path: SupportWidget.routePath,
          builder: (context, params) => SupportWidget(),
        ),
        FFRoute(
          name: AdminStudentWidget.routeName,
          path: AdminStudentWidget.routePath,
          builder: (context, params) => AdminStudentWidget(),
        ),
        FFRoute(
          name: AdmAlumniWidget.routeName,
          path: AdmAlumniWidget.routePath,
          builder: (context, params) => AdmAlumniWidget(),
        ),
        FFRoute(
          name: AdminDonationWidget.routeName,
          path: AdminDonationWidget.routePath,
          builder: (context, params) => AdminDonationWidget(),
        ),
        FFRoute(
          name: AdminEventWidget.routeName,
          path: AdminEventWidget.routePath,
          builder: (context, params) => AdminEventWidget(),
        ),
        FFRoute(
          name: AdminOpportunityWidget.routeName,
          path: AdminOpportunityWidget.routePath,
          builder: (context, params) => AdminOpportunityWidget(),
        ),
        FFRoute(
            name: OpportunityWidget.routeName,
            path: OpportunityWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Opportunity')
                : NavBarPage(
                    initialPage: 'Opportunity',
                    page: OpportunityWidget(),
                  )),
        FFRoute(
          name: EventDetailWidget.routeName,
          path: EventDetailWidget.routePath,
          builder: (context, params) => EventDetailWidget(
            eventDetails: params.getParam<EventsRow>(
              'eventDetails',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: MentorshipProgramWidget.routeName,
          path: MentorshipProgramWidget.routePath,
          builder: (context, params) => MentorshipProgramWidget(),
        ),
        FFRoute(
            name: MessagesWidget.routeName,
            path: MessagesWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(initialPage: 'Messages')
                : NavBarPage(
                    initialPage: 'Messages',
                    page: MessagesWidget(),
                  )),
        FFRoute(
          name: ChatInterfaceWidget.routeName,
          path: ChatInterfaceWidget.routePath,
          builder: (context, params) => ChatInterfaceWidget(
            chatId: params.getParam(
              'chatId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AllEventsWidget.routeName,
          path: AllEventsWidget.routePath,
          builder: (context, params) => AllEventsWidget(
            initialTabIndex: params.getParam(
              'initialTabIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: AlumniEngagementWidget.routeName,
          path: AlumniEngagementWidget.routePath,
          builder: (context, params) => AlumniEngagementWidget(),
        ),
        FFRoute(
          name: AutoLoginPageWidget.routeName,
          path: AutoLoginPageWidget.routePath,
          builder: (context, params) => AutoLoginPageWidget(),
        ),
        FFRoute(
          name: CompleteProfileWidget.routeName,
          path: CompleteProfileWidget.routePath,
          builder: (context, params) => CompleteProfileWidget(),
        ),
        FFRoute(
          name: AdminAlumniEngagementWidget.routeName,
          path: AdminAlumniEngagementWidget.routePath,
          builder: (context, params) => AdminAlumniEngagementWidget(),
        ),
        FFRoute(
          name: AdminanalyticsWidget.routeName,
          path: AdminanalyticsWidget.routePath,
          builder: (context, params) => AdminanalyticsWidget(),
        ),
        FFRoute(
          name: TimecapsuleWidget.routeName,
          path: TimecapsuleWidget.routePath,
          builder: (context, params) => TimecapsuleWidget(),
        ),
        FFRoute(
          name: AnaWidget.routeName,
          path: AnaWidget.routePath,
          builder: (context, params) => AnaWidget(),
        ),
        FFRoute(
          name: YourTimeCapsuleWidget.routeName,
          path: YourTimeCapsuleWidget.routePath,
          builder: (context, params) => YourTimeCapsuleWidget(),
        ),
        FFRoute(
          name: StudentDirectoryWidget.routeName,
          path: StudentDirectoryWidget.routePath,
          builder: (context, params) => StudentDirectoryWidget(),
        ),
        FFRoute(
          name: AlumniDirectoryFinalWidget.routeName,
          path: AlumniDirectoryFinalWidget.routePath,
          builder: (context, params) => AlumniDirectoryFinalWidget(),
        ),
        FFRoute(
          name: EngagementDetailWidget.routeName,
          path: EngagementDetailWidget.routePath,
          builder: (context, params) => EngagementDetailWidget(
            engageDetails: params.getParam<AlumniProgramsRow>(
              'engageDetails',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: StdProblmPagetrialWidget.routeName,
          path: StdProblmPagetrialWidget.routePath,
          builder: (context, params) => StdProblmPagetrialWidget(),
        ),
        FFRoute(
          name: StdProblmDetailTrialWidget.routeName,
          path: StdProblmDetailTrialWidget.routePath,
          builder: (context, params) => StdProblmDetailTrialWidget(
            problemPost: params.getParam<ProblemPostsRow>(
              'problemPost',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: StdProblmPostTrialWidget.routeName,
          path: StdProblmPostTrialWidget.routePath,
          builder: (context, params) => StdProblmPostTrialWidget(),
        ),
        FFRoute(
          name: StdproblmPostSoluWidget.routeName,
          path: StdproblmPostSoluWidget.routePath,
          builder: (context, params) => StdproblmPostSoluWidget(
            problemDetails: params.getParam<ProblemPostsRow>(
              'problemDetails',
              ParamType.SupabaseRow,
            ),
          ),
        ),
        FFRoute(
          name: MentorshipStatusWidget.routeName,
          path: MentorshipStatusWidget.routePath,
          builder: (context, params) => MentorshipStatusWidget(),
        ),
        FFRoute(
          name: AdmAnalWidget.routeName,
          path: AdmAnalWidget.routePath,
          builder: (context, params) => AdmAnalWidget(),
        ),
        FFRoute(
          name: Admanal2Widget.routeName,
          path: Admanal2Widget.routePath,
          builder: (context, params) => Admanal2Widget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/signUp';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitDualRing(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 50.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
