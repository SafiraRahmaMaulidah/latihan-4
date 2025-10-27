//
//  Networking.swift
//  latihan4
//
//  Created by MacBook Pro M1 on 08/10/25.
//

import Foundation
import SwiftyJSON
import Alamofire

class Networkinga{
    func ambilData() async{
        var daftarProduk: [Product]=[]
        AF.request("https://fakestoreapi.com/products/")
            .validate()
            .responseData { response in
                switch response.result{
                case.success(let data):
                    let json = JSON(data)
                    print("DATA MENTAHAN : ", json)
                    let productsArray = json.arrayValue
                    
                    for item in productsArray{
                        let namaProduk = item["title"].stringValue
                        print("NAMA PRODUK:", namaProduk)
                        let deskripsi = item["description"].stringValue
                        let idP = item["id"].intValue
                        let price = item["price"].doubleValue
                        
                        daftarProduk.append(
                            Product(title: namaProduk, price: price, desc: deskripsi, idProduct: idP)
                        )
                    }
                    print("SEMUA PRODUK", daftarProduk)
                case.failure(let error):
                    print(" error", error)
                }
            }
    }
}
