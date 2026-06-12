# Confession Booth

A browser-based interactive installation where visitors confess to an AI priest.
Two versions with different audio pipelines.

## Requirements

- [Node.js](https://nodejs.org) (LTS) — install this first
- API keys (see setup below)

## Version A — Gemini 3.5 Flash + ElevenLabs

**Pipeline:** Browser records audio → Gemini 3.5 Flash (transcription + response) → ElevenLabs TTS

- Full control over the priest's voice via [ElevenLabs Voice Library](https://elevenlabs.io/voice-library)
- Language is detected automatically by Gemini — no configuration needed
- Auto-stop: recording starts on click, stops automatically after 2 seconds of silence

**Setup:**
1. Copy `.env.example` to `.env` and fill in your keys
2. Double-click `start-version-a.bat` (Windows) or run `./start-version-a.sh` (macOS)

```
GEMINI_API_KEY=...
ELEVENLABS_API_KEY=...
ELEVENLABS_VOICE_ID=...   # find a voice at elevenlabs.io/voice-library
```

Or manually:
```
cd version-a-elevenlabs
npm install
npm start   # → http://localhost:3000
```

## Version B — Gemini Live API

**Pipeline:** Browser microphone ↔ WebSocket ↔ Gemini Live (audio in, audio out)

- Lowest latency — Gemini handles everything in one model
- Automatic language detection
- Visitor can interrupt the priest mid-sentence
- Voice: Gemini built-in voice "Charon" (limited selection)
- Continuous: press "speak" once, then talk freely — stops automatically after 2 seconds of silence

**Setup:**
1. Copy `.env.example` to `.env` and fill in your key
2. Double-click `start-version-b.bat` (Windows) or run `./start-version-b.sh` (macOS)

```
GEMINI_API_KEY=...
```

Or manually:
```
cd version-b-gemini-live
npm install
npm start   # → http://localhost:3001
```

## Comparison

| | Version A | Version B |
|---|---|---|
| Voice quality | ElevenLabs (customizable) | Gemini built-in |
| Latency | Medium | Low |
| Language detection | Automatic | Automatic |
| Interruption | No | Yes |
| APIs required | Gemini + ElevenLabs | Gemini only |

## Notes for installation/exhibition

- Use **Chrome** for best audio support
- Browser autoplay policy: audio only starts after a user interaction — the "speak" button already satisfies this
- Version A runs on port **3000**, Version B on port **3001** — both can run simultaneously
