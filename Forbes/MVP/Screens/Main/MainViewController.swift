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
    
    private lazy var presenter = MainPresenter(view: self)
    let detaleIdentifier = "DetaleViewController"
    let cellIdentifier = "PersonTableViewCell"
    var persons = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "List"
        presenter.viewDidLoad()
        tableView.register(PersonTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = (UIColor.systemGray)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return persons.count
}
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: cellIdentifier,
            for: indexPath
        ) as? PersonTableViewCell
        else { return UITableViewCell()}
        
        let person = persons[indexPath.item]
        cell.configure(person: person)
        return cell
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detaleScreen = DetaleViewController()
        let person = persons[indexPath.item]
        detaleScreen.configure(person: person)
        self.navigationController?.pushViewController(detaleScreen, animated: true)
        
    }
}
extension MainViewController: MainViewInput {
    func displayData(_ data: [Person]) {
        persons = data
        self.tableView.reloadData()
        
    }
}
