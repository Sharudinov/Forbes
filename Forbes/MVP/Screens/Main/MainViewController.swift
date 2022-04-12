//
//  MainViewController.swift
//  Forbes
//
//  Created by Мурад on 20.02.2022.
//

import UIKit

protocol MainViewInput: AnyObject {
    func displayData(_ data: [Person])
}

class MainViewController: UITableViewController {

    private enum Constant {

        enum Identifier {
            static let cellIdentifier = "PersonTableViewCell"
        }

        enum Screen {
            static let title = "List"
        }
    }
    
    private lazy var presenter = MainPresenter(view: self)

    private var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = Constant.Screen.title

        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: Constant.Identifier.cellIdentifier)

        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = (UIColor.systemGray)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MainViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.Identifier.cellIdentifier,
                for: indexPath
            ) as? PersonTableViewCell
        else {
            return UITableViewCell()
        }
        
        let person = persons[indexPath.item]
        cell.configure(person: person)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detaleScreen = DetaleViewController()
        let person = persons[indexPath.item]
        detaleScreen.configure(person: person)
        navigationController?.pushViewController(detaleScreen, animated: true)
    }
}

// MARK: - MainViewInput

extension MainViewController: MainViewInput {

    func displayData(_ data: [Person]) {
        persons = data
        self.tableView.reloadData()
    }
}
