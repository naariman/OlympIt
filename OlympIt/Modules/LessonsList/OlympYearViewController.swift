import UIKit

final class OlympYearViewController: UIViewController, UISearchControllerDelegate {
    
    var completion: (URL) -> () = {_ in}
    
    let viewModel: OlympViewModel
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OlympTableViewCell.self)
        return tableView
    }()
    
    private var searchController: UISearchController = {
        let viewController = UISearchController(searchResultsController: nil)
        return viewController
    }()
    
    init(viewModel: OlympViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        viewModel.getOlymp()
        viewModel.completion = {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
        DispatchQueue.main.async {
            self.searchController.isActive = true
        }
    }
    
    func reload() {
        tableView.reloadData()
    }
    
    private func setupViews() {
        view.backgroundColor = ._37343B
        tableView.backgroundColor = ._37343B
        view.addSubview(tableView)
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .white
        navigationItem.searchController = searchController
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.searchBar.searchTextField.placeholder = "Что вы хотите найти?"
        searchController.searchBar.searchTextField.tintColor = .white
        searchController.searchBar.barStyle = .black
        searchController.searchBar.searchTextField.textColor = .white
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(26)
        }
    }
}

extension OlympYearViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OlympTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let olymp = viewModel.filteredData[indexPath.row]
        cell.configure(model: olymp)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completion(viewModel.lessons[indexPath.row].pdf!)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(UITableView.automaticDimension)
    }
}

extension OlympYearViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filteredData = viewModel.lessons

        if !searchText.isEmpty {
            viewModel.filteredData = viewModel.lessons.filter({ $0.year!.contains(searchText) })
        }
        print(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        presenter?.search(searchText: "")
    }
}
