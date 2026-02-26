using BookService as service from '../../srv/service';

annotate service.Books with @(
    UI.SelectionFields       : [
        title,
        price,
        currency_code
    ],
    UI.LineItem              : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>TITLE}',
            Value: title,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>DESCR}',
            Value: descr,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>CAT_ID}',
            Value: category_ID,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>STOCK}',
            Value: stock,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>PRICE}',
            Value: price,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>CURRENCY_CODE}',
            Value: CDES,
        }
    ],

    UI.HeaderInfo            : {
        TypeName      : 'Book',
        TypeNamePlural: 'Book Details',
        Title         : {
            Label: 'Book title',
            Value: title
        },

        Description   : {
            Label: 'Description',
            Value: category.ID
        }
    },
    UI.Facets                : [{
        $Type : 'UI.CollectionFacet',
        Label : 'Book Detail',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Book Information',
                Target: '@UI.FieldGroup#BookDetails'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Stock and Price',
                Target: '@UI.FieldGroup#StockPrice'
            }
        ]
    }],

    UI.FieldGroup #BookDetails: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: title,
                Label: 'Book Title'
            },
            {
                $Type: 'UI.DataField',
                Label: 'Book Description',
                Value: descr
            }
        ]
    },

    UI.FieldGroup #StockPrice: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: stock,
                Label : 'Available Stock'
            },
            {
                $Type: 'UI.DataField',
                Value: price,
                Label : 'Price'
            },
            {
                $Type: 'UI.DataField',
                Value: CDES
            }
        ]
    }
);
