# Build for Desktop (Linux, Windows, MacOS, etc.)
Originally I thought I had and issue with QT 5.14.x that required me to add some QT include paths to my default include path environment variable for in source builds
```
export CPLUS_INCLUDE_PATH=<QT_SOURCE_DIR>/qtbase/include/QtCore/5.15.0/:<QT_SOURCE_DIR>/qtbase/include/QtCore/5.15.0/QtCore
```
Ultimately I moved to out-of-source builds that required three fixes:
#) Fix the mutex include that was resulting in duplicate symbols in qtbase
#) Remove the marshaling source in dbus (in qtbase) that was resulting in duplicate symbols
#) Run qlalr in the build directory under qtdeclarative to resolve the missing grammar header file

I assume there is a bug in the build configuration or preprocssing scripts that should have resolved all of the above but did not

## Configure this project to use QT from above
```
  cmake -DCMAKE_PREFIX_PATH=/opt/Qt-5.14.0/lib/cmake/ ..
```
