import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stock_track/components/items.dart';
import 'package:stock_track/components/nav_bar.dart';
import 'package:stock_track/model/api_model.dart';
import 'package:stock_track/themes/theme.dart';
import 'package:stock_track/themes/theme_provider.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WebSocketChannel channel;
  bool isReloading = true;
  List<Datum>? coinMarket = [];
  bool isDarkMode = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    connectToWebSocket();
  }

  @override
  void dispose() {
    channel.sink.close(status.goingAway);
    super.dispose();
  }

  void connectToWebSocket() {
    const apiUrl = 'ws://prereg.ex.api.ampiy.com/prices';

    channel = WebSocketChannel.connect(
      Uri.parse(apiUrl),
    );

    channel.sink.add('''
      {
        "method": "SUBSCRIBE",
        "params": [
          "all@ticker"
        ],
        "cid": 1
      }
    ''');

    channel.stream.listen((message) {
      print("Received: $message");

      final parsedData = welcomeFromJson(message);

      setState(() {
        coinMarket = parsedData.data;
        isReloading = false;
      });
    }, onError: (error) {
      print('WebSocket error: $error');
      setState(() {
        isReloading = false;
      });
    });
  }

  void _toggleTheme(bool isDark) {
    setState(() {
      isDarkMode = isDark;
    });
  }

  void _onNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double kHeight = MediaQuery.of(context).size.height;
    double kWidth = MediaQuery.of(context).size.width;

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stock Track',
          style: TextStyle(color: colorScheme.inversePrimary),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: colorScheme.inversePrimary),
            onPressed: () {
              // Search button action
            },
          ),
          SizedBox(width: 16),
          IconButton(
            icon: Icon(Icons.person, color: colorScheme.inversePrimary),
            onPressed: () {
              // Profile icon action
            },
          ),
        ],
        backgroundColor: colorScheme.surface,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: colorScheme.surface,
              ),
              child: Text(
                'Menu',
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: colorScheme.inversePrimary,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text(
                Provider.of<ThemeProvider>(context).themeData == darkTheme
                    ? 'Dark Mode'
                    : 'Light Mode',
                style: GoogleFonts.openSans(
                  textStyle: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              trailing: Switch(
                value:
                    Provider.of<ThemeProvider>(context).themeData == darkTheme,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: kHeight,
        width: kWidth,
        color: colorScheme.surface, // Set background color here
        child: isReloading
            ? Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(colorScheme.inversePrimary),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: Container(
                      width: kWidth,
                      color: isDarkMode
                          ? colorScheme.surface
                          : colorScheme.primary,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        padding: EdgeInsets.all(8),
                        itemCount: coinMarket?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Item(item: coinMarket![index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
      bottomNavigationBar: NavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }
}
