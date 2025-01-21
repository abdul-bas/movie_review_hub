import 'package:flutter/material.dart';
import 'package:review_hub/depending_data/depending_colors.dart';
import 'package:review_hub/depending_data/snacbar.dart';
import 'package:review_hub/function/hive_functions/movie_add_functions/delete_movie.dart';
import 'package:review_hub/function/pop_up.dart';
import 'package:review_hub/widget/text_button_widget.dart';
import 'package:review_hub/widget/text_widget.dart';


class DeleteMovie extends StatelessWidget {
  const DeleteMovie(
      {super.key, required this.movieTitle, required this.movieId});
  final dynamic movieTitle;
  final String movieId;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final width = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: bagroundBlack,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: height * 0.4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: CircleAvatar(
              
                // ignore: sort_child_properties_last
                child: Icon(
                  Icons.warning_rounded,
                  color: red,
                ),
                radius:40,
                // ignore: deprecated_member_use
                backgroundColor:  Colors.red.withOpacity(0.1),
              ),
            ),
            TextWidget(
              text: 'Delete Movie',
              size: height * 0.03,
            ),
            TextWidget(
              // ignore: unnecessary_brace_in_string_interps
              text:'Are you sure you want to delete \n "${movieTitle}"? \n This action cannot be undone.'
                  ,
              paddingH: 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButtonWidget(
                  text: 'Cancel',
                  function: () => popUp(context),
                ),
                TextButtonWidget(
                  text: 'Delete',
                  backgroundColor: red,
                  function: () {
                    deleteMovie(context: context, id: movieId);
                    SnackBarFunction(
                        context: context,
                        text: "Movie deleted successfully!",
                        color: red);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
