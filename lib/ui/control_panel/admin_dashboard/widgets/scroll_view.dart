import 'package:first_project/ui/control_panel/admin_dashboard/controller/controller.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/widgets/app_bar.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/widgets/empty_movies_view.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/widgets/library_list.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/widgets/section_label.dart';
import 'package:first_project/ui/control_panel/admin_dashboard/widgets/stat_card.dart';
import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class DashboardScrollView extends StatelessWidget {
  const DashboardScrollView({super.key, 
    required this.userId,
    required this.controller,
  });

  final String userId;
  final AdminDashboardController controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AdminSliverAppBar(userId: userId),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 100),
          sliver: SliverToBoxAdapter(
            child: ValueListenableBuilder<List<SignUpModel>>(
              valueListenable: usersDetails,
              builder: (context, users, _) {
                return ValueListenableBuilder<List<MovieModel>>(
                  valueListenable: movieDetailes,
                  builder: (context, movies, _) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      
                        const DashboardSectionLabel('Dashboard Overview'),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: StatCard(
                                icon: Icons.movie_creation_outlined,
                                count: '${movies.length}',
                                label: 'Total Movies',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: StatCard(
                                icon: Icons.people_alt_outlined,
                                count: '${users.length}',
                                label: 'Active Users',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),

                      
                        const DashboardSectionLabel('Movies Library'),
                        const SizedBox(height: 12),
                        if (movies.isEmpty)
                          EmptyMoviesView()
                        else
                          MovieLibraryList(
                            movies: movies,
                            userId: userId,
                            controller: controller,
                          ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
