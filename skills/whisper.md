---
name: whisper
description: Local speech-to-text transcription using OpenAI Whisper.
---

# Whisper

Local speech-to-text transcription using OpenAI's Whisper model.

## When to use

Use this skill when the user asks to:
- Transcribe audio or voice messages
- Convert speech to text
- Get text from audio/video files

## Commands

```bash
# Basic transcription (outputs to /tmp)
whisper audio.mp3 --model base --output_format txt --output_dir /tmp

# With specific language
whisper audio.mp3 --model base --language en --output_format txt --output_dir /tmp

# Different output formats
whisper audio.mp3 --model base --output_format srt  # Subtitles
whisper audio.mp3 --model base --output_format vtt  # WebVTT
whisper audio.mp3 --model base --output_format json # JSON with timestamps
```

## Models

Available models (larger = more accurate but slower):
- `tiny` - Fastest, least accurate
- `base` - Good balance (recommended)
- `small` - Better accuracy
- `medium` - High accuracy
- `large` - Best accuracy, slowest

## Supported Formats

Whisper supports most audio/video formats:
- Audio: mp3, wav, m4a, flac, ogg, opus
- Video: mp4, webm, mkv (extracts audio track)

## Tips

- Use `base` model for most tasks (good speed/accuracy tradeoff)
- Output files are saved with the same name as input + format extension
- For long audio, processing may take a while
