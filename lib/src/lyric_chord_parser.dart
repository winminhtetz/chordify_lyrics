import 'package:chordify_lyrics/src/chord_lyric_pair.dart';

class LyricChordParser {
  static List<ChordLyricPair> parseLine(String line) {
    final pattern = RegExp(r'\[([^\]]+)\]');
    final matches = pattern.allMatches(line);
    final result = <ChordLyricPair>[];

    int currentIndex = 0;

    for (final match in matches) {
      final chord = match.group(1)!;
      final chordStart = match.start;
      final lyricStart = match.end;

      // Add any plain lyric before the chord
      if (chordStart > currentIndex) {
        result.add(
          ChordLyricPair(
            chord: '',
            lyric: line.substring(currentIndex, chordStart),
          ),
        );
      }

      final nextMatchList = matches.where((m) {
        return m.start > match.start;
      }).toList();

      final lyricEnd =
          nextMatchList.isNotEmpty ? nextMatchList.first.start : line.length;

      result.add(
        ChordLyricPair(
          chord: chord,
          lyric: line.substring(lyricStart, lyricEnd),
        ),
      );

      currentIndex = lyricEnd;
    }

    // Remaining plain lyric after last chord
    if (currentIndex < line.length) {
      result.add(
        ChordLyricPair(
          chord: '',
          lyric: line.substring(currentIndex),
        ),
      );
    }

    return result;
  }
}
