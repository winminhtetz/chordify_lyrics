import 'package:chordify_lyrics/src/chord_lyric_pair.dart';
import 'package:chordify_lyrics/src/chord_transposer.dart';
import 'package:chordify_lyrics/src/lyric_chord_parser.dart';
import 'package:flutter/material.dart';

/// A widget that displays lyrics with embedded chords and allows transposition.
///
/// The [ChordifyLyricsWidget] takes a string of raw chord-embedded lyrics and
/// renders it in a readable format. Chords can be tapped to trigger actions, and
/// the lyrics can be transposed up or down.
///
/// The widget provides customization options for text styles and chord spacing,
/// and supports a custom chord builder function for advanced rendering.
///
/// [rawChordText] is the input text containing chords in square brackets.
/// [transpose] is the number of semitones to transpose the chords.
/// [chordStyle] and [lyricStyle] can be used to customize the appearance of
/// chords and lyrics respectively.
class ChordifyLyricsWidget extends StatefulWidget {
  const ChordifyLyricsWidget({
    super.key,
    required this.rawChordText,
    this.scrollController,
    this.onChordTap,
    this.chordStyle,
    this.lyricStyle,
    this.chordBuilder,
    this.chordLyricsSpacing = 8,
    this.transpose = 0,
    this.lineSpacing = 4,
  });

  /// The raw text containing chords in square brackets.
  final String rawChordText;

  /// The number of semitones to transpose the chords.
  final int transpose;

  /// Optional text styles for chords and lyrics.
  final TextStyle? chordStyle;

  /// Optional text styles for chords and lyrics.
  final TextStyle? lyricStyle;

  /// The spacing between chords and lyrics.
  final double chordLyricsSpacing;

  /// The spacing between lines.
  final double lineSpacing;

  /// The scroll controller for the widget.
  final ScrollController? scrollController;

  /// Optional function to build custom widgets for chords.
  final Widget Function(String chord)? chordBuilder;

  /// Optional callback when a chord is tapped.
  final Function(String chord)? onChordTap;

  @override
  State<ChordifyLyricsWidget> createState() => _ChordifyLyricsWidgetState();
}

class _ChordifyLyricsWidgetState extends State<ChordifyLyricsWidget> {
  String rawChordLyric = '';
  int transpose = 0;

  /// Called whenever the widget configuration changes.
  ///
  /// This method checks if the [transpose] value or [rawChordText] has changed
  /// from the previous widget state. If either has changed, it triggers
  /// [_onTransposeChanged] to update the chords accordingly.
  @override
  void didUpdateWidget(covariant ChordifyLyricsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.transpose != widget.transpose ||
        oldWidget.rawChordText != widget.rawChordText) {
      _onTransposeChanged();
    }
  }

  /// Initializes the state of the widget by setting the initial values of
  /// [rawChordLyric] and [transpose] from the widget's properties.
  @override
  void initState() {
    super.initState();
    rawChordLyric = widget.rawChordText;
    transpose = widget.transpose;
  }

  /// Called when the transpose value is changed. This rebuilds the widget tree
  /// with the new chord values by calling [setState] with the transposed text.
  void _onTransposeChanged() {
    setState(() {
      rawChordLyric = ChordTransposer.transposeLyricLine(
        widget.rawChordText,
        widget.transpose,
        preferFlat: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final lines = rawChordLyric.split('\n');

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          spacing: widget.lineSpacing,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: lines.map(
            (line) {
              List<ChordLyricPair> parts = [];
              try {
                parts = LyricChordParser.parseLine(line);
                if (parts.isEmpty) return const SizedBox.shrink();
              } catch (e) {
                return const SizedBox.shrink();
              }

              return Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: parts.map(
                  (e) {
                    final chord = e.chord;
                    final lyric = e.lyric;

                    return Column(
                      spacing: widget.chordLyricsSpacing,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (chord.isNotEmpty)
                          widget.chordBuilder?.call(chord) ??
                              IconButton(
                                style: IconButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 6,
                                  ),
                                  minimumSize: Size.zero,
                                ),
                                padding: EdgeInsets.zero,
                                onPressed: () => widget.onChordTap?.call(chord),
                                icon: Text(
                                  chord,
                                  style: widget.chordStyle ??
                                      textTheme.bodyLarge?.copyWith(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                        Text(
                          lyric,
                          style: widget.lyricStyle ?? textTheme.bodyMedium,
                        ),
                      ],
                    );
                  },
                ).toList(),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
