requirejs.config({
    baseUrl: 'assets/',
    paths: {
        zepto   : 'js/zepto.min',
        app     : 'js/app.min'
    },
    shim: {
        'app': {
            deps    : ['zepto']
        }
    },
    waitSeconds: 15
});