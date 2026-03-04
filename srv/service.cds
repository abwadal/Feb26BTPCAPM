using { sap.capire.bookstore as database } from '../db/schema';

service BookService {

    @readonly entity Books as projection on database.Books{
        *, 
        case currency.code
        when 'EUR' then 'EUR'
        when 'USD' then 'US Dollar'
        when 'GBP' then 'Great Britain Pound'
        end as CDES : String(20) @(title : '{i18n>CURRENCY}'),
        category as genre} excluding{ createdAt, createdBy, modifiedAt, modifiedBy };
    @readonly entity Authors as projection on database.Authors;

}

    

service OrdersService {

    @(restrict:[
            {
                grant: '*',
                to: 'Administrators'
            },
            {
                grant: '*',
                where: 'createdBy = $user'
            }
            
    ])
    entity Orders as projection on database.Orders;

    @(restrict:[
            {
                grant: '*',
                to: 'Administrators'
            },
            {
                grant: '*',
                where: 'parent.createdBy = $user'
            }
    ])
    entity OrderItems as projection on database.OrderItems;
}

using { AdminService } from '../node_modules/@sap/product-service-cds/srv/admin-service';
extend service AdminService with{
    entity Authors as projection on database.Authors;
}

annotate AdminService with @(requires: 'Administrators' );
