function setDatatable(element, columnDefs=[]) {
    $.fn.dataTable.moment('DD/MM/YYYY');
    $.fn.dataTable.moment('DD/MM/YYYY, HH:mm');

    $(element).DataTable({
        "columnDefs": columnDefs,
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

