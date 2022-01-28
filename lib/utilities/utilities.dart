class Utilities {
  static double get padding => 16;
  static double get borderRadius => 16;
  static String get demoParagraph =>
      'Lahore - Search For Relevant Info & Results. Get Results from Multiple Engines. Get Results for Content Writing Services Usa. Find Quick Results from Multiple Sources. Discover us now! Easy Acces To Information. Simple in use. Multiple sources combined. All the Answers. Lahore - Search For Relevant Info & Results. Get Results from Multiple Engines. Get Results for Content Writing Services Usa. Find Quick Results from Multiple Sources. Discover us now! Easy Acces To Information. Simple in use. Multiple sources combined. All the Answers.';
  static String getGreetingsText() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }
}