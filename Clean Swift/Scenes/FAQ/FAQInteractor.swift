protocol FAQBusinessLogic {
    func getFAQ()
}

final class FAQInteractor: FAQBusinessLogic {
    // MARK: - Properties
    var presenter: FAQPresentationLogic?
    private lazy var worker = FAQWorker()
    
    func getFAQ() {
        worker.getFAQ(completion: { [weak self] result in
            switch result {
            case .success(let data):
                let response = FAQModels.FAQData.Response(faq: data)
                self?.presenter?.presentFaqData(response: response)
            case .failure:
                let response = FAQModels.FAQData.Response(faq: nil)
                self?.presenter?.presentFaqData(response: response)
            }
        })
    }
}
