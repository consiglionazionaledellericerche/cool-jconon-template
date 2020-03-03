# Selezioni online - Progetto Template

Il progetto fornisce un esempio di come personalizzare in alcune sue parti la piattaforma [cool-jconon](https://github.com/consiglionazionaledellericerche/cool-jconon).

## Personalizzazione dei colori e del logo

Per la personalizzazione dei colori basta creare il file [custom.less](src/main/less/custom.less)   
Per il logo basta creare il [file](src/main/resources/META-INF/img/logo.png)

## Personalizzazione delle etichette e Internazionalizzazione

Per cambiare le etichette della pagina iniziale fare riferimento al [file](src/main/resources/i18n/home_it.properties)   

## Requisiti

Per l'avvio in locale occorre una istanza di [Alfresco](http://www.alfresco.com) attiva sulla porta 9080, la versione minima è la 5.0.1 Community.  

## Avvio locale

```bash
git clone https://github.com/consiglionazionaledellericerche/cool-jconon-template.git
cd cool-jconon-template
mvn clean spring-boot:run -Drepository.base.url=http://localhost:9080/alfresco/
```

L'applicazionre sarà attiva alla seguente URL: <http://localhost:8080/jconon>