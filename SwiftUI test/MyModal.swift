import SwiftUI

struct MyModal: View {
    @EnvironmentObject var answer : UserAnswer
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var moveToTouchTest : Bool = false
    @State private var moveToMonoTest = false
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundColor(.red)
                    .font(.system(size: 100))
                    .padding(.top)
                
                Text("This test requires a monofilament, if you do not have one press skip and move onto the Ipswich Touch Test")
                    .padding(.top, 30)
                    .padding(.bottom, 20)
                    .font(.title2)
                
                HStack {
                    NavigationLink(destination: Monofilament_test()) {
                        Text("Proceed")
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(isSelected ? Color.green : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .navigationTitle("Medical tool")
                    .simultaneousGesture(TapGesture().onEnded {
                        isSelected = true
                        isSelected2 = false
                    })
                    
                    NavigationLink(destination: IPSWICH_test())
                    {
                        Text("SKIP")
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(isSelected2 ? Color.green : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        isSelected = false
                        isSelected2 = true
                        answer.answerRecord[16] = "Test has skipped"
                    })
                }.navigationTitle("Medical tool")
            }
        }
    }
}


