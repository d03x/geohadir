part of 'routers.dart';

class Route extends GoRoute {
  final Function(BuildContext context, GoRouterState state) renderView;
  Route({required super.path, required this.renderView, super.name})
    : super(
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 400),
            child: renderView(context, state),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  final tween = Tween<Offset>(
                    begin: Offset(0.0, 1.0),
                    end: Offset.zero,
                  );
                  final animate = CurveTween(curve: Curves.ease);
                  return SlideTransition(
                    position: animation.drive(tween.chain(animate)),
                    child: child,
                  );
                },
          );
        },
      );
}
