function pagination(arrayData, renderItemFn) {
    $('#pagination-container').pagination({
        dataSource: arrayData,
        pageSize: 3,
        showPrevious: true,
        showNext: true,
        callback: function (data, pagination) {
            const html = renderItemFn(data);
            $(mainContent).html(html);
            $("#pagination-container").css("display", "block")
        }
    });
}