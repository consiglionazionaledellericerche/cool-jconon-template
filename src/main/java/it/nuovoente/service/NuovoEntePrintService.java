package it.nuovoente.service;

import it.cnr.cool.web.scripts.exception.CMISApplicationException;
import it.cnr.si.cool.jconon.service.PrintService;
import org.apache.chemistry.opencmis.client.api.Folder;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.io.InputStream;

@Primary
@Service
public class NuovoEntePrintService extends PrintService {

    @Override
    public String archiviaRicevutaReportModel(Folder application,
                                              InputStream is,
                                              String nameRicevutaReportModel,
                                              boolean confermata) throws CMISApplicationException {
        final String s = super.archiviaRicevutaReportModel(application, is, nameRicevutaReportModel, confermata);
        if (confermata) {
            /**
             * In questo momento pouò essere invocata la protocollazione della domanda inviata
             * nell' InputStream è presente il pdf della domanda inviata
             */
        }
        return s;
    }
}
