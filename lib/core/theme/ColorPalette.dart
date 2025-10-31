import 'dart:ui';

class ColorPalette {
  final bool isDarkMode;

  ColorPalette(this.isDarkMode);

  Color get primary =>
      isDarkMode ? const Color(0xFF00B3B3) : const Color(0xFF009C9C);

  // Color get primaryVariant =>
  //     isDarkMode ? const Color(0xFF008B8B) : const Color(0xFF006B6B);

  Color get background =>
      isDarkMode ? const Color(0xFF101C26) : const Color(0xFFE9F5F8);

  Color get surface =>
      isDarkMode ? const Color(0xFF182631) : const Color(0xFFFFFFFF);

  Color get textPrimary =>
      isDarkMode ? const Color(0xFFF4FAFB) : const Color(0xFF1E2D38);

  Color get textSecondary =>
      isDarkMode ? const Color(0xFFA9B8C0) : const Color(0xFF4E5C68);

  Color get divider =>
      isDarkMode ? const Color(0xFF263743) : const Color(0xFFD1E0E4);

  Color get disabledHint =>
      isDarkMode ? const Color(0xFF6A7A84) : const Color(0xFFA5B3BA);

  Color get accent => const Color(0xFFC0C0C0);

  Color get error => const Color(0xFFE57373);

  Color get success => const Color(0xFF2E8B57);

  Color get border =>
      isDarkMode ? const Color(0xFF263743) : const Color(0xFFD1E0E4);
}

/*
* 🌞 Light Mode

Price Text	#0F3F4F	Muted teal-blue — consistent with the accent.
Status (In Stock)	#009878	Greenish teal, gives freshness and energy.
Star Rating (Active)	#009C9C	Matches accent tone.
*
*
🌙 Dark Mode
Price Text	#00A0A0	Slightly bright teal to attract focus.
Status (In Stock)	#00B694	Consistent with light mode but glows more.
Star Rating (Active)	#00B3B3	Consistent accent hue.

✳️ Neutral Support Colors
Element	Color	Use
Error / Warning	#E57373	Alerts or out-of-stock labels
Success / Positive	#2E8B57	Confirmations or success messages
Silver Highlight (Premium)	#C0C0C0	Optional shimmer on luxury items
* */
