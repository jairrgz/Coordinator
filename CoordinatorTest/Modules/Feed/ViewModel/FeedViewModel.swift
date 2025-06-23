import Foundation
import Combine

class FeedViewModel {
    // MARK: - Publishers
    private let serviceFailureSubject = PassthroughSubject<Void, Never>()
    var serviceFailurePublisher: AnyPublisher<Void, Never> {
        serviceFailureSubject.eraseToAnyPublisher()
    }
    
    // MARK: - Properties
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Methods
    func simulateServiceCall() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.serviceFailureSubject.send()
        }
    }
}