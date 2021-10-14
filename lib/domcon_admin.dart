import 'package:admin/controllers/MenuController.dart';
import 'package:admin/redux/redux.dart';
import 'package:admin/repositories/conference/repository.dart';
import 'package:admin/repositories/user/repository.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/utils/constants.dart';
import 'package:admin/utils/di/di.dart';
import 'package:admin/utils/http/dio_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class DomComAdmin extends StatefulWidget {
  @override
  State<DomComAdmin> createState() => _DomComAdminState();
}

class _DomComAdminState extends State<DomComAdmin> {
  final _clientFactory = ClientFactory(
    baseUrl: 'https://condomcom-server.herokuapp.com',
    apiKey: '',
    apiPath: '/api',
  );

  late final AbstractApiUserRepository _apiUserRepository =
      ApiUserRepository(_clientFactory);

  late final AbstractApiConferenceRepository _apiConferenceRepository =
      ApiConferenceRepository(_clientFactory);

  late final Store<AppState> _appStore = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [
      AppMiddleware(),
      UserMiddleware(_apiUserRepository),
      ConferenceMiddleware(_apiConferenceRepository),
    ],
  );

  @override
  void initState() {
    Get.registerSingleton<Store<AppState>>(_appStore);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: _appStore,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DomCon Admin page',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => MenuController(),
            ),
          ],
          child: MainScreen(),
        ),
      ),
    );
  }
}
