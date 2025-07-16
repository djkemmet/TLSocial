import 'package:flutter/services.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp(
      title: 'My App',
      home: ApplicationLanding(),
      theme: ThemeData(colorScheme: ColorSchemes.darkZinc(), radius: 0.7),
    );
  }
}

class ApplicationLanding extends StatefulWidget {
  // Constructor with key
  ApplicationLanding({super.key});

  @override
  State<ApplicationLanding> createState() => ApplicationLandingState();
}

class ApplicationLandingState extends State<ApplicationLanding> {
  int selected = 0;

  NavigationRailAlignment alignment = NavigationRailAlignment.center;
  NavigationLabelType labelType = NavigationLabelType.none;
  NavigationLabelPosition labelPosition = NavigationLabelPosition.bottom;
  bool customButtonStyle = false;
  bool expanded = false;
  bool loggedIn = false;

  NavigationItem buildButton(String label, IconData icon) {
    return NavigationItem(
      style: customButtonStyle
          ? const ButtonStyle.muted(density: ButtonDensity.icon)
          : null,
      selectedStyle: customButtonStyle
          ? const ButtonStyle.fixed(density: ButtonDensity.icon)
          : null,
      label: Text(label),
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      headers: [
        AppBar(
          title: Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
          trailing: [
            if (this.loggedIn == false)
              OutlineButton(child: Text("Login"), onPressed: () {}),
          ],
        ),
        const Divider(),
      ],

      child: Row(
        children: [
          NavigationRail(
            alignment: alignment,
            labelType: labelType,
            index: selected,
            labelPosition: labelPosition,
            expanded: expanded,
            onSelected: (index) {
              setState(() {
                selected = index;
              });
            },
            children: [
              buildButton('Home', BootstrapIcons.house),
              buildButton('Explore', BootstrapIcons.bell),
              buildButton('Library', BootstrapIcons.search),
              const NavigationWidget(child: FlutterLogo()),
              // const NavigationLabel(child: Text('Settings')),
              // buildButton('Profile', BootstrapIcons.person),
              // buildButton('App', BootstrapIcons.appIndicator),
              // const NavigationDivider(),
            ],
          ),
          const VerticalDivider(),
        ],
      ),
    );
  }
}
