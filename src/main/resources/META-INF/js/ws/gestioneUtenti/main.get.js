define(['jquery', 'header', 'cnr/cnr.url', 'cnr/cnr.ui.checkbox', 'cnr/cnr.ui', 'i18n', 'cnr/cnr.user', 'cnr/cnr.actionbutton', 'json!common', 'cnr/cnr.ace'], function ($, header, URL, Checkbox, UI, i18n, User, ActionButton, common, Ace) {
  "use strict";
alert('OVERRIDE JS SUCCESS gestioneUtenti/main.get.js');
  var table = $('<table>').addClass('table').addClass('table-hover').attr('id', 'gestione-utenti-table-data'),
    thead = $('<thead>').attr('id', 'gestione-utenti-table-data-head')
      .append(common.User.admin ? $('<th>').text(i18n['ricercaUtenti.flagEnable']) : '')
      .append($('<th>').text(i18n['ricercaUtenti.nome']))
      .append($('<th>').text(i18n['ricercaUtenti.cognome']))
      .append($('<th>').text(i18n['ricercaUtenti.email']))
      .append($('<th>')),
    tableBody = $('<tbody>').attr('id', 'gestione-utenti-table-data-body');

  $('#gestione-utenti-search div:last').before(Checkbox.Widget('id-smart-search', 'Ricerca estesa',  {name : 'smart-search', val : true}));

  // predisposto alla selezione del flag tramite radio
  function getMappedFields(idForm, flagSmart) {
    var mapping = {
      matricola: 'matricola',
      codiceFiscale: 'codicefiscale'
    },
      formSelector = '#' + idForm + ' input';

    return $.map($(formSelector), function (element) {
      var chiave = element.name,
        valore = $(element).val();

      if (valore) {
        return (mapping[chiave] || chiave)  + ':' + (flagSmart ? '*' + valore + '*' : valore);
      }
    });
  }

  function manageNazionalita(id, form) {
    if (id === 'italy' || id === undefined) {
      form.find("#foreign").hide();
      form.find("#italy").show();
    } else {
      form.find("#foreign").show();
      form.find("#italy").hide();
    }
  }

  function afterCreateForm(form) {
    form.find("#nazionalita > button.btn").on("click", function () {
      var id = $(this).attr('data-id'),
        value = $(this).attr('data-value');
      if (value) {
        manageNazionalita(id, form);
      }
    });
    manageNazionalita(form.find("#nazionalita > button.btn.active").attr('data-id'), form);
  }

  function createTable(renderFn) {

    var smartSearch = $('#id-smart-search').parents('.widget').data('value'),
      query = getMappedFields('gestione-utenti-search', smartSearch);

    if (query.length !== 0) {
      URL.Data.proxy.peopleSearch({
        data: {filter: query},
        traditional: true
      }).done(function (users) {
        renderFn(users.people);
      });
    }
  }

  function renderTable(users) {
    $('#gestione-utenti-table-data-body tr').remove();
    // fill
    $.each(users, function (index, user) {
      var row = $('<tr>'),
        firstName = $('<td>').text(user.firstName),
        lastName = $('<td>').text(user.lastName),
        email = $('<td>').text(user.email === "nomail" ? user.emailesterno : user.email),
        iconDisable =  $('<i>').addClass("icon-minus-sign"),
        iconEnable =  $('<i>').addClass("icon-ok-sign"),
        flag = $('<td>').append(
          $('<button class="abilitazioni btn">')
            .data('enabled', user.enabled)
            .data('userName', user.userName)
            .append(user.enabled ? iconEnable : iconDisable)
            .addClass(user.enabled ? "btn-success" : "btn-warning")
        ),
        actionButton = new ActionButton.actionButton({
          name: 'actionButton',
          allowableActions: ['CAN_UPDATE_PROPERTIES', 'CAN_DELETE_OBJECT']
        }, null, {
          select: function () {
            Ace.showMetadata(user.userName, true);
          },
          history: false,
          groups: function () {
            URL.Data.proxy.people({
              data: {
                groups: true
              },
              placeholder: {
                user_id: user.userName
              },
              success: function (data) {
                var content = $("<div>").addClass('modal-inner-fix'), ol = $('<ol>');
                $.each(data.groups, function (index, el) {
                  var a = $('<a>' + el.displayName + '</a>').attr('href', '#').click(function (eventObject) {
                    URL.Data.proxy.members({
                      placeholder: {
                        group_name: el.itemName
                      },
                      success: function (data) {
                        var contentMembers = $("<div>").addClass('modal-inner-fix'), olMembers = $('<ol>').appendTo(contentMembers);
                        $.each(data.people, function (index, el) {
                          $('<li>').append(el).appendTo(olMembers);
                        });
                        UI.modal(i18n.prop('label.members', el.displayName), contentMembers);
                      }
                    });
                  });
                  $('<li>').append(a).appendTo(ol);
                });
                content.append(ol);
                UI.modal(i18n.prop('label.gruppi', user.userName), content);
              }
            });
          },
          edit: common.User.admin ? function () {
            var content = $("<div>").addClass('modal-inner-fix'),
              bulkinfo = User.renderBulkInfo(user, afterCreateForm, content);

            function callback() {
              User.salvaAccount(bulkinfo, 'PUT', function (data) {
                if (data.error) {
                  UI.error(i18n['message.edit.ko']);
                } else {
                  UI.success(i18n['message.edit.ok'], function () {
                    createTable(renderTable);
                  });
                }
              });
            }
            function callbackClose() {
              content.remove();
            }
            UI.modal(i18n.prop('label.edit', user.userName), content, callback, callbackClose);
          } : false,
          remove: common.User.admin ? function () {
            var message = i18n['ricercaUtenti.confermaEliminaElemento'] + '<br />' + user.userName,
              selectedRow = $(this).parents('tr');

            UI.confirm(message, function (event) {
              var close = UI.progress();
              URL.Data.proxy.people({
                type: "DELETE",
                placeholder: {user_id: user.userName},
                success: function (data) {
                  selectedRow.remove();
                },
                complete: close
              });
            });
          } : false
        }, {groups: 'icon-group'}, undefined, true);
      if (common.User.admin) {
        row.append(flag);
      }
      row.append(firstName)
        .append(lastName)
        .append(email)
        .append($('<td>').append(actionButton))
        .appendTo(tableBody)
        .tooltip({
          placement: "right",
          title: user.userName
        });
    });

    if (users) {
      table.append(thead).append(tableBody);
      $('.table-container').append(table);
    }
  }

  tableBody.on('click', 'button.abilitazioni', function (event) {
    var target = $(event.currentTarget),
      userName = target.data('userName'),
      flagEnable  = target.data('enabled'),
      iconDisable =  $('<i>').addClass('con-minus-sign'),
      iconEnable =  $('<i>').addClass('icon-ok-sign');

    URL.Data.proxy.disableAccount({
      type: "POST",
      contentType: 'application/json',
      data: JSON.stringify({
        "userName": userName,
        "disableUser": flagEnable
      }),
      success: function (data) {
        // cambio il simbolo e aggiorno lo stato del bottone
        if (data.status === "enabled") {
          target.data('enabled', true);
          target.removeClass('btn-warning').addClass('btn-success');
          target.find('i').removeClass('icon-minus-sign').addClass('icon-ok-sign');
        } else if (data.status === "disabled") {
          target.data('enabled', false);
          target.removeClass('btn-success').addClass('btn-warning');
          target.find('i').removeClass('icon-ok-sign').addClass('icon-minus-sign');
        }

      },
      error: function (data) {
        var msg = flagEnable ? i18n.prop('message.error.disable', userName) : i18n.prop('message.error.enable', userName);
        UI.alert(msg);
      }
    });
  });

  $("#gestione-utenti-search").on('submit', function (event) {
    event.preventDefault();
    createTable(renderTable);
  });

});