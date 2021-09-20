## GESTIRE PROFILO SPRING PERSONALIZZATO

Creare il file `application-comune.yml` in `src/main/resources/config/` e scrivere i parametri di posta elettronica, le credenziali dei vari servizi (OIL, IO) e impostare il timer di protocollazione automatica secondo quanto concordato con l'ufficio Risorse Umane.

Per caricare il nuovo profilo, nel file `docker-compose.yml` inserire la variabile di ambiente nella definizione di jconon:

`- SPRING_PROFILES_ACTIVE=comune,prod`

## ATTIVARE SPID

### CERTIFICATI

Generare i certificati con https://github.com/italia/spid-compliant-certificates/ 

```
docker pull italia/spid-compliant-certificates:edge

docker run -ti --rm -v "/certificati-spid:/certs" 			\
italia/spid-compliant-certificates:edge generator 			\
--key-size 3072 							\
--common-name "https://concorsi.comune.xxxxx.it" 		        \
--days 3650    								\
--entity-id "https://www.comune.xxxxx.it"           			\
--locality-name "Bugliano"       					\
--org-id "PA:IT-c_XXX"    						\
--org-name "Comune di Bugliano"        					\
--sector public
```
creare il file `cert.pkcs12` ed impostare una password con il comando:

`openssl pkcs12 -export -inkey key.pem -in crt.pem -out cert.pkcs12`

copiare il file in:
	`src/main/resources/keystore/`
scrivere la password in: 
	`src/main/resources/idp.yml`

### METADATI

Se si dispone di un file dei metadati già compilato, modificarlo inserendo le righe interessate, poi rimuovere il tag `<signature>.*</signature>`

Scaricare xmltools da: https://wiki.shibboleth.net/confluence/display/XSTJ3/xmlsectool+V3+Home

Impostare JAVA_HOME e firmare il file xml usando i certificati generati al punto precedente con il comando:

`./xmlsectool.sh --sign --inFile sp.xml --outFile sp_metadata.xml --certificate crt.pem --keyFile key.pem`

Verificare la correttezza del file generato con https://github.com/italia/spid-saml-check (il file xml deve essere ospitato nel dominio dell’entityID)

Copiare il file dei metadati in: `src/main/resources/META-INF/metadata/sp/sp_metadata.xml`

In `src/main/resources/idp.yml` editare i seguenti dati in accordo con quanto scritto nel file metadata.xml:

```
attributeConsumingServiceIndex: 1
assertionConsumerServiceIndex: 1
issuer:
  entityId: https://www.comune.xxxxx.it
  name: Comune di Bugliano
```
Se il portale è l’unico servizio erogato tramite SPID, il file dei metadati da comunicare ad AgID si recupera da qui: https://url.tld/rest/static/metadata/sp/sp_metadata.xml

## AGGIUNTA CERTIFICATO API.IO.ITALIA.IT IN DOCKER ALPINE

Per inviare messaggi ad api.io.italia.it si deve caricare il certificato server Let's Encrypt nel keystore di java del container e ripetere l'operazione al rinnovo del certificato.

Creare il file api-italia-cron.sh
```
#!/bin/bash
echo -n | openssl s_client -connect api.io.italia.it:443 -servername api.io.italia.it | openssl x509 > /opt/api.io.italia.it.crt

/opt/jdk/bin/keytool -delete 			\
-alias api.io.italia.it 			\
-keystore /opt/jdk/jre/lib/security/cacerts 	\
-storepass changeit

/opt/jdk/bin/keytool -import 			\
-file /opt/api.io.italia.it.crt 		\
-alias api.io.italia.it 			\
-keystore /opt/jdk/jre/lib/security/cacerts 	\
-noprompt 					\
-storepass changeit
```
nel Dockerfile aggiugere:
```
COPY ./api-italia-cron.sh /opt/api-italia-cron.sh
```
eseguire un processo cron da host:
`docker exec -u 0  docker-compose_jconon_1 /opt/api-italia-cron.sh`

## LOCALIZZAZIONE DOCKER ALPINE

Per avere la localizzazione in Alpine bisogna applicarla in fase di generazione dell'immagine <sup>[riferimento](https://github.com/gliderlabs/docker-alpine/issues/144#issuecomment-436455850)</sup>. 
Creare il file `locale.md` con le lingue da attivare, ad esempio:
```
it_IT
en_US
```

