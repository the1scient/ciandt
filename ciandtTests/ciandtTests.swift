import XCTest

@testable import ciandt

@MainActor

final class CityListViewModelTests: XCTestCase {
    
    // Mock repository
    
    class MockCityRepository: CityRepositoryProtocol {
        var shouldFail = false
        func fetchCities() async throws -> [City] {
            
            if shouldFail {
                throw URLError(.badServerResponse)
            } else {
                return [ City(id: 1, version: 1, name: "Mock City", description: "Desc", image: "", latitude: 0, longitude: 0, color: "", icon: "", tasksCount: 0) ]
            }
        }
    }
    
    func testFetchCitiesSuccess() async {
        let mockRepo = MockCityRepository()
        
        let viewModel = CityListViewModel(repository: mockRepo)
        
        await viewModel.fetchCities()
        
        XCTAssertEqual(viewModel.cities.count, 1)
        
        XCTAssertNil(viewModel.errorMessage)
        
        XCTAssertFalse(viewModel.isLoading)
        
    }
    
    func testFetchCitiesFailure() async {
        
        let mockRepo = MockCityRepository()
        
        mockRepo.shouldFail = true
        
        let viewModel = CityListViewModel(repository: mockRepo)
        
        await viewModel.fetchCities()
        
        XCTAssertEqual(viewModel.cities.count, 0)
        
        XCTAssertEqual(viewModel.errorMessage, "Erro ao carregar cidades.")
        
        XCTAssertFalse(viewModel.isLoading)
    }
    
}
