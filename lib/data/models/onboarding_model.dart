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
    title: "Stay Connected Anytime",
    description: "Communicate and engage with people around the world.",
    image: "assets/png/onboard2.png",
  ),
  OnboardingModel(
    title: "Your Privacy Matters",
    description: "We ensure your data is secure and protected at all times.",
    image: "assets/png/onboard3.png",
  ),
];
