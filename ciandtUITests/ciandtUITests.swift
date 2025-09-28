import XCTest

final class CityListUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        app.launch()
        
    }
    
    func testCityDetailNavigation() throws {
         let firstCell = app.buttons["local_10"]
         XCTAssertTrue(firstCell.waitForExistence(timeout: 10), "Não achou o o 'local_10 '")
         
         firstCell.tap()
         
         let detailTitle = app.staticTexts["cityDetailTitle"]
         XCTAssertTrue(detailTitle.waitForExistence(timeout: 10), "Não achou 'cityDetailTitle' na tela de detalhe")
     }
    
}
