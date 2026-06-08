import 'package:first_project/depending_data/depending_colors.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class Help_and_Support extends StatelessWidget {
  const Help_and_Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bagroundBlack,
        appBar: AppBar(
          backgroundColor: bagroundBlack,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(context);
              },
              icon:  Icon(
                Icons.arrow_back,
                color: textWeight,
              )),
          title: Text(
            'Help and Support'.toUpperCase(),
            style:  TextStyle(color: textWeight),
          ),
        ),
        body: ListView.builder(
            itemCount: 9,
            itemBuilder: (ctx, index) {
              if (index == 0) {
                return  Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    'Getting Help',
                    style: TextStyle(color: textWeight, fontSize: 23),
                  ),
                );
              } else if (index == 1) {
                return  Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    ' If you encounter any issues or have questions while using the app, here are some quick ways to get help:',
                    style: TextStyle(color: textWeight, fontSize: 18),
                  ),
                );
              } else if (index == 2) {
                return  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Icon(
                              Icons.circle,
                              color: textWeight,
                              size: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Frequently Asked Questions (FAQ): Check our FAQ section for answers to commonly asked questions. Whether you’re facing login issues, need help managing your watchlist, or want to understand our app’s features better, the FAQ is a great place to start.',
                              style: TextStyle(color: textWeight),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (index == 3) {
                return  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Icon(
                              Icons.circle,
                              color: textWeight,
                              size: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Tutorials and Guides: Access step-by-step tutorials and guides on using features, managing settings, and personalizing your experience within the app.',
                              style: TextStyle(color: textWeight),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (index == 4) {
                return  Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    'Contacting Support',
                    style: TextStyle(color: textWeight, fontSize: 23),
                  ),
                );
              } else if (index == 5) {
                return  Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    ' Still need assistance? Our support team is here to help! You can reach us through the following options:',
                    style: TextStyle(color: textWeight, fontSize: 18),
                  ),
                );
              } else if (index == 6) {
                return  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Icon(
                              Icons.circle,
                              color: textWeight,
                              size: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Email Support: Send us an email at [support email address]. Our team typically responds within 24 hours on business days.',
                              style: TextStyle(color: textWeight),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (index == 7) {
                return  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Icon(
                              Icons.circle,
                              color:textWeight,
                              size: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'In-App Chat: Use our in-app chat for real-time support on app features, settings, or troubleshooting common issues.',
                              style: TextStyle(color: textWeight),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return  Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Icon(
                              Icons.circle,
                              color: textWeight,
                              size: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Feedback and Suggestions: We love hearing from our users! Use the feedback option to share your thoughts, suggestions, or report issues. Your feedback helps us improve the app and bring new features to you.',
                              style: TextStyle(color: textWeight),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }));
  }
}
