

import Foundation
class ListViewModel: ObservableObject{
    @Published var items:[ItemModel]=[]
    var itemsList:String = "items_list"
    
    init(){
        getItems()
    }
    
    func getItems()
    {

        guard let items = UserDefaults.standard.data(forKey: itemsList) else {return}
        guard let savedData = try? JSONDecoder().decode([ItemModel].self, from: items)  else {return}
        self.items=savedData

    }
    
    func deleteItem(indexSet:IndexSet)
    {
        items.remove(atOffsets: indexSet)
        onSave()
    }
    func moveItem(from:IndexSet,to:Int)
    {
        items.move(fromOffsets: from, toOffset: to)
        onSave()
    }
    func addItem(text: String)
    {   let newItem=ItemModel(title: text, isCompleted:false)
        items.append(newItem)
        onSave()
    }
    func updateItem(item:ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index]=item.updateCompletion()
        }
        onSave()
        
    }
    func onSave(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsList)
        }
    }
}
