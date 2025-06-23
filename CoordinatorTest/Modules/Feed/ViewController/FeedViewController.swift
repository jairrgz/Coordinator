import UIKit
import Combine

class FeedViewController: UIViewController {

    // MARK: - PROPERTIES
    var feedCoordinator: FeedCoordinator?
    private let viewModel: FeedViewModel
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Initialization
    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupBindings()
        viewModel.simulateServiceCall()
    }
    
    // MARK: - Private Methods
    private func setupBindings() {
        viewModel.serviceFailurePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.showCustomAlert()
            }
            .store(in: &cancellables)
    }
    
    private func showCustomAlert() {
        let alertController = UIAlertController(
            title: "Error de Servicio",
            message: "Ha ocurrido un error al cargar los datos",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "Volver al Login", style: .default) { [weak self] _ in
            self?.feedCoordinator?.navigateToLogin()
        }
        
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
