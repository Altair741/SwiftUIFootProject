import SwiftUI

struct MyModal: View {
    @EnvironmentObject var answer : UserAnswer
    @State private var isSelected = false
    @State private var isSelected2 = false
    @State private var moveToTouchTest : Bool = false
    @State private var moveToMonoTest = false
    
    var body: some View {
        ZStack {
            Color.yellow
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
                        Text("Proceed")
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(isSelected ? Color.green : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    
                    .navigationTitle("Medical tool")
                    .simultaneousGesture(TapGesture().onEnded {
                        isSelected = true
                        isSelected2 = false
                        answer.haveMedicalTool = "yes"
                        print(answer.haveMedicalTool)
                    })
                    
                    
                        Text("SKIP")
                            .padding()
                            .frame(width: 120, height: 50)
                            .background(isSelected2 ? Color.green : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                    
                    .simultaneousGesture(TapGesture().onEnded {
                        isSelected = false
                        isSelected2 = true
                        answer.haveMedicalTool = "no"
                        answer.answerRecord[16] = "Test has skipped"
                        print(answer.haveMedicalTool)
                        print(answer.answerRecord[16])


                    })
                }.navigationTitle("Medical tool")
            }
        }
    }
}


