class OnboardingModel {
  final String title;
  final String description;
  final String image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

final List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    title: "The Best Social Media\n App of the Century",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et   dolore magna aliqua.",
    image: "assets/png/onboard1.png",
  ),
  OnboardingModel(
    title: "Let's Connect with Everyone in the World",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    image: "assets/png/onboard2.png",
  ),
  OnboardingModel(
    title: "Everything You Can Doin the App",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    image: "assets/png/onboard3.png",
  ),
];
