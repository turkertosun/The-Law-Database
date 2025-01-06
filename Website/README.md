# Website
This folder contains the HTML/CSS of the frontend (website) which users will interact with. The HTML includes [Tera](https://keats.github.io/tera/) template syntax to aid with SSR.

## Building
The website is bundled by [Parcel](https://parceljs.org/), which requires [Node.js](https://nodejs.org/) to be installed. For this project,
use the current LTS version (Node.js v20.18.0).

After [Node.js](https://nodejs.org/) is installed, navigate to this folder and install the npm dependencies using the command:
```
npm install
```
Now build the website using the command:
```
npm run build
```
The website will be bundled and exported to a folder called `dist`.
