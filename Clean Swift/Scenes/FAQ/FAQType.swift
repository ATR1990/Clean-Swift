// MARK: - FAQ
struct FAQType: Codable {
    let faq: [FAQElement]
}

// MARK: - FAQElement
struct FAQElement: Codable {
    let icon, title: String
}