Nel Dockerfile aggiungere
```
### LOCALIZZAZIONE ###############################################################################
RUN apk --no-cache add ca-certificates wget && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-i18n-2.25-r0.apk && \
    apk add glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk

# Iterate through all locale and install it
# Note that locale -a is not available in alpine linux, use `/usr/glibc-compat/bin/locale -a` instead
COPY ./locale.md /locale.md
RUN cat locale.md | xargs -i /usr/glibc-compat/bin/localedef -i {} -f UTF-8 {}.UTF-8

# Set the lang, you can also specify it as as environment variable through docker-compose.yml
ENV LANG=it_IT.UTF-8 \
    LANGUAGE=it_IT.UTF-8 \
    LC_ALL=it_IT.UTF-8
#################################################################################################
```

## FIRMA REMOTA

Utilizzare ARUBA OTP, inserire le seguenti proprietà in `alfresco-global.properties`:
```
arubaRemoteSignService.certId=AS0
arubaRemoteSignService.typeOtpAuth=firma
arubaRemoteSignService.url=https://arss.arubapec.it/ArubaSignService/ArubaSignService?wsdl
```


## LOG

Per inoltrare gli eventi di jconon ad un Loghost esterno, nel file `src/main/resources/logback.xml` indicare il **syslogHost**
```
<?xml version="1.0" encoding="UTF-8"?>

<!--
  ~    Copyright (C) 2019  Consiglio Nazionale delle Ricerche
  ~     This program is free software: you can redistribute it and/or modify
  ~     it under the terms of the GNU Affero General Public License as
  ~     published by the Free Software Foundation, either version 3 of the
  ~     License, or (at your option) any later version.
  ~
  ~     This program is distributed in the hope that it will be useful,
  ~     but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~     GNU Affero General Public License for more details.
  ~
  ~     You should have received a copy of the GNU Affero General Public License
  ~     along with this program.  If not, see <https://www.gnu.org/licenses/>.
  -->

<configuration scan="true">
    <appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <charset>utf-8</charset>
            <Pattern>[%p] %c:%L - %m%n</Pattern>
        </encoder>
    </appender>

    <appender name="FILE" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>logs/selezioni.%d{yyyy-MM-dd}.log</fileNamePattern>
            <maxHistory>90</maxHistory>
        </rollingPolicy>
        <encoder>
            <charset>utf-8</charset>
            <Pattern>%d %-5level [%thread] %logger{0}: %msg%n</Pattern>
        </encoder>
    </appender>
    <appender name="SYSLOG" class="ch.qos.logback.classic.net.SyslogAppender">
        <syslogHost>_________HOST_________</syslogHost>
        <port>514</port>
        <facility>LOCAL1</facility>
        <suffixPattern>concorsi | %d | %-5p | %c:%L | %t | %m%n</suffixPattern>
    </appender>

    <logger name="it.cnr" level="INFO"/>
    <logger name="org.springframework.web.filter" level="INFO"/>

    <contextListener class="ch.qos.logback.classic.jul.LevelChangePropagator">
        <resetJUL>true</resetJUL>
    </contextListener>

    <root level="INFO">
            <appender-ref ref="SYSLOG"/>
            <appender-ref ref="CONSOLE"/>
    </root>
</configuration>
```

## DOCKER ROOTLESS (OPZIONALE)

A partire da Docker Engine v20.10 si può eseguire il demone docker senza permessi di root, per fare questo aggiungere un utente sudo, ad esempio `userdocker`, poi installare uidmap e disabilitare docker
```
# apt install uidmap
# systemctl disable --now docker.service docker.socket
```

login via ssh con `userdocker`

```
dockerd-rootless-setuptool.sh install
systemctl --user start docker
systemctl --user enable docker
sudo loginctl enable-linger $(whoami)
```

Da questo momento il demone docker risulterà attivo solo con l’utente `userdocker` e la dir di appoggio è in `/home/userdocker/.local/share/docker/`

Per poter aprire porte sotto la 1024 con user normale in /etc/sysctl.conf: `net.ipv4.ip_unprivileged_port_start=80`
