class OnboardingData {
  final String title;
  final String description;
  final String imageSrc;

  OnboardingData({
    this.title = '',
    this.description = '',
    this.imageSrc = '',
  });
}

List<OnboardingData> onboardingData = [
  OnboardingData(
    title: 'Manage your tasks',
    description:'You can easily manage all of your daily tasks with DoTick',
    imageSrc: 'assets/images/frameone.jpg',
  ),
  OnboardingData(
    title: 'Create daily routine',
    description:
        'In DoTick you can create your personalized routine to stay productive',
    imageSrc: 'assets/images/frametwo.jpg',
  ),
  OnboardingData(
    title: 'Organize your tasks',
    description:
        'You can organize your daily tasks by adding your tasks into separate categories',
    imageSrc: 'assets/icons/check.jpg',
  ),
];
