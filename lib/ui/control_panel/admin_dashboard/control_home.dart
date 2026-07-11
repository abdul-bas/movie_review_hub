import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/controller/controller.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/widgets/draggable_fab.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/widgets/scroll_view.dart';
import 'package:flutter/material.dart';

class ControlHomeScreen extends StatefulWidget {
  const ControlHomeScreen({super.key, required this.userId});

  final String userId;

  @override
  State<ControlHomeScreen> createState() => _ControlHomeScreenState();
}

class _ControlHomeScreenState extends State<ControlHomeScreen> {
  final _controller = const AdminDashboardController();
  late final ValueNotifier<Offset> _fabPosition;

  @override
  void initState() {
    super.initState();

    _fabPosition = ValueNotifier(const Offset(270, 450));
  }

  @override
  void dispose() {
    _fabPosition.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fabPosition.value = _controller.initialFabPosition(screenWidth);
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          DashboardScrollView(
            userId: widget.userId,
            controller: _controller,
          ),
          DraggableFab(
            position: _fabPosition,
            onTap: () => _controller.openAddMovie(context),
          ),
        ],
      ),
    );
  }
}
