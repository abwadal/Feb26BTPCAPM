sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"bookstoreapp/bookstoreapp/test/integration/pages/BooksList",
	"bookstoreapp/bookstoreapp/test/integration/pages/BooksObjectPage"
], function (JourneyRunner, BooksList, BooksObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('bookstoreapp/bookstoreapp') + '/test/flpSandbox.html#bookstoreappbookstoreapp-tile',
        pages: {
			onTheBooksList: BooksList,
			onTheBooksObjectPage: BooksObjectPage
        },
        async: true
    });

    return runner;
});

