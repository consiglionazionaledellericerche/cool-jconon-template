# Selezioni online - Progetto Template

Il progetto fornisce un esempio di come personalizzare in alcune sue parti la piattaforma [cool-jconon](https://github.com/consiglionazionaledellericerche/cool-jconon).

## Personalizzazione dei colori e del logo

Per la personalizzazione dei colori basta creare il file [custom.less](src/main/less/custom.less)   
Per il logo basta creare il [file](src/main/resources/META-INF/img/logo.png)

## Personalizzazione delle etichette e Internazionalizzazione

Per cambiare le etichette della pagina iniziale fare riferimento al [file](src/main/resources/i18n/home_it.properties)   

## Avvio locale
```
mvn clean spring-boot:run -Drepository.base.url=http://localhost:9080/alfresco/
```

<http://localhost:8080/>