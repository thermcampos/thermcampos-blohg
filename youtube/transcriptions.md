# Transcription

WhisperX will be used to transcribe videos locally, for free using only
`python` and `ffmpeg`. No account and no API key is needed.

## Install

```bash
# Install
pip install whisperx

# Extract wav file
ffmpeg -i video.mkv -map 0:a:0 -ac 1 -ar 16000 hello-world.wav

# Generate the transcription
cd ~/projects/whisper.cpp/

./build/bin/whisper-cli -m models/ggml-large-v3-turbo.bin -f ../../hello-world.wav -l en -osrt -t 8 --prompt "Gentoo"
```

## Test

Test the new file on vlc

## Translate

Ask any chatbot to translate the file without touching the timestamps.

