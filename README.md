# Oh no, VM is asleep!

This is what's shown when a Koding VM is unavailable.

## Structure

The `index.html` file is the main file and the result of the build.
The `core` folder holds all the sources and assets of the project.
    * `assets` - has an `img` folder with all the image assets and a `js` folder that contains all the JavaScript assets.
    * `coffee` - contains the main JavaScript source code written in CoffeScript.
    * `dest` - contains all the JavaScript and CSS files that result after a successful build. These files are used by the `index.html` file.
    * `sass` - contains the main CSS source code written in Sass. This also includes the code for RWD.
    * `template` - contains the main HTML source code. The files here **should* be modified **NOT** the index.html file.

## Build process

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

## Push to production

* SSH into the Blog Box.

```
cd /var/www/kdsleepmode
git pull
```
