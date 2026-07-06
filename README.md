# Document World — Android App

A standalone, offline Android app to securely store, organize, and quickly view
or export all your important documents (Aadhaar, PAN, Voter ID, Passport, bank
papers, certificates, photos, and anything else) — entirely on your device.

## What's included

- **Kotlin + Room** — all documents/folders stored in a local SQLite database, no internet used or required
- **PIN + Biometric lock** — 4-digit PIN (SHA-256 salted hash, never stored in plain text) with optional fingerprint/face unlock, both backed by `EncryptedSharedPreferences` / Android Keystore
- **Encrypted file storage** — every photo/PDF is encrypted at rest with AES-256-GCM (`androidx.security.crypto.EncryptedFile`) inside the app's private storage; nothing is readable outside the app
- **Folders/categories** — pre-loaded with Aadhaar, PAN, Voter ID, Passport, Driving License, Bank Documents, Certificates, Photos, Others — plus custom folders
- **Photo upload** — camera capture or gallery picker
- **PDF upload** — system file picker, viewed page-by-page with pinch-zoom
- **Notes** — attach a text note to any document, editable any time
- **Fast search** — instant search across titles and notes
- **Backup / Export** — exports everything (decrypted) into a single `.zip` you save wherever you choose, via Android's standard file picker (no cloud, no auto-upload)
- **Modern, professional UI** — Material 3, deep-blue/teal palette, custom launcher icon

No login, no accounts, no servers, no analytics, no ads. 100% offline.

## How to build the installable APK

This folder is a complete Android Studio project. Turning it into an APK you
can install on a phone takes three steps:

1. **Install Android Studio** (free, from developer.android.com/studio) if you don't have it.
2. **Open this project**: `File → Open`, then select the `DocumentWorld` folder (the one containing this README).
   Android Studio will automatically download Gradle and all dependencies the first time you open it — this needs an internet connection once.
3. **Build the APK**: `Build → Build App Bundle(s) / APK(s) → Build APK(s)`.
   When it finishes, click the "locate" link in the notification, or find the file at:
   `app/build/outputs/apk/debug/app-debug.apk`

Copy that `app-debug.apk` to your phone (or drag it onto an emulator) and tap it to install.
(You may need to allow "Install unknown apps" for whichever app you use to open the file, since it isn't from the Play Store.)

### Command line alternative (if you have Gradle installed)
```
gradle wrapper          # regenerates gradlew + the wrapper jar
./gradlew assembleDebug
```
The resulting APK appears at the same path above.

## Project structure

```
app/src/main/java/com/documentworld/app/
  ui/              — all screens (Splash, SetupPin, Lock, Home, FolderDetail, AddDocument, DocumentViewer)
  data/            — Room entities + DAOs + database
  repository/      — DocumentRepository (single source of truth for UI)
  utils/           — SecurityPrefs (PIN), SecureFileManager (encryption), BackupUtils (export), PinPadHelper
  adapter/         — RecyclerView adapters (folders, documents, PDF pages)
app/src/main/res/  — layouts, strings, colors, icons
```

## Notes on the "standalone" requirement

- The app has **no dependency on any file-explorer or third-party app** to function — camera, gallery, and PDF pickers use standard Android system intents, which every Android phone has built in.
- Once installed, it runs entirely as its own app icon on the home screen, like any other app.
- All data stays in the app's private, encrypted storage on the device — it is never uploaded anywhere. The only file that ever leaves the app's private storage is the optional backup `.zip`, and only when you explicitly trigger Export and choose where to save it.

## Customizing

- **App name / colors**: `res/values/strings.xml` and `res/values/colors.xml`
- **Default folders**: `utils/Constants.kt` → `DEFAULT_FOLDERS`
- **App icon**: `res/drawable/ic_launcher_foreground.xml` + `ic_launcher_background.xml` (simple vector shapes — replace with your own artwork if you'd like a custom logo)
