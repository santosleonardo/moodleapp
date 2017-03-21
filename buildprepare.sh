#!/bin/bash

# Quando ha atualizacoes em https://github.com/moodlehq/moodlemobile-phonegapbuild.git e necessario remover o fork criado e cria-lo novamente com as atualizacoes.

cd ..

if [ ! -d  moodlemobile-phonegapbuild ]; then
    git clone https://github.com/santosleonardo/moodlemobile-phonegapbuild.git
fi

cd moodlemobile-phonegapbuild

if [ $(git branch -a | grep posalfa | wc -l) -gt 0 ]
then
    git checkout posalfa
else
    git checkout -b posalfa master
fi

cp -R ../moodlemobile2/www/* .

cp -R ../moodlemobile2/resources/* resources/

cp ../moodlemobile2/resources/splash.png ../moodlemobile2/resources/android/icon.png .

sed -e 's/com.moodle.moodlemobile/br.pro.avp.posalfa/' -i .OLD config.xml
sed -e 's/>Moodle Mobile/>PosAlfa/' -i .OLD config.xml
sed -e 's/Moodle Mobile official app/POS-GRADUACAO LATO SENSU ALFABETIZACAO DAS CRIANCAS DAS CLASSES POPULARES/' -i .OLD config.xml
sed -e 's/http:\/\/moodle.com/http:\/\/www.avp.pro.br/' -i .OLD config.xml
sed -e 's/mobile@moodle.com/posalfauff@gmail.com/' -i .OLD config.xml
sed -e 's/Moodle Pty Ltd/Carmen Peres/' -i .OLD config.xml
sed -e 's/value=\"moodlemobile\"/value=\"posalfa\"/' -i .OLD config.xml
sed -e 's/debuggable=\"true\"/debuggable=\"false\"/' -i .OLD config.xml
rm config.xml.OLD

sed -e 's/true)/false)/' -i .OLD core/lib/log.js
rm core/lib/log.js.OLD

git add .
git commit -m "Version update."
git push origin posalfa

