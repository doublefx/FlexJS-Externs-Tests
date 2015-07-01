set FALCON_HOME=U:/sources/asf/flex/falcon
set FLEX_HOME=U:/sources/asf/flex/asjs
set PROJECT_HOME=U:/sources/flexJsProjects/testJsSwc
set FALCON_CLASSPTH=%FALCON_HOME%/compiler/generated/dist/sdk/lib/*;%FALCON_HOME%/compiler.jx/lib/*;%FALCON_HOME%/compiler.jx/lib/google/closure-compiler/*
set CLOSURE_LIBRARY=U:/sources/google/closure-library


java -cp "%FALCON_CLASSPTH%" -Dflexlib="%FLEX_HOME%\frameworks" flex2.tools.Compc -external-library-path=%FALCON_HOME%/externs/js/out/bin/js.swc -define+=COMPILE::AS3,false -define+=COMPILE::JS,true -js-output-type=FLEXJS -source-path=%PROJECT_HOME%/HtmlContainer/src -include-classes HtmlContainer -output=%PROJECT_HOME%/bin/HtmlContainer\fake.swc

java -cp "%FALCON_CLASSPTH%" -Dflexlib="%FLEX_HOME%\frameworks" flex2.tools.Compc -external-library-path=%FALCON_HOME%/externs/js/out/bin/js.swc -define+=COMPILE::AS3,true -define+=COMPILE::JS,false -include-file=js/out/*,%PROJECT_HOME%/bin/HtmlContainer/js/out -source-path=%PROJECT_HOME%/HtmlContainer/src -include-classes HtmlContainer -output=%PROJECT_HOME%/bin/HtmlContainer\HtmlContainer.swc

java -cp "%FALCON_CLASSPTH%" -Dflexlib="%FLEX_HOME%\frameworks" flex2.tools.Mxmlc -load-config=%FLEX_HOME%/frameworks/flex-config.xml -closure-lib=%CLOSURE_LIBRARY% -sdk-js-lib=%FLEX_HOME%/frameworks/js/FlexJS/libs -external-library-path=%FALCON_HOME%/externs/js/out/bin/js.swc -external-library-path=%FALCON_HOME%/externs/js/out/bin/js.swc -external-library-path=%FALCON_HOME%/externs/jquery/out/bin/jquery-1.9.swc -library-path=%PROJECT_HOME%/bin/HtmlContainer\HtmlContainer.swc -js-output-type=FLEXJS %PROJECT_HOME%/src/Main.as -output=%PROJECT_HOME%/bin/ExternsApp


#to debug it: -Dagentlib:jdwp=transport=dt_shmem,server=n,address=javadebug,suspend=y
