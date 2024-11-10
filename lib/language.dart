// import 'package:flutter/material.dart';
//
// class LanguageSelectionPage extends StatelessWidget {
//   const LanguageSelectionPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(AppLocalizations.of(context)!.selectLanguage),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 _changeLanguage(context, const Locale('uz'));
//               },
//               child: const Text('Oʻzbekcha'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _changeLanguage(context, const Locale('ru'));
//               },
//               child: const Text('Русский'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _changeLanguage(context, const Locale('en'));
//               },
//               child: const Text('English'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _changeLanguage(BuildContext context, Locale locale) {
//     MyApp.of(context)?.setLocale(locale);
//   }
// }
