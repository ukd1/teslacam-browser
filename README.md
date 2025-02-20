# TeslaCam Browser

![Screenshot of TeslaCam Browser running](https://github.com/ukd1/teslacam-browser/assets/44345/417017cb-ea40-42de-8f66-32e184dd0dfb)

This is a simple browser for TeslaCam recordings.  These are the files that are generated by Dashcam and [Sentry Mode](https://www.tesla.com/blog/sentry-mode-guarding-your-tesla) on [Tesla](https://www.tesla.com) vehicles.

To use this app, simply click the "Open..." button and browse to the ```TeslaCam``` folder (either by plugging the TeslaCam USB drive into your PC / Mac, or possibly accessing it as a network share over WiFi if supported).  It'll aggregate clips by date and present them on a calendar, and a dropdown list to select individual events on that date.

Basic video playback controls let you view all available cameras side-by-side.  Clicking on a video will open a file browser pointing to the source file.

## Installation

Installation packages are available on the [Releases](https://github.com/BobStrogg/teslacam-browser/releases) page.

## Running from the command line

While using the installation packages is the simplest option, you can also run the app from the command line (you'll need to ensure [Electron](https://electronjs.org/docs/tutorial/installation) is installed first).

```
cd teslacam-browser
npm install
electron .
```

## Running as a headless server

You can run the app as a standalone headless server, even on a Raspberry Pi:

```
cd teslacam-browser
npm install
node server.js /path/to/TeslaCam
```

You can then open the app in a browser by pointing to http://localhost:8088 (replace `localhost` with address of your server).

## Running in Docker

```
docker run -p 8088:8088 -v /some/folder/with-your-teslacam:/media/TeslaCam ukd1/teslacam-browser
```

You can then open the app in a browser by pointing to http://localhost:8088 (replace `localhost` with address of your server).

## Running in Kubernetes

Checkout the sample `k8s.example.yml` - you will need to decide on how to mount the TeslaCam media folder.

## HEVC codec

It appears newer Tesla software versions encode video in HEVC / H-265 format, which Chrome seems unable to handle.  All you'll see are blank areas where the videos should be, and clicking "Play" will throw an error (shown in a red box).  If this occurs, clicking the "Browse" button will attempt to open the app in your default web browser.  If it still doesn't work, opening the same address in Safari (macOS) or Edge (Windows) should help.

## tesla_dashcam

If you've installed [tesla_dashcam](https://github.com/ehendrix23/tesla_dashcam), you can use it to merge clips from the command-line using a folder path provided by TeslaCam Browser:

1. Select the date and event folder you'd like to merge in TeslaCam Browser
2. Click the "Copy" button; this will copy the folder path into the clipboard
3. Open a Terminal (macOS) or Command Prompt (Windows) and invoke tesla_dashcam (pasting the file path from the clipboard)
   `> tesla_dashcam "<paste_folder_here>"`

## License

[CC0 1.0 (Public Domain)](LICENSE.md)
