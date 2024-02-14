import UIKit
import Alamofire

protocol FAQWorkerProtocol {
    func getFAQ(
        completion: @escaping (Result<FAQType, AFError>) -> Void
    )
}

final class FAQWorker: FAQWorkerProtocol {
    func getFAQ(completion: @escaping (Result<FAQType, AFError>) -> Void) {
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "mocki.io"
        urlComponent.path = "/v1/ceea5aa4-b883-4ba6-b182-bf7dbab0f64f"

        guard let url = urlComponent.url else { return }

        AF.request(url)
            .validate()
            .responseDecodable(of: FAQType.self) { response in
                completion(response.result)
            }
    }
}
