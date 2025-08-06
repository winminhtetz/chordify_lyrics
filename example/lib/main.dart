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
Key: Ab
65/130 bpm

(Intro)
ဝမ်းတူးသရီး ကိုယ်ချစ်သွားပြီ  
ရေလည်အောင်ကိုယ်  
ရှင်းရှင်းပြောမည် ဝေါ်အိုက်နီ  
ဝမ်းတူးသရီး ရည်ရွယ်လိုက်သည်  
အိုအောင်မင်းအောင် ပေါင်းသင်းပါ့မယ် ရှေ့လျှောက်ခရီး

(Music)  
[||][Ab][ ][Fm][ ][|][Db][ ][Eb][ ][|][Ab][ ][Fm][ ][|][Db][ ][Eb][ ][||]

(Verse)  
ဟို[Ab]တုန်းကမေးတဲ့  
[Fm]လမ်းဘေးလက္ခဏာ[Db]အဟောထဲ[Eb]မှာ  
[Ab]ပြည်ကြီးကရည်းစား  
အ[Fm]ကျိုးပေးကောင်းမယ် [Db]ပြောခဲ့[Eb]တာ  
စိတ်[Ab]ကူးနဲ့မြူးခဲ့[Fm]ရူးခဲ့ရတယ် [Db]နှစ်လ[Eb]ကြာ  
သူ[Ab]လေးနဲ့ကျမှ [Fm]တည့်တည့်ကြီး ကိုယ်[Db]တိုးခဲ့[Eb]တာ  
ဟတ်ဖ်[Ab]ချိုင်းနိစ် ဖိုက်ဖိ  
[Fm]အလိုက်သိတဲ့ ကိုယ့်[Db]အသည်းလေး[Eb]က  
နှာ[Ab]ခေါင်းရင်းလေးတော့  
[Fm]နည်းနည်းပြားမယ် [Db]ခွင့်လွှတ်[Eb]ဗျာ  
သူ[Ab]ပါးမို့မို့ထက် [Fm]သွေးကြောလေးတွေ [Db]စိမ်းလဲ့[Eb]ဖြာ  
အ[Ab]သားလေးကတော့ [Fm]ဖွေးဖွေးဥကာ [Db]နုနု[Eb]ရွ

(Chorus)  
[Ab]ဝမ်းတူးသ[Eb]ရီး [Db]ကိုယ်ချစ်သွား[Eb]ပြီ  
ရေ[Ab]လည်အောင်ကိုယ် [Eb]ရှင်းရှင်းပြောမည် [Db]ဝေါ်အိုက်[Eb]နီ  
[Ab]ဝမ်းတူးသ[Eb]ရီး [Db]ရည်ရွယ်လိုက်[Eb]သည်  
ကွမ်[Ab]ရင်မယ်တော်[Eb]ကြီးမပါ [Db]ရှေ့လျှောက်[Eb]ခရီး

(Music)  
[||][Ab][ ][Fm][ ][|][Db][ ][Eb][ ][|][Ab][ ][Fm][ ][|][Db][ ][Eb][ ][||]

(Verse)  
သူ[Ab]လေးက ခိုင်းသမျှ [Fm]လိုက်လုပ်ရတဲ့ [Db]နွားနှစ်[Eb]ပါ  
သူ[Ab]လေးကြောင့် [Fm]ရိုက်ကြကိုက်ကြရ[Db]တာ ခွေးနှစ်[Eb]ပါ  
ဆိတ်[Ab]နှစ် မြင်းနှစ် [Fm]မျောက်နှစ် ပေါင်းစုံ[Db]ကူးတိုင်း[Eb]မှာ  
မိုး[Ab]နတ်မင်းကြီး [Fm]အမြဲတမ်း[Db]မအောင်ဆုတောင်း[Eb]တာ  
ဆွန်[Ab]ဇူးကျမ်းထဲက [Fm]သိမ်းပိုက်နည်း[Db]တွေ ကြိုးစား[Eb]ရှာ  
ကွန်[Ab]ဖြူးရှပ်ကြီးရဲ့ [Fm]စကားလုံးများ[Db]နဲ့ ရည်းစား[Eb]စာ  
ဘုံ[Ab]ကျောင်းကြီးထဲလည်း [Fm]ပြေးပြေးပြီး [Db]စာချကြည့်[Eb]ရ  
ရေ[Ab]နွေးကြမ်းလေးတစ်ခွက်  
[Db]ကောင်းကောင်း တိုက်ရင် [Eb]မမောဘူးဗျာ

