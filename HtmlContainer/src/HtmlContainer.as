package {
import flash.events.ErrorEvent;

public class HtmlContainer {

    COMPILE::JS
    private static function loadScripts(scripts:Array, onLoaded:Function = null):void {

        const head:HTMLHeadElement = window.document.head || window.document.getElementsByTagName("head")[0];

        var scriptsToLoad:Number = scripts.length;

        function onError(error:ErrorEvent):void {
            throw new URIError("The script " + HTMLScriptElement(error.target).src + " is not accessible.");
        }

        function loadNextScript():void {
            if (scriptsToLoad > 0) {
                var script:HTMLScriptElement = document.createElement("script") as HTMLScriptElement;
                script.type = "text/javascript";
                script.lang = "Javascript";
                script.onerror = onError;
                script.onload = loadNextScript;

                head.appendChild(script);
                script.src = scripts[--scriptsToLoad];
            } else if (onLoaded)
                onLoaded();
        }

        loadNextScript();
    }

    COMPILE::AS3
    private static function loadScripts(scripts:Array, onLoaded:Function = null):void {

        function loadNextScript():void {
            if (onLoaded)
                onLoaded();
        }

        loadNextScript();
    }

    public static function load(scripts:Array, callBack:Function):void {
        loadScripts(scripts, callBack);
    }
}
}
