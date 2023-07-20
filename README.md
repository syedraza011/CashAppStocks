# CashAppStocks

**The Architectural Approach**

 this app uses MVVM (Model-View_ViewModel) approach. The MVVM pattern is a design pattern that is used to separate the concerns of the application and facilitate us not only an easier way to unit testing, and maintainability but also the re-usability of our code.

i) StockResponse, Stock, and StockServicePrtocol:  are responsible for our data model service layer which is being used to fetch data from an external API (https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json)

ii) View:  ContentView struct is for the view or display of the list of stocks

iii) StockViewModel: this component is very important and is called by the main view where it acts like MVVM. it provides data behavior that is required by the 'contentView'.
`StockViewModel` exposes out @Published properties such as stocks in the app to view observes for changes. The `ViewModel` contains the business logic which calls the `StockService` to fetch available data.

Overall, the MVVM pattern does provide a clear separation of concerns, making it easier for the programmer to build a scaleable, maintainable app.

**The trade-offs you made and why** 
I was pretty confident right from the start about what am I going to use and what not but the only trade-off I can think of was after reading data i had to write two separate functions to format the data since it was not in the form which I was expecting like currency and the time stamp.

**How to run your project**
This project does not require any dependencies or anything just clone it from GitHub. Make sure to have XCode's latest versions and you should be good.
