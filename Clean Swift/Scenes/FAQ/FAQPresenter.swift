protocol FAQPresentationLogic {
    func presentFaqData(response: FAQModels.FAQData.Response)
}

final class FAQPresenter: FAQPresentationLogic {
    weak var viewController: FAQDisplayLogic?
    
    func presentFaqData(response: FAQModels.FAQData.Response) {
        guard let faqData = response.faq else {
            let viewModel = FAQModels.FAQData.ViewModel(faq: response.faq)
            viewController?.displayFaqData(viewModel: viewModel)
            return
        }
        
        let viewModel = FAQModels.FAQData.ViewModel(faq: faqData)
        viewController?.displayFaqData(viewModel: viewModel)
    }
}
