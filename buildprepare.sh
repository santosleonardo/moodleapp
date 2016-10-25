#!/bin/bash

# Criar fork do repositorio https://github.com/moodlehq/moodlemobile-phonegapbuild.git e clonar

cd ..

git clone https://github.com/santosleonardo/moodlemobile-phonegapbuild.git

cd moodlemobile-phonegapbuild

git checkout -b avpmobile

cp -R ../moodlemobile2/www/* .

cp -R ../moodlemobile2/resources/* resources/

cp ../moodlemobile2/resources/icon.png ../moodlemobile2/resources/splash.png .

sed -e 's/com.moodle.moodlemobile/br.pro.avp.avpmobile/' -i .OLD config.xml
sed -e 's/>Moodle Mobile/>AVP Mobile/' -i .OLD config.xml
sed -e 's/Moodle Mobile official app/Aplicativo Oficial do Ambiente Virtual de Pesquisa/' -i .OLD config.xml
sed -e 's/http:\/\/moodle.com/http:\/\/www.avp.pro.br/' -i .OLD config.xml
sed -e 's/mobile@moodle.com/mauriciorochacruz@gmail.com/' -i .OLD config.xml
sed -e 's/Moodle Pty Ltd/Mauricio Cruz/' -i .OLD config.xml
sed -e 's/value=\"moodlemobile\"/value=\"avpmobile\"/' -i .OLD config.xml
sed -e 's/debuggable=\"true\"/debuggable=\"false\"/' -i .OLD config.xml
rm config.xml.OLD

sed -e 's/true)/false)/' -i .OLD core/lib/log.js
rm core/lib/log.js.OLD

git add .
git commit -m "Version update."
git push origin avpmobile

