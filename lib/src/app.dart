import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'bloc/movies_provider.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MoviesProvider(
      child: MaterialApp(
        title: 'Movies!',
        onGenerateRoute: routes,
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) {
        final _bloc = MoviesProvider.of(context);
        _bloc.fetchMovies();
        return MainScreen();
      });
    } else {
      return MaterialPageRoute(builder: (context) {
        return MainScreen();
      });
    }
  }
}
