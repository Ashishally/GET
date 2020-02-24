//
//  ViewController.swift
//  Game
//
//  Created by MAC on 12/02/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
struct jsonStruct: Decodable {
    let name: String
    let capital : String
    let alpha3Code: String
    let region : String
    let subregion : String
    let alpha2Code : String

}


class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {

   
    @IBOutlet weak var tableView: UITableView!
    
    
    var arrData = [jsonStruct]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    func getData() {
        
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do { if error == nil {
            self.arrData =  try JSONDecoder().decode([jsonStruct].self, from: data!)
               
                for mainArray in self.arrData {
                    print(mainArray.name, ":", mainArray.capital, ":", mainArray.alpha3Code)
                    DispatchQueue.main.async { self.tableView.reloadData()
                    }
                }
                
                
                }
            } catch {
                    print(error.localizedDescription)
                }
        }.resume()
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.arrData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lblName.text = "Name : \(arrData[indexPath.row].name)"
         cell.lblCapital.text = "Capital : \(arrData[indexPath.row].capital)"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        let detail: DetailViewController = self.storyboard?.instantiateViewController(identifier: "detail") as! DetailViewController
    
        detail.strregion = "Region :  \(arrData[indexPath.row].region)"
        detail.strsubregion = "SubRegion :  \(arrData[indexPath.row].subregion)"
        detail.stralpha3 = "Alpha3Code : \(arrData[indexPath.row].alpha3Code)"
        detail.stralpha2 = "Alpha2Code : \(arrData[indexPath.row].alpha2Code)"
    
        
        
        
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
}



