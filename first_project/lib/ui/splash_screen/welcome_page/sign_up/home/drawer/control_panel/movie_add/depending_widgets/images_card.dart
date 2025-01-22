import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/function/image_picker.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/home_page.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class PickingMovieImagesWidget extends StatelessWidget {
  const PickingMovieImagesWidget(
      {super.key,
      required this.movieImages,
      required this.height,
      required this.width,
      required this.imagePicker,
      this.function});

  final ValueNotifier<List<String>>? movieImages;
  final double height;
  final double width;
  final ImagePicker imagePicker;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: movieImages!,
        builder: (_, value, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final smallScreen = constraints.maxWidth < 600;
              return ContainerWidget(
                border: true,
                borderColor: opendcityWhite,
                radius: 15,
                paddingH: smallScreen ? 0.01 : 0.06,
                height: smallScreen ? 0.17 : 0.25,
                child: Card(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.1),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                       final smallScreen = constraints.maxWidth < 600;
                      return ContainerWidget(
                        paddingV: smallScreen?width * 0.00006:0.009,
                        paddingH:smallScreen? 0.001:0.01,
                        height:smallScreen? 0.16:1,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: movieImages!.value.length + 1,
                            itemBuilder: (context, index) {
                              return ContainerWidget(
                                border: true,
                                borderColor: opendcityWhite,
                                paddingH:
                                    smallScreen ? height * 0.000008 : 0.01,
                                color: bagroundBlack,
                                radius: height * 0.02,
                                fileImage:
                                    index != movieImages!.value.length
                                        ? value[index]
                                        : null,
                                width: 0.35,
                                height: smallScreen ? 0.2 : null,
                                child: index == movieImages!.value.length
                                    ? IconButtonWidget(
                                        icon: Icons.add_photo_alternate,
                                        size: height * 0.05,
                                        function: () async {
                                          final String? movieImage =
                                              await pickImg(
                                                  imagePicker: imagePicker);
                                          if (movieImage != null) {
                                            movieImages!.value
                                                .add(movieImage);
                                            // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
                                            movieImages!.notifyListeners();
                                          }
                                        },
                                      )
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Flexible(
                                              child: Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: ContainerWidget(
                                              radius: height * 0.3,
                                              color: Colors.red,
                                              height: 0.028,
                                              width: 0.06,
                                              child: IconButtonWidget(
                                                icon: Icons.close,
                                                function: () {
                                                  movieImages!.value
                                                      .removeAt(index);
                                                  movieImages!
                                                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                                      .notifyListeners();
                                                },
                                                size: height * 0.01,
                                              ),
                                            ),
                                          )),
                                        ],
                                      ),
                              );
                            }),
                      );
                    },
                  ),
                ),
              );
            },
          );
        });
  }
}
