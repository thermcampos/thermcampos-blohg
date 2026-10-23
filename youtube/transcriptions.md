# Transcription

WhisperX will be used to transcribe videos locally, for free using only
`python` and `ffmpeg`. No account and no API key is needed.

## Install

```bash
pip install whisperx
whisperx video.mkv \
  --model large-v3
  --output_format srt \
  --language en \
  --device cpu \
  --initial_prompt "intro with theming and main words"
```

## Test

Test the new file on vlc

## Translate

Ask any chatbot to translate the file without touching the timestamps.

