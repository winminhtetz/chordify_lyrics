class ChordTransposer {
  /// The notes of the chromatic scale in sharp notation.
  static final List<String> _sharpScale = [
    "C",
    "C#",
    "D",
    "D#",
    "E",
    "F",
    "F#",
    "G",
    "G#",
    "A",
    "A#",
    "B"
  ];

  /// The notes of the chromatic scale in flat notation.
  static final List<String> _flatScale = [
    "C",
    "Db",
    "D",
    "Eb",
    "E",
    "F",
    "Gb",
    "G",
    "Ab",
    "A",
    "Bb",
    "B"
  ];

  /// The enharmonics of the chromatic scale.
  static final Map<String, String> _enharmonics = {
    "Db": "C#",
    "Eb": "D#",
    "Fb": "E",
    "Gb": "F#",
    "Ab": "G#",
    "Bb": "A#",
    "Cb": "B",
    "E#": "F",
    "B#": "C"
  };

  /// Transposes a musical chord by a specified number of semitones.
  ///
  /// This function transposes a given chord by the specified number of
  /// semitones. It supports chords with slash notation and can return
  /// either sharp or flat notation based on the `preferFlat` parameter.
  ///
  /// - Parameters:
  ///   - chord: The chord to be transposed. This can include slash chords.
  ///   - transpose: The number of semitones to transpose the chord.
  ///   - preferFlat: A boolean indicating whether to prefer flat notation
  ///     for the transposed chord. Defaults to false (sharp notation).
  /// - Returns: The transposed chord as a string.

  static String transposeChord(String chord, int transpose,
      {bool preferFlat = false}) {
    if (chord.contains('/')) {
      final parts = chord.split('/');
      return '${transposeChord(parts[0], transpose, preferFlat: preferFlat)}/${transposeChord(parts[1], transpose, preferFlat: preferFlat)}';
    }

    final match = RegExp(r'^([A-G][b#]?)(.*)$').firstMatch(chord);
    if (match == null) return chord;

    final root = _normalize(match.group(1)!);
    final suffix = match.group(2) ?? "";

    final index = _sharpScale.indexOf(root);
    if (index == -1) return chord;

    final newIndex = (index + transpose + 12) % 12;
    final newRoot = preferFlat ? _flatScale[newIndex] : _sharpScale[newIndex];

    return newRoot + suffix;
  }

  /// Transposes chords embedded in a song lyric line.
  ///
  /// This function takes a line of text from a song lyric and transposes
  /// any chords found in it. The chords must be enclosed in square
  /// brackets and written in standard chord notation. The transposition
  /// is done with [transposeChord].
  static String transposeLyricLine(String line, int transpose,
      {bool preferFlat = false}) {
    return line.replaceAllMapped(
      RegExp(r'\[([A-G][b#]?[^\]]*)\]'),
      (match) {
        return '[${transposeChord(match.group(1)!, transpose, preferFlat: preferFlat)}]';
      },
    );
  }

  static String _normalize(String root) => _enharmonics[root] ?? root;
}
