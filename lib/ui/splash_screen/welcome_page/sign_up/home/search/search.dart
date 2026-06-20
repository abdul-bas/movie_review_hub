import 'package:first_project/depending_data/depending_colors.dart';
import 'package:first_project/depending_data/navigations.dart';
import 'package:first_project/file_structure/ui/common/icon_button.dart';
import 'package:first_project/function/hive_functions/movie_add_functions/search.dart';
import 'package:first_project/function/pop_up.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/file_structure/ui/auth/welcome_screen/Welcome_Page.dart';
import 'package:first_project/file_structure/ui/home/home_page.dart';
import 'package:first_project/ui/splash_screen/welcome_page/sign_up/home/pages/movie_deteals/movie_deteals.dart';
import 'package:first_project/widget/container_widget.dart';
import 'package:first_project/widget/text_widget.dart';
import 'package:flutter/material.dart';


class Search extends StatelessWidget {
  Search({super.key, required this.userId});
  final TextEditingController controller = TextEditingController();
  final String userId;

  @override
  Widget build(BuildContext context) {
    suggestionFunction();
    initHiveBox();

    final double measure = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: bagroundBlack,
      body: Column(
        children: [
          const SizedBox(height: 15),
          // Search Field
          SafeArea(
            child: TextFormFieldWidget(textColor: textBlack,
              controller: controller,
              filled: true,
              filledColor: textWeight,
              hint: 'Search',
              prefixicon: Icons.search,
              radius: 23,
              paddingH: 0.05,
              // Fix: Properly handle onChanged
              onChanged:(value)=> searchFunction(text: value) 
            ),
          ),
          // Suggestions
          ValueListenableBuilder(
            valueListenable: suggestions,
            builder: (context, value, child) => Column(
              children: rowsFunction(value, controller),
            ),
          ),
          // Movie List
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: movies,
              builder: (context, List<MovieModel> movie, child) {
                if (movie.isEmpty) {
                  return  Center(
                    child: Text(
                      'No movies found',
                      style: TextStyle(color: textWeight),
                    ),
                  );
                }
                
                return ListView.builder(shrinkWrap: true,
                  itemCount: movie.length,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemBuilder: (context, index) {
                    final model = movie[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: ContainerWidget(onTap: () => navigateFromCenter(context: context, navigation: MovieDeteals(id:model.id!, userId: userId,url: model.link,)),
                        paddingH: 0.007,
                        radius: 10,
                        height: 0.08,
                        child: Row(
                          children: [
                            const SizedBox(width: 8),
                       Icon(
                              Icons.history,
                              color: textWeight,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: measure * 0.5,
                                    ),
                                    child: TextNormalWidget(
                                      text: model.tittle,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ContainerWidget(
                              height: 0.05,
                              width: 0.3,
                              fileImage: model.movieImages[0],
                            ),
                            const SizedBox(width: 8),
                            Transform.rotate(
                              angle: 7.14,
                              child:  Icon(
                                Icons.arrow_back,
                                color: textWeight,
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}




class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.controller,
      this.function,
      this.paddinV,
      this.paddingH,
      this.height});

  final TextEditingController? controller;
  final Function(String value)? function;
  final double? paddinV;
  final double? paddingH;
  final num? height;

  @override
  Widget build(BuildContext context) {
    final double mesure = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: mesure * (height ?? 0.065),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mesure * (paddingH ?? 0),
            vertical: mesure * (paddinV ?? 0)),
        child: TextField(
          controller: controller,
          onChanged: (value) {
            if (function != null) {
              function!(value);
            }
          },
          decoration: InputDecoration(
              hintText: 'Search',
              suffix: IconButtonWidget(
                  icon: Icons.close,
                  color: opendecityBlack,
                  function: () => popUp(context)),
              filled: true,
              fillColor: textWeight,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(mesure * 0.025))),
        ),
      ),
    );
  }
}
