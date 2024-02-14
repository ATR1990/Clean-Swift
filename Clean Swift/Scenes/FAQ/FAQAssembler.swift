import Foundation

final class FAQAssembler {
    static func assemble() -> FAQViewController {
        let interactor = FAQInteractor()
        let presenter = FAQPresenter()
        let router = FAQRouter()
        let viewController = FAQViewController()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
