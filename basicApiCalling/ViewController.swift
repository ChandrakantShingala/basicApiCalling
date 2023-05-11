//
//  ViewController.swift
//  basicApiCalling
//
//  Created by R82 on 30/01/23.
//

import UIKit

class User {
    
    var id: Int
    var name: String
    var email: String
    var gender: String
    var status: String
    
    //    init(id: Int, name: String, email: String, gender: String, status: String) {
    //
    //    }
    
    init(userDetails: Dictionary<String, AnyObject>) {
        
        id = userDetails["id"] as! Int
        name = userDetails["name"] as! String
        email = userDetails["email"] as! String
        gender = userDetails["gender"] as! String
        status = userDetails["status"] as! String
        
    }
    
}


//struct Users: Decodable{
//    let id: Int
//    let name: String
//    let email: String
//    let gender: String
//    let status: String
//}



class ViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    
    var arrUsers: [Dictionary<String, AnyObject>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getSingleUserDetail()
       // getUsers()
    }
    
    private func setup() {
        
    }
    
//    1.
//    private func getUsers() {
//        guard let ur1 = URL(string: "https://gorest.co.in/public/v2/users") else { return }
//        var request = URLRequest(url: ur1)
//        request.httpMethod = "GET"
//        request.httpBody = nil
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        URLSession.shared.dataTask(with: request) { data, responce, error in
//            guard let apiData = data else { return }
//            do {
//                let json = try JSONSerialization.jsonObject(with: apiData) as! [Dictionary<String, AnyObject>]
//                self.arrUsers = json
//                DispatchQueue.main.async {
//                    self.usersTableView.reloadData()
//                }
//
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        .resume()
//
//    }
//}

    
//    2.
//private func getUsers(){
//
//
//            guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
//                    var request = URLRequest(url: url)
//            request.httpMethod = "GET"
//            request.httpBody = nil
//            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            URLSession.shared.dataTask(with: request) { data, respones, error in
//                guard let apiData = data else { return }
//                do{
//                    let json = try JSONSerialization.jsonObject(with: apiData) as! [Dictionary<String, AnyObject>]
//                    self.arrUsers = json
//                    for i in 0..<json.count {
//                        let user: Users = Users(userDetails: json[i])
//    //                    arrUsers.append(user)
//                    }
//                    DispatchQueue.main.async {
//                        self.usersTableview.reloadData()
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//            .resume()
//        }
//    }
//

//3.

//private func getUsers()  {
//
//
//    guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
//    var request = URLRequest(url: url)
//    request.httpMethod = "GET"
//    request.httpBody = nil
//    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//    URLSession.shared.dataTask(with: request) { data, respones, error in
//        guard let apiData = data else { return }
//        do{
//            let json = try JSONSerialization.jsonObject(with: apiData) as! [Dictionary<String, AnyObject>]
//            self.arrUsers = json.map { Users(userDetails: $0)}
//            DispatchQueue.main.async {
//                self.usersTableview.reloadData()
//            }
//            DispatchQueue.main.async {
//                self.usersTableview.reloadData()
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    .resume()
//}
//}
//
//4.
//
//private func getSingleUserDetail(){
//        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
//                var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        request.httpBody = nil
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        URLSession.shared.dataTask(with: request) { data, respones, error in
//            guard let apiData = data else { return }
//            do{
//                let userDetailsDictionary = try JSONSerialization.jsonObject(with: apiData) as! [Dictionary<String, AnyObject>]
//                let user = Users(userDetails: userDetailsDictionary)
//                DispatchQueue.main.async {
//                    self.usersTableview.reloadData()
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        .resume()
//    }
//}


   private func getSingleUserDetail() {
        guard let url = URL(string: "https://gorest.co.in/public/v2/users") else { return }
                var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.httpBody = nil
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       URLSession.shared.dataTask(with: request) { data, respones, error  in
            guard let apiData = data else { return }
            do {
                let userDetailsDictionary = try JSONSerialization.jsonObject(with: apiData) as! Dictionary<String, AnyObject>
                DispatchQueue.main.async {
                let user = User(userDetails: userDetailsDictionary)

                }
        } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
}

}

    extension ViewController: UITableViewDelegate, UITableViewDataSource {
        
        func numberOfSections(ion tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return arrUsers.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: UITableViewCell = UITableViewCell()
            let rowDictanary = arrUsers[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = "\(rowDictanary["name"] as! String)"
            return cell
        }
    }
    
