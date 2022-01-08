//
//  AuthorsTableViewController.swift
//  NewSwiftTest
//
//  Created by Arslan Abdullaev on 08.01.2022.
//

import UIKit

class AuthorsTableViewController: UITableViewController {
// MARK: - Properties
    
    let authors = Author.getInfo()
// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       authors.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        authors[section].fullname
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       2
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let author = authors[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        switch indexPath.row {
        case 0: content.text = "Посмотреть фото"
               
        default: content.text = "GitHub Логин: \(author.nickname)"
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
// MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var author = authors[indexPath.row]
        var row = indexPath.row
        let section = indexPath.section
        print(section)
        print(row)
        
        if row == 0 && section == 0 {
           performSegue(withIdentifier: "showPhoto", sender: author)
        } else if section == 1 && row == 0 {
            row = 1
            author = authors[row]
           performSegue(withIdentifier: "showPhoto", sender: author)
        }
        
    }
// MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.authors = sender as? Author
    }
}
