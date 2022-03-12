package it.cnr.si.cool.jconon.service;

import it.cnr.cool.web.scripts.exception.CMISApplicationException;
import org.apache.chemistry.opencmis.client.api.Folder;
import org.apache.chemistry.opencmis.client.api.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.io.InputStream;

@Primary
@Service
public class NuovoEntePrintService extends PrintService {
    private static final Logger LOGGER = LoggerFactory.getLogger(NuovoEntePrintService.class);

    @Override
    public String archiviaRicevutaReportModel(Session cmisSession,
                                              Folder application,
                                              InputStream is,
                                              String nameRicevutaReportModel,
                                              boolean confermata) throws CMISApplicationException {
        LOGGER.info("Start NuovoEntePrintService");
        final String s = super.archiviaRicevutaReportModel(cmisSession, application, is, nameRicevutaReportModel, confermata);
        if (confermata) {
            /**
             * In questo momento pouò essere invocata la protocollazione della domanda inviata
             * nell' InputStream è presente il pdf della domanda inviata
             */
        }
        LOGGER.info("End NuovoEntePrintService");
        return s;
    }
}
