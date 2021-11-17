//
//  ListViewController.swift
//  TrabalhoPOO
//
//  Created by Matheus Torres on 16/11/21.
//

import UIKit

class ListViewController: UIViewController, ListViewControllerProtocol {
    
    // MARK: - PUBLIC PROPERTIES
    
    weak var delegate: ListViewControllerDelegate?
    
    // MARK: - PRIVATE PROPERTIES
    
    private let viewModel: ListViewModelProtocol
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
        return tableView
    }()
    
    private lazy var floatingButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 60, weight: .bold)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(addItem), for: .touchUpInside)
        button.layer.cornerRadius = 40
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        return button
    }()
    
    // MARK: - INITIALIZERS
    
    init(viewModel: ListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.getEntity().identifier
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - PRIVATE METHODS
    
    private func setupView() {
        view.backgroundColor = .white
        createViewHierarchy()
    }
    
    private func createViewHierarchy() {
        view.addSubview(tableView)
        view.addSubview(floatingButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            floatingButton.heightAnchor.constraint(equalToConstant: 80),
            floatingButton.widthAnchor.constraint(equalToConstant: 80),
            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            floatingButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
    @objc private func addItem() {
        delegate?.navigateToAddNewItem(with: viewModel.getEntity())
    }
}

// MARK: - UITableViewDataSource

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getItems().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell,
              let item = viewModel.getItems()[safe: indexPath.row] else {
                  return UITableViewCell()
              }
        cell.setup(with: item)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = viewModel.getItems()[safe: indexPath.row] else { return }
        viewModel.didRemove(at: indexPath.row)
        delegate?.navigateToEdit(item: item, with: viewModel.getEntity())
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if case .delete = editingStyle {
            viewModel.didRemove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
