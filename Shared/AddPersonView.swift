//
//  AddPersonView.swift
//  HelloRedux
//
//  Created by Metin Atalay on 4.06.2022.
//

import SwiftUI

struct AddPersonView: View {
    
    @State private var name : String = ""
    @EnvironmentObject  var store : Store<AppState>
    
    struct Props{
        var personList : [Person]
        
        //distpatch
        var addPerson: (Person) -> ()
    }
    
    private func map(state: PersonState) -> Props {
    
        return Props(personList: state.person) { person in
            store.dispatch(action: AddPersonAction(person: person))
        }
    
    }
    
    var body: some View {
        
        let props = map(state: store.state.personState)
        
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button ("Add Person") {
                
                props.addPerson(Person(name: self.name))
                
            }

            Spacer()
            
            List(props.personList, id: \.id ) { person in
                Text(person.name)
            }
            
            
            
        }
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store (reducer: appReducer, state: AppState())
        
        AddPersonView().environmentObject(store)
    }
}
