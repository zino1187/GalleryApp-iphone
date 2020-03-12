//
//  ListController.swift
//  GalleryApp
//
//  Created by zino-mac on 2020/03/12.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit


/*겔러리 한 건을 담게될 클래스 정의*/
class Gallery:Decodable{
    var gallery_id:Int
    var title:String
    var filename:String
    var regdate:String
    
    init(gallery_id:Int, title:String, filename:String, regdate:String){
        self.gallery_id = gallery_id
        self.title = title
        self.filename = filename
        self.regdate = regdate
    }
}
/*인스턴스를 한개 이상 포함할 클래스 선언 */
class GalleryList:Decodable{
    var list:[Gallery] = [Gallery]()
}

class ListController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        //원격지의 URL을 통해 json 데이터 가져오기 !!
        loadData()
    }
    
    func loadData(){
        let url = URL(string: "http://localhost:8888/list")
        
        //비동기 객체이용하여 요청하기!!!
        let urlSession = URLSession.shared
        
        //자바의 람다를 swift 에서는 클로저
        //클로저의 기본형식. {(매개변수)-> (반환형) in 코드영역}
        //익명함수: 주로 콜백함수로 많이 사용
        let task = urlSession.dataTask(with: url!, completionHandler: {(data, response, error) in
            //처리할 코드 작성 영역
            
            //print("서버에서 받은 데이터는 :  ",data)
            //육안으로 확인할려고 아래의 코드를 작성한 것뿐임
            
            let str = String(decoding:data! , as:UTF8.self)
            
            print(str);
            
            
            
            //json 데이터를 객체에 자동으로 담아줌..
            let decorder = JSONDecoder()
            
            do{
                var obj = try decorder.decode(GalleryList.self, from: data!)
                
                print("담겨진 객체수는 ", obj.list.count)
            }catch{
                print(error)
            }
            
            
        })
        
        task.resume()
        
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
