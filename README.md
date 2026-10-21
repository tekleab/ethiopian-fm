# 🎙 Ethiopian FM Radio

A premium Progressive Web App (PWA) that plays all major Ethiopian FM radio stations. Open it in Safari on your iPhone 11 Pro Max, tap **Share → Add to Home Screen**, and it runs like a real app.

## 20 Verified Stations

| Station | Frequency | Genre |
|---------|-----------|-------|
| Sheger FM 102.1 | 102.1 FM | Music |
| Ethio FM 107.8 | 107.8 FM | Music / News |
| FM Addis 97.1 (EBC) | 97.1 FM | News / Music |
| Bisrat FM 101.1 | 101.1 FM | Music |
| EBC Radio 104.7 | 104.7 FM | News |
| Jano FM | Online | Music / News |
| Ahadu Radio 94.3 | 94.3 FM | News / Music |
| Tirita 97.6 FM | 97.6 FM | Music |
| Tizta FM (ትዝታ) | Online | Classic Music |
| Taem Radio (ጣዕም) | Online | Music |
| Addis Music | Online | Music |
| YeneVibe Radio | Online | Music |
| EthiOldies | Online | 60s–90s Classics |
| Voice of Ethiopia | Online | News / Music |
| Mirt Internet Radio | Online | Music |
| Amharic Sport Commentary | Online | Football |
| Ethiopian Orthodox Mezmur | Online | Religious |
| Christian Mezmur Ethiopia | Online | Religious |
| DW Amharic | Online | International News |
| Halaal Media | Online | Islamic |

## Features

- 🎵 **Now Playing** with animated waveform visualizer
- ⏭ **Previous / Next** station controls
- ⭐ **Favourites** — star any station
- ⏱ **Sleep Timer** — 15 min to 2 hours
- ➕ **Add custom streams** — paste any https:// stream URL
- 🔒 **Lock screen controls** via MediaSession API
- 📱 **PWA** — installs on iPhone home screen from Safari
- 💾 **Offline** app shell cached by service worker

## Deploy to GitHub Pages (free hosting)

1. Create a repo named `ethiopian-fm` on your GitHub account
2. Upload all files from this folder (`index.html`, `manifest.json`, `sw.js`, `icon-192.png`, `icon-512.png`)
3. Go to **Settings → Pages → Branch: main → Save**
4. Your URL: `https://tekleab.github.io/ethiopian-fm`
5. Open that URL in **Safari on your iPhone → Share → Add to Home Screen**

## How to Use

- **Tap a station** — starts playing
- **Tap again** — pauses / resumes  
- **⭐ button** — toggle favourite
- **⏭ / ⏮ arrows** — cycle through stations
- **+ button** — add your own stream URL
- **Timer icon** — set sleep timer
- **Volume** — tap the speaker icon

## Notes

- Streams are from [Radio Browser](https://radio-browser.info) and verified working as of October 2026
- iOS may pause web audio after extended screen lock — this is an iOS limitation
- Only https:// streams play reliably on iOS (http:// streams are blocked by Safari's mixed content policy)
