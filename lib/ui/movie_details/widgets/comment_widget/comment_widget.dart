import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/movie_details/controller/movie_controller.dart';
import 'package:first_project/core/database/auth/get_user_db.dart';
import 'package:first_project/core/database/movie_oprations/date_and_time.dart';
import 'package:first_project/core/database/movie_oprations/get_movie.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/model/sign_up_model.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
   const CommentWidget({
    super.key,
    required this.height,
    required this.isVisible,
    required this.usermodel,
    required this.movieModel,
    required this.controller,
  });

  final double height;
  final ValueNotifier<bool> isVisible;
  final SignUpModel usermodel;
  final TextEditingController controller;
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Text(
                'Comments',
                style: TextStyle(
                  color: AppColors.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Material(
                color: Colors.transparent,
                shape:  CircleBorder(),
                child: InkWell(
                  customBorder:  CircleBorder(),
                  onTap: () => isVisible.value = true,
                  child:  Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(Icons.close_rounded,
                        color: AppColors.onSurfaceSubtle, size: 20),
                  ),
                ),
              ),
            ],
          ),
           SizedBox(height: AppColors.space8),
           Divider(color: AppColors.divider, height: 1),
           SizedBox(height: AppColors.space12),

       
          SizedBox(
            height: height * 0.5,
            child: movieModel.comment != null && movieModel.comment!.isNotEmpty
                ? ValueListenableBuilder(
      valueListenable: usersDetails,
      builder: (context, user, child) {
        return ValueListenableBuilder(
          valueListenable: movieDetailes,
          builder: (context, movie, child) {
            final movieMatches = movie.where((e) => e.id == movieModel.id);
            if (movieMatches.isEmpty) return  SizedBox.shrink();
            final moviData = movieMatches.first;

            final commentCount = moviData.comment?.length ?? 0;
            final itemCount =
               (commentCount > 0 ? 1 : 0);

            return ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: itemCount,
              separatorBuilder: (_, __) =>
                   SizedBox(height: AppColors.space12),
              itemBuilder: (context, index) {
                final commenterId = moviData.userId?[index];
                final matches = user.where((e) => e.id == commenterId);
                if (matches.isEmpty) return  SizedBox.shrink();
                final signUpModel = matches.first;

                final commentMap = moviData.comment![index];
                final commentText = commentMap['comment'] ?? '';
                final timestamp = commentMap['timestamp'] ?? '';

                return Padding(
                  padding:
                       EdgeInsets.symmetric(horizontal: AppColors.space4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.avatarFallback,
                        child: Text(
                          signUpModel.fullName.isNotEmpty
                              ? signUpModel.fullName[0].toUpperCase()
                              : '?',
                          style:  TextStyle(
                              color: AppColors.avatarIcon, fontSize: 13),
                        ),
                      ),
                       SizedBox(width: AppColors.space12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    signUpModel.fullName,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:  TextStyle(
                                      color: AppColors.onSurface,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                Text(
                                  formatDateOnly(timestamp),
                                  style:  TextStyle(
                                    color: AppColors.onSurfaceSubtle,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                             SizedBox(height: 4),
                            Text(
                              commentText,
                              style:  TextStyle(
                                color: AppColors.onSurface,
                                fontSize: 13,
                                height: 1.35,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    )
                :  Center(
                    child: Text(
                      'No comments yet — be the first to comment',
                      style: TextStyle(color: AppColors.onSurfaceSubtle),
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),

           SizedBox(height: AppColors.space16),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.avatarFallback,
                child: Text(
                  usermodel.fullName.isNotEmpty
                      ? usermodel.fullName[0].toUpperCase()
                      : '?',
                  style:  TextStyle(
                      color: AppColors.avatarIcon, fontSize: 14),
                ),
              ),
               SizedBox(width: AppColors.space12),
              Expanded(
                child: TextField(
                  controller: controller,
                  style:  TextStyle(
                      color: AppColors.onSurface, fontSize: 14),
                  cursorColor: AppColors.accent,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: AppColors.inputFill,
                    hintText: 'Add a comment…',
                    hintStyle:  TextStyle(
                      color: AppColors.onSurfaceSubtle,
                      fontSize: 13,
                    ),
                    contentPadding:  EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
               SizedBox(width: AppColors.space8),
              Material(
                color: AppColors.accent,
                shape:  CircleBorder(),
                child: InkWell(
                  customBorder:  CircleBorder(),
                  onTap:()=> MovieController.submitComment(controller,usermodel,movieModel),
                  child:  Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.send_rounded,
                        color: Colors.white, size: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}