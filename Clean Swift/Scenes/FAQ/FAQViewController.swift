import UIKit
import SnapKit

protocol FAQDisplayLogic: AnyObject {
    func displayFaqData(viewModel: FAQModels.FAQData.ViewModel)
}

class FAQViewController: UIViewController {
    var interactor: FAQBusinessLogic?
    var router: FAQRoutingLogic?
    
    // MARK: - Private properties
    private var faq: [FAQElement]?
    
    // MARK: - UI
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(FAQTableViewCell.self)
        tableView.separatorInset = UIEdgeInsets(
            top: 0, left: 16, bottom: 0, right: 16
        )
        tableView.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9725490196, blue: 0.9803921569, alpha: 1)
        return tableView
    }()

    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setupConstraints()
        getFAQ()
    }
    
    // MARK: - Navigation bar
    private func setupNavigationBar() {
        self.navigationItem.title = "Частые вопросы"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: AppFont.semibold.s18()
        ]
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "previous_page"),
            style: .done,
            target: self,
            action: #selector(barButtonTapped))
        navigationController?.navigationBar.tintColor = .gray
    }
    
    // MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9725490196, blue: 0.9803921569, alpha: 1)
        view.addSubview(tableView)
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    private func getFAQ() {
        interactor?.getFAQ()
    }
    
    // MARK: - Actions
    @objc func barButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension FAQViewController: FAQDisplayLogic {
    func displayFaqData(viewModel: FAQModels.FAQData.ViewModel) {
        faq = viewModel.faq?.faq
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension FAQViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView, numberOfRowsInSection section: Int
    ) -> Int {
        return faq?.count ?? 0
    }

    func tableView(
        _ tableView: UITableView, cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            forIndexPath: indexPath
        ) as FAQTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.item = faq?[indexPath.row]
        cell.setCornerRadius(forIndexPath: indexPath, inTableView: tableView)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension FAQViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView, didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