(Chorus)  
[Ab]ဝမ်းတူးသ[Eb]ရီး [Db]ကိုယ်ချစ်သွား[Eb]ပြီ  
ရေ[Ab]လည်အောင်ကိုယ် [Eb]ရှင်းရှင်းပြောမည် [Db]ဝေါ်အိုက်[Eb]နီ  
[Ab]ဝမ်းတူးသ[Eb]ရီး [Db]ရည်ရွယ်လိုက်[Eb]သည်  
ကွမ်[Ab]ရင်မယ်တော်[Eb]ကြီးမပါ [Db]ရှေ့လျှောက်[Eb]ခရီး

(Solo)  
[||][Ab][ ][Fm][ ][|][Db][ ][Eb][ ][|][Ab][ ][Fm][ ][|][Db][ ][Eb][ ][|]  
[|][Ab][ ][Fm][ ][|][Db][ ][Eb][ ][|][Ab][ ][Fm][ ][|][Db][ ][Eb][ ][||]

(Verse)  
ရွှေ[Ab]ယောက်ဖနှစ်ယောက်က  
[Fm]အတွင်းအားသုံး[Db]ကာ ဓားစွမ်း[Eb]ပြ  
အဲ[Ab]ဗရီးဘော်ဒီ [Fm]လက်ခုပ်တီးပါ [Db]ကျွန်တော့်ဘက်[Eb]က  
သူ့[Ab]အန်းကုံးကြီးက [Fm]ပြုံးစိစိနဲ့[Db]ခေါင်းညိတ်[Eb]ပြ  
ကျွန်တော်[Ab]မျိုးကြီးကတော့  
[Fm]ငြိမ်းချမ်းရေးကို [Db]ရှေးရှု[Eb]ကာ  
အားလုံး[Ab]အားလုံး[Fm]ချိုင်းနားတောင်းကို[Db]လိုက်ခဲ့[Eb]ပါ  
[Ab]အားရပါးရ [Fm]သောက်ကြစမ်းပါ[Db]ပြီးတော့[Eb]မှ  
အံ[Ab]ပေါင်းအိတ်လေးနဲ့ [Fm]ငြိမ်းချမ်းရေး[Db]ထည့်ပေးတဲ့အ[Eb]ခါ  
မစ်(စ်)[Ab]ချိုင်းနိစ်လေးရဲ့ အိပ်မက်ထဲ [Db]ကိုယ်ဟီးရိုး[Eb]ဗျာ

(Chorus)  
[Ab]ဝမ်းတူးသ[Eb]ရီးအဆင်[Db]ပြေသွား[Eb]ပြီး  
နေ[Ab]သာလေသာတဲ့[Eb]တစ်နေ့မှာ [Db]လက်ထပ်[Eb]မည်  
[Ab]ဝမ်းတူးသ[Eb]ရီး [Db]ရည်ရွယ်လိုက်[Eb]သည်  
အို[Ab]အောင်မင်းအောင် [Eb]ပေါင်းသင်းပါ့မယ်  
[Db]ရှေ့လျှောက်ခ[Eb]ရီး  
[Ab]ဝမ်းတူးသ[Eb]ရီး [Db]ကိုယ်ချစ်သွား[Eb]ပြီ  
ရေ[Ab]လည်အောင်ကိုယ် [Eb]ရှင်းရှင်းပြောမည် [Db]ဝေါ်အိုက်[Eb]နီ  
[Ab]ဝမ်းတူးသ[Eb]ရီး [Db]ရည်ရွယ်လိုက်[Eb]သည်  
ကွမ်[Ab]ရင်မယ်တော်[Eb]ကြီးမပါ [Db]ရှေ့လျှောက်[Eb]ခရီး  
[Ab]ဝမ်းတူးသ[Eb]ရီး [Db]ကိုယ်ချစ်သွား[Eb]ပြီ  
ရေ[Ab]လည်အောင်ကိုယ် [Eb]ရှင်းရှင်းပြောမည် [Db]ဝေါ်အိုက်[Eb]နီ  
[Ab]ဝမ်းတူးသ[Eb]ရီး [Db]ရည်ရွယ်လိုက်[Eb]သည်  
ကွမ်[Ab]ရင်မယ်တော်[Eb]ကြီးမပါ [Db]ရှေ့လျှောက်[Eb]ခရီး
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
