
function setDatatable(element, columnDefs=[], order=[[0, 'asc']]) {
    $.fn.dataTable.moment('DD/MM/YYYY');
    $.fn.dataTable.moment('DD/MM/YYYY, HH:mm');

    $(element).DataTable({
        "columnDefs": columnDefs,
        "order": order,
        "language": {
            "decimal": ",",
            "thousands": ".",
            "lengthMenu": "_MENU_ εγγραφές ανά σελίδα",
            "zeroRecords": "Δεν υπάρχουν εγγραφές",
            "info": "(_START_ - _END_ από _TOTAL_ εγγραφές)",
            "infoEmpty": "Δεν υπάρχουν εγγραφές",
            "infoFiltered": "(εκ των _MAX_ εγγραφών)",
            "processing": "Ανάκτηση δεδομένων...",
            "search": "Φιλτράρισμα αποτελεσμάτων:",
            "paginate": {
                "first":    '<<',
                "previous": '<',
                "next":     '>',
                "last":     '>>'
            }
        },
    });
}


// Modal για προσθήκη νέου συγγραφέα
function modalAddAuthor(options) {
    
    // Reset modal
    $('#modal-add-author form')[0].reset();
    $('#modal-add-author .dlg-ok').off();

    // Callback for ok button
    $('#modal-add-author .dlg-ok').click(function(event) {
        //event.preventDefault();

        // Send ajax request to store new author
        $.ajax({
            url: "{% url 'api-store-author' %}",
            method: "post",
            data: {
                "author_name": $('#author_name').val(),
                "email": $('#author_email').val(),
                "bio": $('#author_bio').val(),
                "_token" : "{% csrf_token %}"
            },
            success: function (data) {
                if (options.onsuccess) {
                    options.onsuccess(data);
                }
            },
            error: function (xhr, status, err) {
                if (options.onError) {
                    options.error(xhr, status, err);
                }
            }
        });

        // dismish modal
        $('#modal-add-author').modal('hide');

    });

    // display modal
    $('#modal-add-author').modal('show');
}

// Modal για προσθήκη νέου συγγραφέα
function modalAddPublisher(e) {
    e.preventDefault();
    
}
