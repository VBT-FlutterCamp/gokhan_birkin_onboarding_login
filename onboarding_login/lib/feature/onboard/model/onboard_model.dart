class OnboardModel {
  String image;
  String title;
  String description;
  OnboardModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardModel> onboardingModel = [
  OnboardModel(
      image: 'assets/svg/Onboard_medical.svg',
      title: 'Symptoms of Covid -19',
      description:
          'COVID-19 affects diffrent people in diffrent ways. Most infected people will develop mild to moderate illness.'),
  OnboardModel(
      image: 'assets/svg/Onboard_social_distance.svg',
      title: 'Covid-19 Information',
      description:
          'Most people who fall scik with COVID-19 will experience mild to moderate symptoms'),
  OnboardModel(
      image: 'assets/svg/Onboard_wash_hands.svg',
      title: 'Just Stay at Home',
      description:
          'Stay at home to self quarentine ourself from covid-19, hopefully everything gonna be fine soon...'),
];
