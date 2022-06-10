import SwiftUI

struct RecordView: View {
    @EnvironmentObject var sensorItemModelData: SensorItemModelData
    @State private var isRecording: Bool = false
    var imgStart: String = "record.circle"
    var imgLoading: String = "waveform.path"
    var imgColor: Color = .yellow
    var imgSize: CGFloat = 50.0
    var paddingBottom: CGFloat = 50.0
    var record = Record()
    
    var body: some View {
        VStack {
            Spacer()
            if !isRecording {
                Button(action: {
                    isRecording = true
                    record.StartRecording(for: sensorItemModelData.SensorItems)
                },
                       label:
                        { Image(systemName: imgStart)
                        .foregroundColor(imgColor)
                        .padding(.bottom,  paddingBottom)
                        .font(.system(size: imgSize))
                }
                )
            } else {
                Button(action: {
                    isRecording = false
                    record.StopRecording(for: sensorItemModelData.SensorItems)
                },
                       label:
                        { Image(systemName: imgLoading)
                        .foregroundColor(imgColor)
                        .padding(.bottom,  paddingBottom)
                        .font(.system(size: imgSize))
                }
                )
            }
        }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView().previewLayout(.sizeThatFits)
    }
}
