import 'package:flutter/material.dart';
import 'package:chordify_lyrics/chordify_lyrics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int transpose = 0;

  String rawChordLyric = '''
(Chorus)
You [G]are my sunshine, my only sunshine
You [C]make me happy
When [G]skies are grey
You'll [C]never know dear
How [G]much I love you
Please don't take my [D]sunshine a[G]way

(Verse)
The [G]other night dear, as I lay sleeping
I [C]dreamed I held you in my [G]arms
When [C]I awoke dear, I was mistaken
So I [G]hung my [D]head and [G]cried

(Chorus)
You [G]are my sunshine, my only sunshine
You [C]make me happy
When [G]skies are grey
You'll [C]never know dear
How [G]much I love you
Please don't take my [D]sunshine a[G]way
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Chordify Lyric Example'),
      ),
      bottomNavigationBar: Column(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            // height: 10,
            child: Row(
              children: [
                Expanded(
                  child: Slider.adaptive(
                    value: transpose.toDouble(),
                    max: 5,
                    min: -5,
                    onChanged: (value) => setState(
                      () => transpose = value.toInt(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$transpose'),
                ),
              ],
            ),
          ),
          Text('Made with ❤️ by Win Min Htet')
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ChordifyLyricsWidget(
              transpose: transpose,
              rawChordText: rawChordLyric,
              chordLyricsSpacing: 0.1,
              keySignature: 'G',
              bpm: '65/130',
              capo: '3rd fret',
              songTitle: 'You Are My Sunshine',
              artistName: 'Christina Perri',
              thumbnailUrl:
                  'https://i.ytimg.com/vi/JBhp-TEh4e0/maxresdefault.jpg',
              showSongInfo: true,
              onChordTap: (chord) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(chord),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
