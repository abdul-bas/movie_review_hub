import 'package:first_project/core/theme/app_colors.dart';
import 'package:first_project/ui/movie_deteals/movie_details.dart';
import 'package:first_project/core/database/movie_oprations/search.dart';
import 'package:first_project/model/movie_model.dart';
import 'package:first_project/ui/common/container_widget.dart';
import 'package:first_project/ui/common/text_widget.dart';
import 'package:first_project/routes/center_push.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
   const SearchScreen({super.key, required this.userId});
  final String userId;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      suggestionFunction();
      initHiveBox();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double measure = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.fromLTRB(
                  AppColors.space16,
                  AppColors.space12,
                  AppColors.space16,
                  AppColors.space4,
                ),
                child: Text(
                  'Search',
                  style:  TextStyle(
                    color: AppColors.onSurface,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.4,
                  ),
                ),
              ),
               SizedBox(height: AppColors.space12),
              Padding(
                padding:
                     EdgeInsets.symmetric(horizontal: AppColors.space16),
                child: TextField(
                  controller: controller,
                  style:
                       TextStyle(color: AppColors.onSurface, fontSize: 14),
                  cursorColor: AppColors.accent,
                  onChanged: (value) => searchFunction(text: value),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.surface,
                    hintText: 'Search movies, genres, actors…',
                    hintStyle:  TextStyle(
                      color: AppColors.onSurfaceSubtle,
                      fontSize: 14,
                    ),
                    prefixIcon:  Icon(
                      Icons.search_rounded,
                      color: AppColors.onSurfaceSubtle,
                    ),
                    suffixIcon: ValueListenableBuilder(
                      valueListenable: controller,
                      builder: (context, value, child) {
                        if (value.text.isEmpty) return  SizedBox.shrink();
                        return IconButton(
                          icon:  Icon(Icons.close_rounded,
                              color: AppColors.onSurfaceSubtle, size: 20),
                          onPressed: () {
                            controller.clear();
                            searchFunction(text: '');
                          },
                        );
                      },
                    ),
                    contentPadding:  EdgeInsets.symmetric(vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:  BorderSide(color: AppColors.border),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:  BorderSide(color: AppColors.border),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:  BorderSide(
                          color: AppColors.inputFocusedBorder, width: 1.5),
                    ),
                  ),
                ),
              ),
             
          ValueListenableBuilder(
            valueListenable: movies,
            builder: (context, List<MovieModel> movie, child) {
              if (movie.isEmpty) {
                  return SizedBox(
                    height: 300,
                    child: Center(
                      child: Text(
                        'No movies found',
                        style: TextStyle(color:AppColors. textWeight),
                      ),
                    ),
                  );
                }
                
              return ValueListenableBuilder(
                  valueListenable: suggestions,
                  builder: (context, value, child) {
                  
                    final rows = rowsFunction(value, controller);
                    if (rows.isEmpty) return  SizedBox.shrink();
                  
                    return Padding(
                      padding:  EdgeInsets.fromLTRB(
                        AppColors.space16,
                        AppColors.space16,
                        AppColors.space16,
                        AppColors.space4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Suggestions',
                            style: TextStyle(
                              color: AppColors.onSurfaceSubtle,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.4,
                            ),
                          ),
                           SizedBox(height: AppColors.space8),
                          ...rows,
                      ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: movie.length,
              padding:  EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                final model = movie[index];
                return Padding(
                  padding:  EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: ContainerWidget(
                    onTap: () => navigateFromCenter(
                        context: context,
                        navigation: MovieDetailsScreen(
                          id: model.id!,
                          userId: widget.userId,
                          url: model.link,
                        )),
                    paddingH: 0.007,
                    radius: 10,
                    height: 0.08,
                    child: Row(
                      children: [
                         SizedBox(width: 8),
                        Icon(
                          Icons.history,
                          color:AppColors. textWeight,
                        ),
                         SizedBox(width: 15),
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
                         SizedBox(width: 8),
                        Transform.rotate(
                          angle: 7.14,
                          child: Icon(
                            Icons.arrow_back,
                            color:AppColors. textWeight,
                          ),
                        ),
                         SizedBox(width: 8),
                      ],
                    ),
                  ),
                );
              },
            )  ],
                      ),
                    );
                  },
                );
            }
          ),
            
            ],
          ),
        ),
      ),
    );
  }
}
