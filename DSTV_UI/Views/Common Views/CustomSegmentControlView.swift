
import SwiftUI



struct HorizontalList: View {
    
    @State var viewModal: HorizontalViewModel
    @State var selectedItem: HorizontalModel?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center){
                ForEach(viewModal.lists,id:\.id) {  item in
                    Button(action: {
                        selectedItem = item
                        resetValue()
                    }, label: {
                        VStack() {
                            Text(item.title)
                                .foregroundColor(Color.white)
                            if let selectedItem  = selectedItem,item.id == selectedItem.id {
                                Divider()
                                    .frame(height: 5)
                                    .background(.blue)
                            }
                            Spacer()
                        }
                        .padding(margin8)
                    }).buttonStyle(PlainButtonStyle())
                }
            }
        }.background(Color.black)
            .onAppear(){
                if !viewModal.lists.isEmpty{
                    selectedItem = viewModal.lists[0]
                }
            }
    }
    private func  resetValue(){
        selectedItem?.selected = false
        for var item in viewModal.lists {
            item.selected = false
            if let selected = selectedItem, item.id == selected.id {
                item.selected = true
                selectedItem?.selected = true
            }
        }
    }
    
}

struct CustomSegmentControlView: View {
    
    @ObservedObject var viewModal: LiveTVViewModel
    @State var selectedItem: HorizontalModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModal.lists,id:\.id) {  item in
                    TextCell(item: selectedItem, selectedItem: selectedItem, lists: viewModal.lists)
                        .onAppear{
                            selectedItem = item
                        }
                }
            }
        }
    }
    private func  resetValue(selectedItem: HorizontalModel){
        for var item in viewModal.lists {
            item.selected = false
            if item.id == selectedItem.id {
                item.selected = true
                self.selectedItem.selected = true
            }
        }
    }
}

struct TextCell: View {

    var item: HorizontalModel
    @State var selectedItem: HorizontalModel
    var lists:[HorizontalModel]

    var body: some View {
        
        Button(action: {
            selectedItem = item
            resetValue()

        }, label: {
            VStack {
                Text(item.title)
                    .padding(4)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                if item.id == selectedItem.id  {
                    Divider()
                        .frame(height:5)
                        .background(Color.red)
                }
                Spacer()
            }
            .padding(margin8)
        })
    }
    private func  resetValue(){
        selectedItem.selected = false
        for var item in lists {
            item.selected = false
            if item.id == selectedItem.id {
                item.selected = true
                selectedItem.selected = true
            }
        }
    }
}
