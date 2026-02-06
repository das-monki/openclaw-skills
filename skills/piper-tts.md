---
name: piper-tts
description: Local neural text-to-speech using Piper - convert text to spoken audio.
---

# Piper TTS

Local neural text-to-speech synthesis using the Piper engine.

## When to use

Use this skill when the user asks to:
- Read text aloud
- Convert text to speech/audio
- Generate voice messages
- Create audio from written content

## Commands

```bash
# Speak text directly (plays through speakers)
piper-speak "Hello, how are you today?"

# Save to file
piper-speak "Hello world" --output greeting.wav

# List available voices
piper-speak --list-voices

# Use a specific voice
piper-speak "Good morning" --voice en_GB-alba-medium
piper-speak "Good morning" --voice en_US-amy-medium
```

## Voice Models

Voice models are automatically downloaded from HuggingFace on first use.

Common voices:
- `en_US-amy-medium` - American English, female
- `en_US-ryan-medium` - American English, male
- `en_GB-alba-medium` - British English, female
- `de_DE-thorsten-medium` - German, male

## Tips

- For longer text, the synthesis may take a moment
- Audio quality is good for most use cases
- Works completely offline after voice download
- WAV output can be converted to other formats with ffmpeg
