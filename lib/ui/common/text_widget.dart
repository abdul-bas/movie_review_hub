
import 'package:first_project/core/theme/app_colors.dart';
import 'package:flutter/material.dart';



class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.bold,
      this.color,
      this.size,
      this.style,
      this.paddingH,
      this.paddingV,
      this.alignment,
      this.letterHeight,
      TextAlign? textAlign,
      this.shadow,
      
     
     });

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? bold;
  final FontStyle? style;
  final double? paddingH;
  final double? paddingV;
  final TextAlign? alignment;
  final double? letterHeight;
  final bool? shadow;
  
 
 
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: paddingV != null ? screenHeight * paddingV! : 0.0,
        horizontal: paddingH != null ? screenWidth * paddingH! : 0.0,
      ),
      child: Text.rich(overflow: null,maxLines: null,
       
        
        TextSpan(
          text: text,
          style: TextStyle(overflow: null,
            
            height: letterHeight,
            color: color ??AppColors. textWeight,
            fontSize: size,
            fontWeight: bold,
            fontStyle: style,
            shadows: shadow != null
                ? [
                    Shadow(
                        offset: const Offset(3.0, 5.0),
                        blurRadius: 3.0, // Blur effect
                        color:AppColors. textBlack),
                  ]
                : [],
          ),
        ),
        textAlign: alignment ?? TextAlign.center,
      ),
    );
  }
}

class TextNormalWidget extends StatelessWidget {
  const TextNormalWidget(
      {super.key,
      required this.text,
      this.bold,
      this.color,
      this.size,
      this.style,
      this.paddingH,
      this.paddingV,
      this.alignment,
      this.letterHeight,
      TextAlign? textAlign,
      this.shadow,
      this.fit,
      this.overflow,
      this.maxLines});
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? bold;
  final FontStyle? style;
  final double? paddingH;
  final double? paddingV;
  final TextAlign? alignment;
  final double? letterHeight;
  final bool? shadow;
  final dynamic fit;
  final dynamic overflow;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_in_if_null_operators
    return Text( maxLines:maxLines??1,overflow: overflow??null,
         text,
        style: TextStyle(
          // ignore: unnecessary_null_in_if_null_operators
          overflow: overflow ?? null,
          height: letterHeight,
          color: color ??AppColors. textWeight,
          fontSize: size,
          fontWeight: bold,
          fontStyle: style,
          shadows: shadow != null
              ? [
                  Shadow(
                      offset: const Offset(3.0, 5.0),
                      blurRadius: 3.0, // Blur effect
                      color:AppColors. textBlack),
                ]
              : [],
        ));
  }
}

