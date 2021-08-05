INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(3, 'it.oil.maxsize', '5000000');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(6, 'it.oil.extPasswordSite', 'http://utenti.cnr.it');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(9, 'mail.recipient.type', 'TO');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(10, 'mail.config.pop.host', 'smtp.cnr.it');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(15, 'mail.config.div', '~~');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(14, 'mail.config.tag', '[concorsi]');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(16, 'it.oil.itemsInPage', '10');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(17, 'it.oil.pagesInNavigator', '10');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(20, 'mail.parser.schedule.config', '*/5 7-20 * * *');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(21, 'mail.smtp.from.name', 'Help Selezioni on-line');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(13, 'mail.config.pop.password', '********');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(12, 'mail.config.pop.user', '*******');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(5, 'it.oil.intPasswordManagement', 'enabled');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(11, 'mail.config.pop.protocol', 'pop3s');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(4, 'it.oil.ldap', 'disabled');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(24, 'it.oil.contextPath', 'http://localhost:9081');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(18, 'mail.smtp.host', 'smtp.nuovoente.it');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(19, 'mail.smtp.from', 'noreply@nuovoente.it');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(22, 'mail.smtp.password', 'password');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(23, 'mail.smtp.user', 'user');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(27, 'mail.smtp.port', '25');
INSERT INTO main_settings
(id_main_settings, "name", value)
VALUES(28, 'mail.smtp.authenticated', 'disabled');


INSERT INTO utente
(userid, "password", nome, cognome, profilo, e_mail, telefono, struttura, enabled, note, mail_stop, blurred)
VALUES('admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', 'admin', 3, '', '', null, 'y', '', 'y', NULL);


INSERT INTO utente
(userid, "password", nome, cognome, profilo, e_mail, telefono, struttura, enabled, note, mail_stop, blurred)
VALUES('mail', NULL, 'Processatore', 'E-mail', 1, '', NULL, null, 'y', NULL, 'y', NULL);

INSERT INTO strutture
(codice_struttura, descrizione, acronimo, evidenza, enabled)
VALUES('1', 'Nuovo Ente', 'NE', 'n', 'y');

INSERT INTO stato
(id_stato, descrizione)
VALUES(1, 'Open');
INSERT INTO stato
(id_stato, descrizione)
VALUES(2, 'Working');
INSERT INTO stato
(id_stato, descrizione)
VALUES(3, 'External');
INSERT INTO stato
(id_stato, descrizione)
VALUES(4, 'Closed');
INSERT INTO stato
(id_stato, descrizione)
VALUES(5, 'Verified');
INSERT INTO stato
(id_stato, descrizione)
VALUES(6, 'Validation Required');
INSERT INTO stato
(id_stato, descrizione)
VALUES(7, 'Validating');

INSERT INTO priorita
(livello, descrizione, predefinito)
VALUES(1, 'Bassa', NULL);
INSERT INTO priorita
(livello, descrizione, predefinito)
VALUES(2, 'Media', 'y');
INSERT INTO priorita
(livello, descrizione, predefinito)
VALUES(3, 'Alta', NULL);

INSERT INTO tipo_evento
(id_tipoevento, nome_tipo_evento, "template")
VALUES(0, 'Apertura Problema', 0);
INSERT INTO tipo_evento
(id_tipoevento, nome_tipo_evento, "template")
VALUES(1, 'Cambio Stato', 1);
INSERT INTO tipo_evento
(id_tipoevento, nome_tipo_evento, "template")
VALUES(2, 'Cambio Categoria', 2);
INSERT INTO tipo_evento
(id_tipoevento, nome_tipo_evento, "template")
VALUES(4, 'Cambio Esperto', 4);
INSERT INTO tipo_evento
(id_tipoevento, nome_tipo_evento, "template")
VALUES(5, 'Problema da Mail', 5);
INSERT INTO tipo_evento
(id_tipoevento, nome_tipo_evento, "template")
VALUES(7, 'Problema da Esperto', NULL);
INSERT INTO tipo_evento
(id_tipoevento, nome_tipo_evento, "template")
VALUES(3, 'Aggiunta Nota', 7);
INSERT INTO tipo_evento
(id_tipoevento, nome_tipo_evento, "template")
VALUES(6, 'Aggiunta Allegato', 8);

