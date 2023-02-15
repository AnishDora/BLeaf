
import SwiftUI

struct AddView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var textFieldText : String = ""
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type something here...",text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:55)
//                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                    .background(Color(UIColor.secondarySystemBackground
                                     ))
                    .cornerRadius(10)
                if (textFieldText.count > 0)
                {
                    Button (action : appendItem, label: {
                        Text("SAVE")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height:55)
                            .frame(maxWidth:.infinity)
                            .background(Color.accentColor )
                            .cornerRadius(10)
                    })
                }
                else{ Button (action : appendItem, label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .background(Color.accentColor )
                        .cornerRadius(10)
                })
                .disabled(true)
                }
               
            }
                .padding(14)
            }
            .navigationTitle("Add an Item")
        }
        func appendItem()
        {
            listViewModel.addItem(text: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    struct AddView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView
            {
                AddView()
            }
            .environmentObject(ListViewModel())
            
        }
    }

