# 🎶 chordify_lyrics

**A Flutter widget package to parse, display, and transpose chorded lyrics** — perfect for music, karaoke, chord sheet, and worship apps.

---

## ✨ Features

- 🎸 Parse lyrics with embedded chords like `[C]I [G]love [Am]you`
- 📐 Automatically aligns chords above lyrics
- 🔁 Transpose chords up/down with `ChordTransposeController`
- 🔘 Tappable chords with custom actions
- 🎨 Fully customizable styling and layout

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  chordify_lyrics: ^1.0.0
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Usage

```dart
import 'package:chordify_lyrics/chordify_lyrics.dart';

int transpose = 0;

ChordifyLyricsWidget(
  transpose: transpose,
  rawChordText: rawChordLyric,
  chordLyricsSpacing: 0.1,
  onChordTap: (chord) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(chord)),
    );
  },
)
```

---

## 🎼 Example Input (rawChordText)

```txt
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
```

> The widget will automatically align `[Ab]`, `[Fm]`, `[Db]`, etc. above each lyric line and support real-time transposition.

---

## 🔁 Transposing Chords

Use the transpose to transpose the key dynamically:

```dart
ChordifyLyricsWidget(
  transpose: transpose,
  ........ : .....
)
```

---

## 🎨 Customization Options

| Prop                 | Description                                          |
| -------------------- | ---------------------------------------------------- |
| `transpose`          | Optional to dynamically transpose chords             |
| `onChordTap`         | Callback when a chord is tapped                      |
| `chordStyle`         | `TextStyle` for chords                               |
| `lyricStyle`         | `TextStyle` for lyrics                               |
| `chordBuilder`       | Custom widget builder for each chord                 |
| `chordLyricsSpacing` | Space between chord and lyric (default: `8.0`)       |
| `scrollController`   | Optional `ScrollController` for scroll customization |

---

## 📸 Screenshots

![ChordifyLyrics Preview](screenshots/preview.png)

---

## 💡 Tip

Use this package to build your own:

- 🎤 Karaoke app
- 📖 Songbook or chord sheet
- 🎹 Music education tool
- ⛪ Worship setlist app

---

## 🙌 Contributing

Feel free to open issues or submit PRs to add features, fix bugs, or improve docs!

---

## 📄 License

MIT © Win Min Htet
