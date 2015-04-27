# Oh no, VM is asleep!

This is what's shown when a Koding VM is unavailable.

## Structure

The `master` branch holds the source code to the project.
The `production` branch is where everything is pushed once a build is finished.

### Master

The `core` folder holds all the sources and assets of the project.
* `assets` - has a `css` folder that contains all the CSS assets, an `img` folder with all the image assets, a `js` folder that contains all the JavaScript assets.
* `coffee` - contains the main JavaScript source code written in CoffeScript.
* `sass` - contains the main CSS source code written in Sass. This also includes the code for RWD.
* `template` - contains the main HTML source code. The files in this folder are the ones that **should** be modified **NOT** the index.html file.

### Production

The result of the build and deploy process is stored here.

## Build process

First make sure you run the bellow command to install all dependencies:

```
npm install
```

This project uses Grunt and some Grunt packages for the build process.
To issue a build command just open a Terminal in the folder and type:

```
grunt
```

This will build the whole project.

If the project is beeing improved or modified, then it is recommended to use the 

```
grunt watch
```

command. This will monitor the whole project for any modifications and issue a build command when a file modification has been made.

To preview your changes you can use the `./helper` script. You have 4 options for this script.

* `./helper init` - to set up the push project. This should be run only once, when the project has been started.
* `./helper preview` - will start a small Python server that will serve the project so it can be previewed. The preview URL is using port `:8000` (eg. your_koding_vm.koding.io:8000)
* `./helper build` - to build the project (has the same effect as the `grunt` command).
* `./helper deploy` - to deploy the project to the production branch.

## Push to production

* Make the modification to the project and run `./helper build`.
* Run `./helper deploy` to deploy to the production branch.
* SSH into the Blog Box and run the bellow commands.

```
cd /var/www/kdsleepmode
git pull
```
