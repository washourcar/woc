function initTypeAhead(elementToBeTypeAhead, typeAheadResourceName, url, limit) {
    limit = limit || 30;
    var suggestions = new Bloodhound({
        // the ajax response is an array of strings, but the Bloodhound
        // suggestion engine expects JavaScript objects so the filter method in remote option converts all of
        // those strings and tokenizer picks up the values with key as name
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        limit: limit,
        remote: {
            url: url+"%QUERY",
            filter: function(list) {
                return $.map(list, function (company) { return { name: company }; });
            },
            ajax: {
                dataType: 'jsonp',
                jsonp:'jsonp_callback',
                jsonpCallback: 'bbCallback',
                data: {
                    limit: limit
                }
            }
        }
    });
    suggestions.initialize();
    elementToBeTypeAhead.typeahead(null, {
        name: typeAheadResourceName,
        displayKey: 'name',
        source: suggestions.ttAdapter()
    });

    elementToBeTypeAhead.closest('.twitter-typeahead').on('click',' .empty-message',function(){
        $(this).hide();
    });
}