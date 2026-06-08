import 'package:first_project/depending_data/depending_colors.dart';
import 'package:flutter/material.dart';





// ignore: must_be_immutable, camel_case_types
class Privacy_and_permissions extends StatelessWidget {
  const Privacy_and_permissions({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor:bagroundBlack,
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
                'Privacy and Permissions'.toUpperCase(),
                style:  TextStyle(color:textWeight ),
              ),
            ),
            body: ListView.builder(
                itemCount: 8,
                itemBuilder: (ctx, index) {
                  if (index == 0) {
                    return  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        'In the Privacy section of your app, it’s important to reassure users about how their data and privacy are protected. Here’s a sample About App description for the Privacy section:',
                        style: TextStyle(color: textWeight, fontSize: 18),
                      ),
                    );
                  } else if (index == 1) {
                    return  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        'About This App',
                        style: TextStyle(color:textWeight , fontSize: 23),
                      ),
                    );
                  } else if (index == 2) {
                    return  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                        'Welcome to CriticHub , where we bring you a tailored movie experience with personalized recommendations, reviews, and ratings for your favorite films!We value your privacy and are committed to protecting any information you share with us. Here’s a brief overview of how we handle your data:',
                        style: TextStyle(color: textWeight, fontSize: 18),
                      ),
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                                  'Data Collection: We collect minimal information, such as preferences and watch history, only to enhance your movie recommendations and improve the app experience. We do not collect or store any personal data without your consent.',
                                  style: TextStyle(color: textWeight),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (index == 4) {
                    return  Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                                  'Permissions: The permissions we request, like access to your camera and location, are only used to enhance features within the app. For instance, location access helps us offer location-based content suggestions. All permissions are optional, and you can disable them anytime in the settings.',
                                  style: TextStyle(color: textWeight),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (index == 5) {
                    return  Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                                  'Data Sharing: We do not sell or share your data with third parties. Any data we collect is solely used to provide you with a better experience within the app.',
                                  style: TextStyle(color: textWeight),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
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
                                  'Security: We use industry-standard practices to protect your data and ensure that your information remains safe and secure.',
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
                              horizontal: 10, vertical: 5),
                          child: Text(
                              'If you have any questions about our privacy practices, please feel free to contact our support team. We are here to help and ensure you have a secure, enjoyable experience using [App Name].',
                              style: TextStyle(
                                  color: textWeight, fontSize: 18)),
                        ),
                      ],
                    );
                  }
                }));
  }
}