INSERT INTO task
(id, descrizione, taskclass)
VALUES(3, 'presa in carico di una segnalazione da parte di un validatore', 'it.cnr.helpdesk.StateMachineManagement.tasks.AssignProblemToValidatorTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(4, 'mail di notifica per tutti gli esperti di una categoria', 'it.cnr.helpdesk.StateMachineManagement.tasks.EmailEnvolvedExpertsTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(5, 'mail di notifica tra utente ed esperto', 'it.cnr.helpdesk.StateMachineManagement.tasks.EmailUserExpertTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(2, 'presa in carico di una segnalazione da parte di un esperto', 'it.cnr.helpdesk.StateMachineManagement.tasks.AssignProblemToExpertTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(6, 'mail di notifica tra esperto e validatore', 'it.cnr.helpdesk.StateMachineManagement.tasks.EmailExpertValidatorTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(7, 'mail di notifica per tutti i validatori di una categoria', 'it.cnr.helpdesk.StateMachineManagement.tasks.EmailEnvolvedValidatorTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(8, 'mail di notifica del cambio esperto di una segnalazione', 'it.cnr.helpdesk.StateMachineManagement.tasks.EmailExpertChangeTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(9, 'rilascio di una segnalazione da parte di un esperto', 'it.cnr.helpdesk.StateMachineManagement.tasks.ReleaseProblemByExpertTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(10, 'rilascio di una segnalazione da parte di un validatore', 'it.cnr.helpdesk.StateMachineManagement.tasks.ReleaseProblemByValidatorTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(11, 'riapertura di una segnalazione dopo il cambio della categoria', 'it.cnr.helpdesk.StateMachineManagement.tasks.ReopenProblemTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(12, 'mascheramento di un evento all''utente finale', 'it.cnr.helpdesk.StateMachineManagement.tasks.HideEventTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(13, 'abilitazione all''editing di una nota di cambiamento di stato', 'it.cnr.helpdesk.StateMachineManagement.tasks.MakeAlterableTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(14, 'disabilitazione all''editing di una nota di cambiamento di stato', 'it.cnr.helpdesk.StateMachineManagement.tasks.UnmakeAlterableTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(15, 'mail di notifica della risposta validata (con postilla)', 'it.cnr.helpdesk.StateMachineManagement.tasks.EmailValidationTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(16, 'Controlla se l''utente non Ã¨ disabilitato all''operazione', 'it.cnr.helpdesk.StateMachineManagement.tasks.CheckUserAbility');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(17, 'mail di notifica di cambio di stato per utente esterno', 'it.cnr.helpdesk.StateMachineManagement.tasks.EmailExternalUserTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(19, 'mail di notifica di cambio di stato per utente esterno anche con le note precedenti', 'it.cnr.helpdesk.StateMachineManagement.tasks.EmailExternalUserCompleteTask');
INSERT INTO task
(id, descrizione, taskclass)
VALUES(20, 'mail di invio allegato segnalazione ad utente esterno', 'it.cnr.helpdesk.StateMachineManagement.tasks.Attachment2ExternalUserTask');



INSERT INTO "template"
(id_template, template_email)
VALUES(4, '<?xml version="1.0" encoding="UTF-8"?>
<messaggio>
   <oggetto>
      <t>notifica di cambio esperto: "</t><titolo/><t>" (id:</t><idSegnalazione/><t>)</t>
   </oggetto>
   <contenuto>   <t>L''amministratore ha riassegnato il problema in oggetto all''esperto: </t><espertoNome/><t> (tel:</t><espertoTelefono/><t>, e-mail:</t><espertoEmail/><t>)
------------------------------------------------------------
Oggetto:"</t><titolo/><t>"
------------------------------------------------------------
Descrizione:
</t>
<descrizione/>
<t>
------------------------------------------------------------
Nota:
</t>
<nota/>
<t>
N.B.
QUESTA E_MAIL E'' GENERATA AUTOMATICAMENTE DAL SISTEMA DI HELP DESK.
SI PREGA DI NON RISPONDERE CON UNA E-MAIL MA DI INSERIRE OGNI EVENTUALE RISPOSTA O NOTA
TRAMITE L''APPLICAZIONE DI HELP DESK ACCESSIBILE DAL SITO </t><urlHelpdesk/>
   </contenuto>
</messaggio>
');
INSERT INTO "template"
(id_template, template_email)
VALUES(1, '<?xml version="1.0" encoding="UTF-8"?>
<messaggio>
   <oggetto>
       <t>notifica di cambio stato: "</t><titolo/><t>" (id:</t><idSegnalazione/><t>)</t>

   </oggetto>
   <contenuto>
<t>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot; /&gt;<br />
&lt;title&gt;Notifica&lt;/title&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
L''utente:</t><originatoreEventoNome/><t> &lt;br /&gt;<br />
ha cambiato lo stato del problema in oggetto da </t><oldStato/><t> a </t><stato/><t>&lt;br /&gt;<br />
------------------------------------------------------------&lt;br /&gt;<br />
Oggetto:&amp;quot;</t><titolo/><t>&amp;quot;&lt;br /&gt;<br />
------------------------------------------------------------&lt;br /&gt;<br />
Originatore: </t><originatoreProblemaNome/><t> (tel:</t><originatoreProblemaTelefono/><t>, e-mail:</t><originatoreProblemaEmail/><t>)&lt;br /&gt;<br />
------------------------------------------------------------&lt;br /&gt;<br />
Quesito:&lt;br /&gt;</t><descrizione/><t>&lt;br /&gt;<br />
------------------------------------------------------------&lt;br /&gt;<br />
Nota:&lt;br /&gt;</t><nota/><t>&lt;br /&gt;<br />
&lt;br /&gt;<br />
SI PREGA DI NON RISPONDERE a questo indirizzo e_mail.&lt;br /&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;<br />
</t>
   </contenuto>
</messaggio>');
INSERT INTO "template"
(id_template, template_email)
VALUES(5, '<?xml version="1.0" encoding="UTF-8"?>
<messaggio>
   <oggetto>
       <t>Notifica dell''HelpDesk di Selezioni online</t>

   </oggetto>
   <contenuto>
<t>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot; /&gt;<br />
&lt;title&gt;Notifica&lt;/title&gt;<br />
&lt;style&gt;<br />
.norm {<br />
font-family:Verdana, Geneva, sans-serif; <br />
font-size:14px;<br />
color:#009000;<br />
}<br />
.under {<br />
font-family:Verdana, Geneva, sans-serif; <br />
font-size:14px;<br />
text-decoration:underline;<br />
color:#CA4835;<br />
}<br />
.tit {<br />
font-family:Verdana, Geneva, sans-serif;<br />
font-size:14px;<br />
color: #00F;<br />
font-style:italic;<br />
}<br />
&lt;/style&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
&lt;p class=&quot;norm&quot; align=&quot;center&quot;&gt;Per confermare la segnalazione da Lei inviata all''helpdesk di Selezioni online, deve cliccare sull''immagine seguente: &lt;/p&gt;<br />
&lt;p align=&quot;center&quot;&gt;&lt;a href=&quot;</t><contextPath/><t>/pub/MailConfirm?cod=</t><codice/><t>&amp;id=</t><idSegnalazione/><t>&amp;instance=</t><instance/><t>&quot;&gt;&lt;img src=&quot;http://helpdesk.amministrazione.cnr.it/images/ok_help.gif&quot; alt=&quot;Conferma richiesta&quot; width=&quot;98&quot; height=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/p&gt;<br />
  &lt;p class=&quot;under&quot; align=&quot;center&quot;&gt;La mancata conferma non consentir&#224; la lettura della Sua segnalazione da parte degli esperti.&lt;/p&gt;<br />
  &lt;table width=&quot;634&quot; border=&quot;1&quot; align=&quot;center&quot; cellpadding=&quot;5&quot; class=&quot;norm&quot;&gt;<br />
  &lt;tr&gt;<br />
  &lt;td colspan=&quot;2&quot; align=&quot;center&quot; class=&quot;tit&quot;&gt;&lt;strong&gt;Dettaglio della segnalazione&lt;/strong&gt;&lt;/td&gt;<br />
  &lt;/tr&gt;<br />
  &lt;tr&gt;<br />
  &lt;td width=&quot;127&quot;&gt;mittente:&lt;/td&gt;<br />
  &lt;td width=&quot;441&quot;&gt;</t><originatoreProblemaNome/><t>&lt;/td&gt;<br />
  &lt;/tr&gt;<br />
  &lt;tr&gt;<br />
&lt;td&gt;categoria:&lt;/td&gt;<br />
&lt;td&gt;</t><categoria/><t>&lt;/td&gt;<br />
&lt;/tr&gt;  <br />
  &lt;tr&gt;<br />
  &lt;td&gt;oggetto:&lt;/td&gt;<br />
  &lt;td&gt;</t><titolo/><t>&lt;/td&gt;<br />
  &lt;/tr&gt;<br />
  &lt;tr&gt;<br />
  &lt;td&gt;messaggio:&lt;/td&gt;<br />
  &lt;td&gt;</t><descrizione/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;p align=&quot;center&quot; class=&quot;under&quot;&gt;ATTENZIONE:&lt;/p&gt;<br />
&lt;p align=&quot;center&quot; class=&quot;under&quot;&gt; ASSOLUTAMENTE non rispondere a questo indirizzo e-mail  poich&#233; i messaggi inviati non saranno ricevuti dagli esperti dell''Helpdesk. &lt;/p&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;
</t>
   </contenuto>
</messaggio>');
INSERT INTO "template"
(id_template, template_email)
VALUES(7, '<?xml version="1.0" encoding="UTF-8"?>
<messaggio>
   <oggetto>
       <t>Notifica dell''HelDesk per la segnalazione: "</t><titolo/><t>" (id:</t><idSegnalazione/><t>)</t>

   </oggetto>
   <contenuto>
<t>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot; /&gt;<br />
&lt;title&gt;Notifica&lt;/title&gt;<br />
&lt;style&gt;<br />
.norm {<br />
font-family:Verdana, Geneva, sans-serif; <br />
font-size:14px;<br />
color:#009000;<br />
}<br/>
.under {<br />
font-family:Verdana, Geneva, sans-serif; <br />
font-size:14px;<br />
text-decoration:underline;<br />
color:#CA4835;<br />
}<br />
.tit {<br />
font-family:Verdana, Geneva, sans-serif;<br />
font-size:14px;<br />
color: #00F;<br />
font-style:italic;<br />
}<br />
&lt;/style&gt;<br />
&lt;/head&gt;<br/>
&lt;body&gt;<br />
&lt;p class=&quot;tit&quot;&gt;Quesito:&lt;/p&gt;<br />
&lt;p&gt; </t><descrizione/><t>&lt;/p&gt;<br />
&lt;p class=&quot;tit&quot;&gt;Nota inserita:&lt;/p&gt;<br />
&lt;p&gt; </t><nota/><t>&lt;/p&gt;<br />
&lt;p&gt;&amp;nbsp;&lt;/p&gt;<br />
&lt;table width=&quot;80%&quot; border=&quot;0&quot;&gt;<br />
&lt;tr&gt;<br />
&lt;td width=&quot;12%&quot;&gt;&lt;a href=&quot;https://selezioni.agid.gov.it/helpdesk?id=</t><idSegnalazione/><t>&amp;azione=</t><action/><t>&quot;&gt;&lt;img src=&quot;http://helpdesk.amministrazione.cnr.it/images/quest.gif&quot; alt=&quot;Ricontatta&quot; width=&quot;98&quot; height=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/td&gt;<br />
&lt;td width=&quot;88%&quot;&gt;&lt;a href=&quot;https://selezioni.agid.gov.it/helpdesk?id=</t><idSegnalazione/><t>&amp;azione=</t><action/><t>&quot; class=&quot;under&quot;&gt;Desidero contattare l''HelpDesk (o &#232; stata richiesta un''integrazione di informazioni)&lt;/a&gt;&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;br /&gt;<br />
&lt;table width=&quot;634&quot; border=&quot;1&quot; align=&quot;center&quot; cellpadding=&quot;5&quot; class=&quot;norm&quot;&gt;<br />
&lt;tr&gt;<br />
&lt;td colspan=&quot;2&quot; align=&quot;center&quot; class=&quot;tit&quot;&gt;&lt;strong&gt;Dettaglio della segnalazione&lt;/strong&gt;&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr&gt;<br />
&lt;td width=&quot;127&quot;&gt;mittente:&lt;/td&gt;<br />
&lt;td width=&quot;441&quot;&gt;</t><originatoreProblemaNome/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr&gt;<br />
&lt;td&gt;oggetto:&lt;/td&gt;<br />
&lt;td&gt;</t><titolo/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;p align=&quot;center&quot; class=&quot;under&quot;&gt;ATTENZIONE:&lt;/p&gt;<br />
&lt;p align=&quot;center&quot; class=&quot;under&quot;&gt; ASSOLUTAMENTE non rispondere a questo indirizzo e-mail poich&#233; i messaggi inviati non saranno ricevuti dagli esperti dell''Helpdesk. &lt;/p&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;<br />
</t>
   </contenuto>
</messaggio>');
INSERT INTO "template"
(id_template, template_email)
VALUES(3, '<?xml version="1.0" encoding="UTF-8"?>
<messaggio>
   <oggetto>
      <t>Notifica dell''HelDesk per la segnalazione: "</t><titolo/><t>" (id:</t><idSegnalazione/><t>)</t>
   </oggetto>
   <contenuto>   
<t>
E'' stata aggiunta una nota alla segnalazione in oggetto:
</t>
<nota/>
<t>

---------------Dettagli della segnalazione------------------
ID:        </t><idSegnalazione/><t>

Oggetto:   </t><titolo/><t>

Stato:     </t><stato/><t>

Aggiunta da: </t><originatoreEventoNome/><t>
------------------------------------------------------------

                         AVVISO

Per eventuali risposte utilizzare il seguente link : 

https://selezioni.agid.gov.it/helpdesk?id=</t><idSegnalazione/><t>&amp;azione=n0


ASSOLUTAMENTE non rispondere a questo indirizzo e_mail poiche'' i messaggi inviati saranno automaticamente SCARTATI dal sistema.
</t>
   </contenuto>
</messaggio>');
INSERT INTO "template"
(id_template, template_email)
VALUES(0, '<?xml version="1.0" encoding="UTF-8"?>
<messaggio>
   <oggetto>
      <t>notifica di apertura problema: "</t><titolo/><t>" (id:</t><idSegnalazione/><t>)</t>
   </oggetto>
   <contenuto>
<t>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot; /&gt;<br />
&lt;title&gt;Notifica&lt;/title&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
L''utente:</t><originatoreEventoNome/><t> (tel:</t><originatoreEventoTelefono/><t>, e-mail:</t><originatoreEventoEmail/><t>)&lt;br /&gt;<br />
  ha aperto il seguente problema nella categoria: &amp;quot;</t><categoria/><t>&amp;quot;&lt;br /&gt;<br />
------------------------------------------------------------&lt;br /&gt;<br />
Oggetto:&amp;quot;</t><titolo/><t>&amp;quot;&lt;br /&gt;<br />
------------------------------------------------------------&lt;br /&gt;<br />
Descrizione:&lt;br /&gt;<br />
</t><descrizione/><t>&lt;br /&gt;<br />
&amp;lt;t&amp;gt;&lt;br /&gt;<br />
------------------------------------------------------------&lt;br /&gt;<br />
SI PREGA DI NON RISPONDERE a questo indirizzo e_mail.&lt;br /&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;<br />
</t>
   </contenuto>
</messaggio>');
INSERT INTO "template"
(id_template, template_email)
VALUES(2, '<?xml version="1.0" encoding="UTF-8"?>
<messaggio>
   <oggetto>
       <t>notifica di cambio categoria: "</t><titolo/><t>" (id:</t><idSegnalazione/><t>)</t>

   </oggetto>
   <contenuto>
<t>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot; /&gt;<br />
&lt;title&gt;Notifica&lt;/title&gt;<br />
&lt;/head&gt;&lt;body&gt;<br />
L''utente:</t><originatoreEventoNome/><t> (tel:</t><originatoreEventoTelefono/><t>, e-mail:</t><originatoreEventoEmail/><t>)&lt;br /&gt;<br />
ha cambiato categoria&lt;br /&gt;<br />
Oggetto:&amp;quot;</t><titolo/><t>&amp;quot;&lt;br /&gt;<br />
Descrizione:&lt;br /&gt;<br />
&lt;br /&gt;<br />
</t><descrizione/><t>&lt;br /&gt;<br />
&lt;br /&gt;<br />
SI PREGA DI NON RISPONDERE a questo indirizzo e_mail.<br />
&lt;/body&gt;<br />
&lt;/html&gt;<br />
</t>
   </contenuto>
</messaggio>');
INSERT INTO "template"
(id_template, template_email)
VALUES(6, '<?xml version="1.0" encoding="UTF-8"?>
<messaggio>
   <oggetto>
       <t>Notifica dell''HelDesk per la segnalazione: "</t><titolo/><t>" (id:</t><idSegnalazione/><t>)</t>

   </oggetto>
   <contenuto>
<t>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot; /&gt;<br />
&lt;title&gt;Notifica&lt;/title&gt;<br />
&lt;style&gt;<br />
.norm {<br />
font-family:Verdana, Geneva, sans-serif; <br />
font-size:14px;<br />
color:#009000;<br />
}<br/>
.under {<br />
font-family:Verdana, Geneva, sans-serif; <br />
font-size:14px;<br />
text-decoration:underline;<br />
color:#CA4835;<br />
}<br />
.tit {<br />
font-family:Verdana, Geneva, sans-serif;<br />
font-size:14px;<br />
color: #00F;<br />
font-style:italic;<br />
}<br />
&lt;/style&gt;<br />
&lt;/head&gt;<br/>
&lt;body&gt;<br />
&lt;p</t><t> class=&quot;norm&quot;&gt;PER L''INTEGRAZIONE DI INFORMAZIONI O PER ULTERIORI CHIARIMENTI RELATIVI A QUESTA COMUNICAZIONE CLICCARE L''IMMAGINE SOTTOSTANTE&lt;/p&gt;<br />
&lt;p&gt;</t><history/><t>&lt;/p&gt;<br />
&lt;p&gt;&amp;nbsp;&lt;/p&gt;<br />
&lt;table width=&quot;61%&quot; border=&quot;0&quot; align=&quot;center&quot;&gt;<br />
&lt;tr&gt;<br />
&lt;td width=&quot;12%&quot;&gt;&lt;a href=&quot;https://selezioni.agid.gov.it/helpdesk?id=</t><idSegnalazione/><t>&amp;azione=</t><action/><t>&quot;&gt;&lt;img src=&quot;http://helpdesk.amministrazione.cnr.it/images/quest.gif&quot; alt=&quot;Ricontatta&quot; width=&quot;98&quot; height=&quot;60&quot; /&gt;&lt;/a&gt;&lt;/td&gt;<br />
&lt;td width=&quot;88%&quot;&gt;&lt;a href=&quot;https://selezioni.agid.gov.it/helpdesk?id=</t><idSegnalazione/><t>&amp;azione=</t><action/><t>&quot; class=&quot;under&quot;&gt;- Desidero contattare nuovamente l''HelpDesk&lt;br/&gt;<br />
  - Mi &#232; stata richiesta un''integrazione di informazioni / documentazione&lt;/a&gt;&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;br /&gt;<br />
&lt;table width=&quot;634&quot; border=&quot;1&quot; align=&quot;center&quot; cellpadding=&quot;5&quot; class=&quot;norm&quot;&gt;<br />
&lt;tr&gt;<br />
&lt;td colspan=&quot;2&quot; align=&quot;center&quot; class=&quot;tit&quot;&gt;&lt;strong&gt;Dettaglio della segnalazione&lt;/strong&gt;&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr&gt;<br />
&lt;td width=&quot;127&quot;&gt;data conferma:&lt;/td&gt;<br />
&lt;td width=&quot;441&quot;&gt;</t><data_apertura/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr&gt;<br />
&lt;td&gt;mittente:&lt;/td&gt;<br />
&lt;td&gt;</t><originatoreProblemaNome/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr&gt;<br />
&lt;td&gt;categoria:&lt;/td&gt;<br />
&lt;td&gt;</t><categoria/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr&gt;<br />
&lt;td&gt;oggetto:&lt;/td&gt;<br />
&lt;td&gt;</t><titolo/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;p align=&quot;center&quot; class=&quot;under&quot;&gt;ATTENZIONE:&lt;/p&gt;<br />
&lt;p align=&quot;center&quot; class=&quot;under&quot;&gt; ASSOLUTAMENTE non rispondere a questo indirizzo e-mail poich&#233; i messaggi inviati non saranno ricevuti dagli esperti dell''Helpdesk. &lt;/p&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;<br />
</t>
   </contenuto>
</messaggio>');
INSERT INTO "template"
(id_template, template_email)
VALUES(8, '<?xml version="1.0" encoding="UTF-8"?>
<messaggio>
   <oggetto>
      <t>notifica di apertura problema: "</t><titolo/><t>" (id:</t><idSegnalazione/><t>)</t>
   </oggetto>
   <contenuto>
<t>
&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transitional//EN&quot; &quot;http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd&quot;&gt;<br />
&lt;html xmlns=&quot;http://www.w3.org/1999/xhtml&quot;&gt;<br />
&lt;head&gt;<br />
&lt;meta http-equiv=&quot;Content-Type&quot; content=&quot;text/html; charset=utf-8&quot; /&gt;<br />
&lt;title&gt;Notifica&lt;/title&gt;<br />
&lt;style&gt;<br />
.norm {<br />
font-family:Verdana, Geneva, sans-serif; <br />
font-size:14px;<br />
color:#009000;<br />
}  <br />
.under {<br />
font-family:Verdana, Geneva, sans-serif; <br />
font-size:14px;<br />
text-decoration:underline;<br />
color:#CA4835;<br />
}<br />
.tit {<br />
font-family:Verdana, Geneva, sans-serif;<br />
font-size:14px;<br />
color: #00F;<br />
font-style:italic;<br />
}<br />
&lt;/style&gt;<br />
&lt;/head&gt;<br />
&lt;body&gt;<br />
&lt;p class=&quot;norm&quot;&gt;La presente email contiene un allegato che &#233; stato aggiunto alla segnalazione in oggetto.&lt;/p&gt;<br />
&lt;p&gt; </t><originatoreEventoNome/><t>:&lt;/p&gt;<br />
&lt;p&gt; </t><descrizioneFile/><t>&lt;/p&gt; <br />
&lt;br /&gt;<br />
&lt;table width=&quot;634&quot; border=&quot;1&quot; align=&quot;center&quot; cellpadding=&quot;5&quot; class=&quot;norm&quot;&gt;<br />
&lt;tr&gt;<br />
&lt;td colspan=&quot;2&quot; align=&quot;center&quot; class=&quot;tit&quot;&gt;&lt;strong&gt;Dettaglio della segnalazione&lt;/strong&gt;&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr&gt;<br />
&lt;td width=&quot;127&quot;&gt;data conferma:&lt;/td&gt;<br />
&lt;td width=&quot;441&quot;&gt;</t><data_apertura/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr&gt;<br />
&lt;td&gt;categoria:&lt;/td&gt;<br />
&lt;td&gt;</t><categoria/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr&gt;<br />
&lt;td&gt;oggetto:&lt;/td&gt;<br />
&lt;td&gt;</t><titolo/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;tr&gt;<br />
&lt;td&gt;messaggio:&lt;/td&gt;<br />
&lt;td&gt;</t><descrizione/><t>&lt;/td&gt;<br />
&lt;/tr&gt;<br />
&lt;/table&gt;<br />
&lt;p align=&quot;center&quot; class=&quot;under&quot;&gt;ATTENZIONE:&lt;/p&gt;<br />
&lt;p align=&quot;center&quot; class=&quot;under&quot;&gt; ASSOLUTAMENTE non rispondere a questo indirizzo e-mail poich&#233; i messaggi inviati non saranno ricevuti dagli esperti dell''Helpdesk. &lt;/p&gt;<br />
&lt;/body&gt;<br />
&lt;/html&gt;<br />
</t>
   </contenuto>
</messaggio>');


INSERT INTO tipo_evento_task
(tipo_evento, task, transaction_required)
VALUES(2, 5, 'n');
INSERT INTO tipo_evento_task
(tipo_evento, task, transaction_required)
VALUES(3, 5, 'n');
INSERT INTO tipo_evento_task
(tipo_evento, task, transaction_required)
VALUES(0, 4, 'n');
INSERT INTO tipo_evento_task
(tipo_evento, task, transaction_required)
VALUES(4, 8, 'n');
INSERT INTO tipo_evento_task
(tipo_evento, task, transaction_required)
VALUES(2, 11, 'y');
INSERT INTO tipo_evento_task
(tipo_evento, task, transaction_required)
VALUES(0, 16, 'y');

INSERT INTO transition
(id, origine, destinazione)
VALUES(3, 1, 3);
INSERT INTO transition
(id, origine, destinazione)
VALUES(2, 1, 2);
INSERT INTO transition
(id, origine, destinazione)
VALUES(4, 1, 4);
INSERT INTO transition
(id, origine, destinazione)
VALUES(5, 1, 5);
INSERT INTO transition
(id, origine, destinazione)
VALUES(6, 1, 6);
INSERT INTO transition
(id, origine, destinazione)
VALUES(7, 1, 7);
INSERT INTO transition
(id, origine, destinazione)
VALUES(8, 2, 1);
INSERT INTO transition
(id, origine, destinazione)
VALUES(9, 2, 3);
INSERT INTO transition
(id, origine, destinazione)
VALUES(10, 2, 4);
INSERT INTO transition
(id, origine, destinazione)
VALUES(11, 2, 5);
INSERT INTO transition
(id, origine, destinazione)
VALUES(12, 2, 6);
INSERT INTO transition
(id, origine, destinazione)
VALUES(13, 2, 7);
INSERT INTO transition
(id, origine, destinazione)
VALUES(14, 3, 1);
INSERT INTO transition
(id, origine, destinazione)
VALUES(15, 3, 2);
INSERT INTO transition
(id, origine, destinazione)
VALUES(16, 3, 4);
INSERT INTO transition
(id, origine, destinazione)
VALUES(17, 3, 5);
INSERT INTO transition
(id, origine, destinazione)
VALUES(18, 3, 6);
INSERT INTO transition
(id, origine, destinazione)
VALUES(19, 3, 7);
INSERT INTO transition
(id, origine, destinazione)
VALUES(20, 4, 1);
INSERT INTO transition
(id, origine, destinazione)
VALUES(21, 4, 2);
INSERT INTO transition
(id, origine, destinazione)
VALUES(22, 4, 3);
INSERT INTO transition
(id, origine, destinazione)
VALUES(23, 4, 5);
INSERT INTO transition
(id, origine, destinazione)
VALUES(24, 4, 6);
INSERT INTO transition
(id, origine, destinazione)
VALUES(25, 4, 7);
INSERT INTO transition
(id, origine, destinazione)
VALUES(26, 5, 1);
INSERT INTO transition
(id, origine, destinazione)
VALUES(27, 5, 2);
INSERT INTO transition
(id, origine, destinazione)
VALUES(28, 5, 3);
INSERT INTO transition
(id, origine, destinazione)
VALUES(29, 5, 4);
INSERT INTO transition
(id, origine, destinazione)
VALUES(30, 5, 6);
INSERT INTO transition
(id, origine, destinazione)
VALUES(31, 5, 7);
INSERT INTO transition
(id, origine, destinazione)
VALUES(32, 6, 1);
INSERT INTO transition
(id, origine, destinazione)
VALUES(33, 6, 2);
INSERT INTO transition
(id, origine, destinazione)
VALUES(34, 6, 3);
INSERT INTO transition
(id, origine, destinazione)
VALUES(35, 6, 4);
INSERT INTO transition
(id, origine, destinazione)
VALUES(36, 6, 5);
INSERT INTO transition
(id, origine, destinazione)
VALUES(37, 6, 7);
INSERT INTO transition
(id, origine, destinazione)
VALUES(38, 7, 1);
INSERT INTO transition
(id, origine, destinazione)
VALUES(39, 7, 2);
INSERT INTO transition
(id, origine, destinazione)
VALUES(40, 7, 3);
INSERT INTO transition
(id, origine, destinazione)
VALUES(41, 7, 4);
INSERT INTO transition
(id, origine, destinazione)
VALUES(42, 7, 5);
INSERT INTO transition
(id, origine, destinazione)
VALUES(43, 7, 6);


INSERT INTO profilo (id_profilo,nome) VALUES
	 (1,'Utente'),
	 (2,'Esperto'),
	 (3,'Amministratore'),
	 (4,'Validatore'),
	 (0,'Public');


INSERT INTO transition_template
(transition, "template", profilo)
VALUES(4, 6, 2);

INSERT INTO "_authorization"
(profilo, transition)
VALUES(1, 23);
INSERT INTO "_authorization"
(profilo, transition)
VALUES(2, 4);
INSERT INTO "_authorization"
(profilo, transition)
VALUES(1, 20);
	 
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/About.jsp',0),
	 ('/About.jsp',1),
	 ('/About.jsp',2),
	 ('/About.jsp',3),
	 ('/About.jsp',4),
	 ('/AccessDenied.jsp',0),
	 ('/AccessDenied.jsp',1),
	 ('/AccessDenied.jsp',2),
	 ('/AccessDenied.jsp',3),
	 ('/AccessDenied.jsp',4);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/AggiuntaNota.jsp',1),
	 ('/AggiuntaNota.jsp',2),
	 ('/AggiuntaNota.jsp',3),
	 ('/AggiuntaNota.jsp',4),
	 ('/CambioCategoria.jsp',1),
	 ('/CambioCategoria.jsp',2),
	 ('/CambioCategoria.jsp',3),
	 ('/CambioCategoria.jsp',4),
	 ('/CambioStato.jsp',1),
	 ('/CambioStato.jsp',2);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/CambioStato.jsp',3),
	 ('/CambioStato.jsp',4),
	 ('/CategoryTree.jsp',1),
	 ('/CategoryTree.jsp',2),
	 ('/CategoryTree.jsp',3),
	 ('/CategoryTree.jsp',4),
	 ('/CategoryTreeFrame1.jsp',1),
	 ('/CategoryTreeFrame1.jsp',2),
	 ('/CategoryTreeFrame1.jsp',3),
	 ('/CategoryTreeFrame1.jsp',4);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/CategoryTreeFrame2.jsp',1),
	 ('/CategoryTreeFrame2.jsp',2),
	 ('/CategoryTreeFrame2.jsp',3),
	 ('/CategoryTreeFrame2.jsp',4),
	 ('/changePassword.jsp',1),
	 ('/changePassword.jsp',2),
	 ('/changePassword.jsp',3),
	 ('/changePassword.jsp',4),
	 ('/Contatti.jsp',0),
	 ('/Contatti.jsp',1);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/Contatti.jsp',2),
	 ('/Contatti.jsp',3),
	 ('/CreaFaq.jsp',2),
	 ('/CreaFaq.jsp',3),
	 ('/CreaSegnalazione.jsp',1),
	 ('/CreaSegnalazione.jsp',3),
	 ('/CreateCategory.jsp',3),
	 ('/CreateUser.jsp',3),
	 ('/DeleteFaqDetail.jsp',2),
	 ('/DeleteFaqDetail.jsp',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/DisabilitaEsperto.jsp',3),
	 ('/EventList.jsp',1),
	 ('/EventList.jsp',2),
	 ('/EventList.jsp',3),
	 ('/ExpertQBESettings.jsp',2),
	 ('/ExpertQBESettings.jsp',3),
	 ('/ExpertQueueDetail.jsp',2),
	 ('/ExpertQueueDetail.jsp',3),
	 ('/ExpertQueueDetail-p.jsp',2),
	 ('/ExpertQueueDetail-p.jsp',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/Faq.jsp',1),
	 ('/Faq.jsp',3),
	 ('/FaqDetail.jsp',1),
	 ('/FaqDetail.jsp',2),
	 ('/FaqDetail.jsp',3),
	 ('/FileAppend.jsp',1),
	 ('/FileAppend.jsp',2),
	 ('/FileAppend.jsp',3),
	 ('/FileSelect.jsp',1),
	 ('/FileSelect.jsp',2);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/FileSelect.jsp',3),
	 ('/Home.jsp',1),
	 ('/Home.jsp',2),
	 ('/Home.jsp',3),
	 ('/Home.jsp',4),
	 ('/index.html',0),
	 ('/index.html',1),
	 ('/index.html',2),
	 ('/index.html',3),
	 ('/index.html',4);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/InfoUtenti.jsp',2),
	 ('/InfoUtenti.jsp',3),
	 ('/loginForm.jsp',0),
	 ('/ManageCategory.jsp',3),
	 ('/ManageExpert.jsp',3),
	 ('/ManageExpert2.jsp',2),
	 ('/ManageExpert2.jsp',3),
	 ('/ManageUser.jsp',3),
	 ('/NotaDetail.jsp',1),
	 ('/NotaDetail.jsp',2);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/NotaDetail.jsp',3),
	 ('/NotaDetail.jsp',4),
	 ('/OilErrorPage.jsp',0),
	 ('/OilErrorPage.jsp',1),
	 ('/OilErrorPage.jsp',2),
	 ('/OilErrorPage.jsp',3),
	 ('/OilErrorPage.jsp',4),
	 ('/OilStyles.css',0),
	 ('/OilStyles.css',1),
	 ('/OilStyles.css',2);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/OilStyles.css',3),
	 ('/OilStyles.css',4),
	 ('/ProblemCountPerCategory.jsp',1),
	 ('/ProblemCountPerCategory.jsp',2),
	 ('/ProblemCountPerCategory.jsp',3),
	 ('/ProblemCountPerCategory.jsp',4),
	 ('/SegnalazioneDetail.jsp',1),
	 ('/SegnalazioneDetail.jsp',2),
	 ('/SegnalazioneDetail.jsp',3),
	 ('/SegnalazioneDetail.jsp',4);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/SegnalazioneDetail-p.jsp',1),
	 ('/SegnalazioneDetail-p.jsp',2),
	 ('/SegnalazioneDetail-p.jsp',3),
	 ('/SegnalazioneDetail-p.jsp',4),
	 ('/SegnalazioneView.jsp',1),
	 ('/SegnalazioneView.jsp',2),
	 ('/SegnalazioneView.jsp',3),
	 ('/SegnalazioneView.jsp',4),
	 ('/StatisticheDistribuzionePerCategoria.jsp',1),
	 ('/StatisticheDistribuzionePerCategoria.jsp',2);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/StatisticheDistribuzionePerCategoria.jsp',3),
	 ('/StatisticheDistribuzionePerCategoria.jsp',4),
	 ('/StatisticheDistribuzionePerStato.jsp',1),
	 ('/StatisticheDistribuzionePerStato.jsp',2),
	 ('/StatisticheDistribuzionePerStato.jsp',3),
	 ('/StatisticheDistribuzionePerStato.jsp',4),
	 ('/StatisticheTempiRisposta.jsp',1),
	 ('/StatisticheTempiRisposta.jsp',2),
	 ('/StatisticheTempiRisposta.jsp',3),
	 ('/StatisticheTempiRisposta.jsp',4);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/StruttureList.jsp',1),
	 ('/StruttureList.jsp',2),
	 ('/StruttureList.jsp',3),
	 ('/StruttureList.jsp',4),
	 ('/SwitchCategoria.jsp',3),
	 ('/SwitchUserStatus.jsp',3),
	 ('/UpdateCategory.jsp',3),
	 ('/UpdateFaq.jsp',2),
	 ('/UpdateFaq.jsp',3),
	 ('/UpdateFaqDetail.jsp',2);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/UpdateFaqDetail.jsp',3),
	 ('/UpdateUser.jsp',3),
	 ('/UpdateUserInfo.jsp',1),
	 ('/UpdateUserInfo.jsp',2),
	 ('/UpdateUserInfo.jsp',3),
	 ('/UpdateUserInfo.jsp',4),
	 ('/UserDetail.jsp',1),
	 ('/UserDetail.jsp',2),
	 ('/UserDetail.jsp',3),
	 ('/UserDetail.jsp',4);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/UserQueueDetail.jsp',1),
	 ('/UserQueueDetail.jsp',3),
	 ('/UserQueueDetail-p.jsp',1),
	 ('/UserQueueDetail-p.jsp',3),
	 ('/download/*',1),
	 ('/download/*',2),
	 ('/download/*',3),
	 ('/download/*',4),
	 ('/CreateMessage.jsp',2),
	 ('/CreateMessage.jsp',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/ManageMessage.jsp',2),
	 ('/ManageMessage.jsp',3),
	 ('/ProblemCountPerCategoryValidator.jsp',3),
	 ('/ProblemCountPerCategoryValidator.jsp',4),
	 ('/ValidatorQueueDetail.jsp',3),
	 ('/ValidatorQueueDetail.jsp',4),
	 ('/SwitchMessage.jsp',2),
	 ('/SwitchMessage.jsp',3),
	 ('/UpdateMessage.jsp',2),
	 ('/UpdateMessage.jsp',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/ManageValidator.jsp',3),
	 ('/RepositoryUpdate.jsp',4),
	 ('/RepositoryUpdate1.jsp',4),
	 ('/RepositoryUpdate3.jsp',4),
	 ('/RepositoryUpdate4.jsp',4),
	 ('/reports/*',4),
	 ('/MailConfirm.jsp',0),
	 ('/MailConfirm',0),
	 ('/Setup.jsp',3),
	 ('/CreateStrutture.jsp',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/ManageStrutture.jsp',3),
	 ('/SwitchStrutture.jsp',3),
	 ('/UpdateStrutture.jsp',3),
	 ('/TicketVerify.jsp',0),
	 ('/TicketVerify',0),
	 ('/CreaSegnalazioneEsperto.jsp',2),
	 ('/CreaSegnalazioneEsperto.jsp',3),
	 ('/SearchUser.jsp',2),
	 ('/SearchUser.jsp',3),
	 ('/SelectInstance.jsp',0);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/ChangeStateErrorPage.jsp',1),
	 ('/ChangeStateErrorPage.jsp',2),
	 ('/ChangeStateErrorPage.jsp',3),
	 ('/ChangeStateErrorPage.jsp',4),
	 ('/DeleteFile.jsp',4),
	 ('/NoToken.jsp',0),
	 ('/RepositoryQBE.jsp',4),
	 ('/RepositoryUpdate2.jsp',4),
	 ('/SelectProfile.jsp',0),
	 ('/SelectProfile.jsp',1);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/SelectProfile.jsp',2),
	 ('/SelectProfile.jsp',3),
	 ('/SelectProfile.jsp',4),
	 ('/UploadFile.jsp',4),
	 ('/UserMapping.jsp',3),
	 ('/Login.do',0),
	 ('/Logout.do',0),
	 ('/Logout.do',1),
	 ('/Logout.do',2),
	 ('/Logout.do',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/Logout.do',4),
	 ('/Home.do',0),
	 ('/Home.do',1),
	 ('/Home.do',2),
	 ('/Home.do',3),
	 ('/Home.do',4),
	 ('/GetCreateUser.do',3),
	 ('/CreateUser.do',3),
	 ('/GetUpdateUser.do',3),
	 ('/UpdateUser.do',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/ManageUser.do',3),
	 ('/ManageExpert.do',3),
	 ('/ManageExpert2.do',2),
	 ('/ManageExpert2.do',3),
	 ('/SwitchUserStatus.do',3),
	 ('/DisabilitaEsperto.do',3),
	 ('/GetUpdateUserInfo.do',1),
	 ('/GetUpdateUserInfo.do',2),
	 ('/GetUpdateUserInfo.do',3),
	 ('/GetUpdateUserInfo.do',4);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/UpdateUserInfo.do',1),
	 ('/UpdateUserInfo.do',2),
	 ('/UpdateUserInfo.do',3),
	 ('/UpdateUserInfo.do',4),
	 ('/GetCreateCategory.do',3),
	 ('/CreateCategory.do',3),
	 ('/GetUpdateCategory.do',3),
	 ('/UpdateCategory.do',3),
	 ('/SwitchCategoria.do',3),
	 ('/ManageCategory.do',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/GetChangePassword.do',1),
	 ('/GetChangePassword.do',2),
	 ('/GetChangePassword.do',3),
	 ('/GetChangePassword.do',4),
	 ('/ChangePassword.do',1),
	 ('/ChangePassword.do',2),
	 ('/ChangePassword.do',3),
	 ('/ChangePassword.do',4),
	 ('/StatisticheDistribuzionePerCategoria.do',1),
	 ('/StatisticheDistribuzionePerCategoria.do',2);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/StatisticheDistribuzionePerCategoria.do',3),
	 ('/StatisticheDistribuzionePerCategoria.do',4),
	 ('/StatisticheDistribuzionePerStato.do',1),
	 ('/StatisticheDistribuzionePerStato.do',2),
	 ('/StatisticheDistribuzionePerStato.do',3),
	 ('/StatisticheDistribuzionePerStato.do',4),
	 ('/StatisticheTempiRisposta.do',1),
	 ('/StatisticheTempiRisposta.do',2),
	 ('/StatisticheTempiRisposta.do',3),
	 ('/StatisticheTempiRisposta.do',4);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/SegnalazioneView.do',3),
	 ('/ProblemCountPerCategory.do',1),
	 ('/ProblemCountPerCategory.do',2),
	 ('/ProblemCountPerCategory.do',3),
	 ('/ProblemCountPerCategory.do',4),
	 ('/ExpertQueueDetail.do',2),
	 ('/ExpertQueueDetail.do',3),
	 ('/SegnalazioneDetail.do',1),
	 ('/SegnalazioneDetail.do',2),
	 ('/SegnalazioneDetail.do',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/SegnalazioneDetail.do',4),
	 ('/UserDetail.do',1),
	 ('/UserDetail.do',2),
	 ('/UserDetail.do',3),
	 ('/UserDetail.do',4),
	 ('/CambioCategoria.do',1),
	 ('/CambioCategoria.do',2),
	 ('/CambioCategoria.do',3),
	 ('/CambioCategoria.do',4),
	 ('/CategoryTreeFrame1.do',1);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/CategoryTreeFrame1.do',2),
	 ('/CategoryTreeFrame1.do',3),
	 ('/CategoryTreeFrame1.do',4),
	 ('/CambioStato.do',1),
	 ('/CambioStato.do',2),
	 ('/CambioStato.do',3),
	 ('/CambioStato.do',4),
	 ('/FileAppend.do',1),
	 ('/FileAppend.do',2),
	 ('/FileAppend.do',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/FileAppend.do',4),
	 ('/EventList.do',1),
	 ('/EventList.do',2),
	 ('/EventList.do',3),
	 ('/EventList.do',4),
	 ('/NotaDetail.do',1),
	 ('/NotaDetail.do',2),
	 ('/NotaDetail.do',3),
	 ('/NotaDetail.do',4),
	 ('/AggiuntaNota.do',1);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/AggiuntaNota.do',2),
	 ('/AggiuntaNota.do',3),
	 ('/AggiuntaNota.do',4),
	 ('/GetAggiuntaNota.do',1),
	 ('/GetAggiuntaNota.do',2),
	 ('/GetAggiuntaNota.do',3),
	 ('/GetAggiuntaNota.do',4),
	 ('/ExpertQBESettings.do',2),
	 ('/ExpertQBESettings.do',3),
	 ('/InfoUtenti.do',2);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/InfoUtenti.do',3),
	 ('/InfoUtenti.do',4),
	 ('/GetCreaFaq.do',2),
	 ('/GetCreaFaq.do',3),
	 ('/CreaFaq.do',2),
	 ('/CreaFaq.do',3),
	 ('/UpdateFaq.do',2),
	 ('/UpdateFaq.do',3),
	 ('/FaqDetail.do',1),
	 ('/FaqDetail.do',2);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/FaqDetail.do',3),
	 ('/GetUpdateFaqDetail.do',2),
	 ('/GetUpdateFaqDetail.do',3),
	 ('/UpdateFaqDetail.do',2),
	 ('/UpdateFaqDetail.do',3),
	 ('/DeleteFaqDetail.do',2),
	 ('/DeleteFaqDetail.do',3),
	 ('/UserQueueDetail.do',1),
	 ('/UserQueueDetail.do',3),
	 ('/GetCreaSegnalazione.do',1);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/GetCreaSegnalazione.do',3),
	 ('/CreaSegnalazione.do',1),
	 ('/CreaSegnalazione.do',3),
	 ('/FileSelect.do',1),
	 ('/FileSelect.do',3),
	 ('/Faq.do',1),
	 ('/Faq.do',3),
	 ('/StruttureList.do',1),
	 ('/StruttureList.do',2),
	 ('/StruttureList.do',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/StruttureList.do',4),
	 ('/CreateMessage.do',2),
	 ('/CreateMessage.do',3),
	 ('/ManageMessage.do',2),
	 ('/ManageMessage.do',3),
	 ('/ProblemCountPerCategoryValidator.do',3),
	 ('/ProblemCountPerCategoryValidator.do',4),
	 ('/ValidatorQueueDetail.do',3),
	 ('/ValidatorQueueDetail.do',4),
	 ('/SwitchMessage.do',2);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/SwitchMessage.do',3),
	 ('/UpdateMessage.do',2),
	 ('/UpdateMessage.do',3),
	 ('/ManageValidator.do',3),
	 ('/RepositoryQBE.do',4),
	 ('/RepositoryUpdate2.do',4),
	 ('/UploadFile.do',4),
	 ('/DeleteFile.do',4),
	 ('/UserMapping.do',3),
	 ('/MailConfirm.do',0);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/Setup.do',3),
	 ('/CreateStrutture.do',3),
	 ('/ManageStrutture.do',3),
	 ('/SwitchStrutture.do',3),
	 ('/UpdateStrutture.do',3),
	 ('/TicketVerify.do',0),
	 ('/GetCreaSegnalazioneEsperto.do',2),
	 ('/GetCreaSegnalazioneEsperto.do',3),
	 ('/CreaSegnalazioneEsperto.do',2),
	 ('/CreaSegnalazioneEsperto.do',3);
INSERT INTO page_security_mappings (uri,profile_id) VALUES
	 ('/SearchUser.do',2),
	 ('/SearchUser.do',3),
	 ('/SelectInstance.do',0),
	 ('/Switch.do',1),
	 ('/Switch.do',2),
	 ('/Switch.do',3),
	 ('/Switch.do',4),
	 ('/SelectProfile.do',0);

INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (1,'Problema',NULL,'Problema','y');
INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (11,'Tempo Indeterminato',1,'Tempo Indeterminato','y');
INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (10,'Tempo Determinato',1,'Tempo Determinato','y');
INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (7,'Borse di Studio',1,'Borse di Studio','y');
INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (9,'Assegni di Ricerca',1,'Assegni di Ricerca','y');
INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (12,'Mobilità',1,'Mobilità','y');
INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (8,'Direttori',1,'Direttori','y');
INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (13,'Selezioni per dipendenti',1,'Selezioni per dipendenti','y');
INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (552,'Concorsi Pubblici',1,'Concorsi Pubblici','y');
INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (553,'Reclutamento speciale',1,'Reclutamento speciale','y');
INSERT INTO public.categoria (id_categoria,nome,categoria_padre,descrizione,enabled) VALUES
    (554,'Categorie Protette',1,'Categorie Protette','y');
