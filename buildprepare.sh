#!/bin/bash

# Criar fork do repositorio https://github.com/moodlehq/moodlemobile-phonegapbuild.git

cd ../moodlemobile-phonegapbuild # comando para apagar pasta, se houver, criar fork e cair na pasta

git checkout -b avpmobile

cp -R ../moodlemobile2/www/* .

cp -R ../moodlemobile2/resources/* resources/

cp ../moodlemobile2/resources/icon.png ../moodlemobile2/resources/splash.png .