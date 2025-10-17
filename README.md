# 🎶 chordify_lyrics

**A Flutter widget package to parse, display, and transpose chorded lyrics** — perfect for music, karaoke, chord sheet, and worship apps.

---

## ✨ Features

- 🎸 Parse lyrics with embedded chords like `[C]I [G]love [Am]you`
- 📐 Automatically aligns chords above lyrics
- 🔁 Transpose chords up/down with `transpose`
- 🔘 Tappable chords with custom actions
- 🎨 Fully customizable styling and layout

---

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  chordify_lyrics: ^1.0.3
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
  keySignature: 'G',
  bpm: '65/130',
  capo: '3rd fret',
  songTitle: 'You Are My Sunshine',
  artistName: 'Christina Perri',
  thumbnailUrl: 'https://i.ytimg.com/vi/JBhp-TEh4e0/maxresdefault.jpg',
  showSongInfo: true,
  onChordTap: (chord) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(chord),
      ),
    );
  },
)
```

---

## 🎼 Example Input (rawChordText)

```dart
String rawChordText = """
(Chorus)
You are my s[G]unshine, my only sunshine
You make me h[C]appy
When skies are g[G]rey
You’ll never k[C]now dear
How much I [G]love you
Please don’t take my suns[D]hine [G]away
""";
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

| Prop                   | Description                                                              |
| ---------------------- | ------------------------------------------------------------------------ |
| `transpose`            | Number of semitones to transpose chords (default: `0`)                   |
| `onChordTap`           | Callback triggered when a chord is tapped                                |
| `chordStyle`           | `TextStyle` for chords                                                   |
| `lyricStyle`           | `TextStyle` for lyrics                                                   |
| `chordBuilder`         | Custom widget builder for each chord                                     |
| `sectionHeaderBuilder` | Custom widget builder for section headers (e.g., `(Chorus)`, `(Verse)`)  |
| `chordLyricsSpacing`   | Space between chord and lyric (default: `8.0`)                           |
| `lineSpacing`          | Vertical space between lines (default: `4.0`)                            |
| `scrollController`     | Optional `ScrollController` for scroll customization                     |
| `showSongInfo`         | Whether to show song information like title and artist (default: `true`) |
| `songTitle`            | Optional song title to display above the lyrics                          |
| `artistName`           | Optional artist name to display below the title                          |
| `thumbnailUrl`         | Optional image URL to display as song thumbnail                          |
| `thumbnail`            | Custom thumbnail widget (overrides `thumbnailUrl` if provided)           |
| `keySignature`         | Optional key signature of the song (e.g., `C Major`, `A Minor`)          |
| `bpm`                  | Optional BPM (beats per minute) of the song                              |
| `capo`                 | Optional capo position (e.g., `Capo 2`)                                  |

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
