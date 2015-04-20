requirejs.config({
    baseUrl: 'core/dest/js',
    paths: {
        zepto   : '//cdnjs.cloudflare.com/ajax/libs/zepto/1.1.4/zepto.min',
        app     : 'app.min'
    },
    shim: {
        'app': {
            deps    : ['zepto']
        }
    },
    waitSeconds: 15
});