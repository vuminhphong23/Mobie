import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import '../localization/locales.dart';
import '../models/Interfaces.dart';
import '../widghets/widgets_home/HomeBottomNavBar.dart';
import '../widghets/components/ForwardIcon.dart';
import '../widghets/components/SettingItems.dart';


class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  late FlutterLocalization _flutterLocalization;

  late String _currentLocale;
  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
        builder: (context, ui, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ui.appBarColor,
              title: Text(LocaleData.settings.getString(context),
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold,),),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Ionicons.chevron_back_outline),
              ),
              leadingWidth: 80,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleData.account.getString(context),
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFF5F9FD),
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF475269).withOpacity(0.3),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),

                            child: Icon(
                              Icons.person,
                              size: 45,
                              color: Color(0xFF475269),
                            ),
                          ),

                          const SizedBox(width: 20),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Admin",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "shoemaker@gmail.com",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF475269),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ForwardIcon(onTap: () {},),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleData.settings.getString(context),
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Provider.of<UserInterface>(context, listen: false).resetSettings();
                            _setLocale('en');
                          },
                          child: Text(
                            LocaleData.reset.getString(context),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purple.shade100,
                            ),
                            child: Icon(
                              Ionicons.logo_firefox,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            LocaleData.darkMode.getString(context),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            Provider
                                .of<UserInterface>(context)
                                .themeMode == ThemeMode.dark ? LocaleData.textDarkMode1.getString(context) : LocaleData.textDarkMode2.getString(context),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF475269),
                            ),
                          ),
                          const SizedBox(width: 10),

                          Switch(
                            value: Provider
                                .of<UserInterface>(context)
                                .themeMode == ThemeMode.dark,
                            onChanged: (value) {
                              ThemeMode newThemeMode = value
                                  ? ThemeMode.dark
                                  : ThemeMode.light;
                              Provider
                                  .of<UserInterface>(context, listen: false)
                                  .themeMode = newThemeMode;
                            },
                          ),
                        ],
                      ),
                    ),
                    // const Spacer(),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange.shade100,
                            ),
                            child: Icon(
                              Ionicons.earth,
                              color: Colors.orange,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            LocaleData.language.getString(context),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),

                          const SizedBox(width: 20),
                          Container(
                            child: DropdownButton(
                                value: _currentLocale,
                                items: const [
                                  DropdownMenuItem(
                                    value: "en",
                                    child: Text("English",
                                      style: TextStyle(color: Color(0xFF475269), fontWeight: FontWeight.w400),),
                                  ),
                                  DropdownMenuItem(
                                    value: "vi",
                                    child: Text("Việt Nam",
                                      style: TextStyle(color: Color(0xFF475269),fontWeight: FontWeight.w400),),
                                  ),
                                  DropdownMenuItem(
                                    value: "ja",
                                    child: Text("Japan",
                                      style: TextStyle(color: Color(0xFF475269),fontWeight: FontWeight.w400),),
                                  ),
                                ],
                                onChanged: (value) {
                                  _setLocale(value);
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    SettingItem(
                      title: LocaleData.notifications.getString(context),
                      icon: Ionicons.notifications,
                      bgColor: Colors.blue.shade100,
                      iconColor: Colors.blue,
                      onTap: () {},
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green.shade100,
                            ),
                            child: Icon(
                              Ionicons.nuclear,
                              color: Colors.green,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            LocaleData.colors.getString(context),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),

                          const SizedBox(width: 20),
                          Container(
                              child: DropdownButton<String>(
                                value: ui.strAppBarColor,
                                items: UserInterface.listColorAppBar.map<
                                    DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value,style: TextStyle(color: Color(0xFF475269), fontWeight: FontWeight.w400),),
                                      );
                                    }
                                ).toList(),
                                onChanged: (String? value) {
                                  ui.appBarColor = value!;
                                },
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    InkWell(
                      onTap: () => Navigator.pushNamed(context, "/"),
                      child: SettingItem(
                        title: LocaleData.logout.getString(context),
                        icon: Ionicons.log_out,
                        bgColor: Colors.red.shade100,
                        iconColor: Colors.red,
                        onTap: () => Navigator.pushNamed(context, "/"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: HomeBottomNavBar(),
          );
        }
      );
  }
  void _setLocale(String? value){
    if(value == null) return;
    if(value == "en"){
      _flutterLocalization.translate("en");
    }
    else if(value == "vi"){
      _flutterLocalization.translate("vi");
    }
    else if(value == "ja"){
      _flutterLocalization.translate("ja");
    }
    else{
      return;
    }
    setState(() {
      _currentLocale = value;
    });
  }
}




