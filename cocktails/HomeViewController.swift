//
//  ViewController.swift
//  cocktails
//
//  Created by Rachid Ben said on 01/04/2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    private var cocktails: Cocktails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        registerTableViewCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Api.shared.listCocktailsByLetter("a") { (cocktails) in
            if let cocktails = cocktails {
                self.cocktails = cocktails
                self.tableView.reloadData()
            } else {
                print("Could not fetch cocktails")
            }
        }
    }
    
    private func registerTableViewCells() {
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails?.drinks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ImageTableViewCell
        let cocktail = self.cocktails!.drinks[indexPath.row]
        
        cell.name?.text = cocktail.name
        cell.imgView?.fetchImage(from: cocktail.image)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let cell = sender as? ImageTableViewCell else { return }
        
        if let index = self.tableView.indexPath(for: cell)?.row {
            if let viewController = segue.destination as? DetailViewController {
                viewController.cocktail = self.cocktails?.drinks[index]
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
