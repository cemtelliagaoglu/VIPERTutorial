import Cocoa

protocol MessagingProtocol{
    func messageFromSenderToReceiver(_ message: String)
}

class SenderClass{
    
    var delegate: MessagingProtocol?
    
    func sendMessage(_ message: String){
        // if delegate is referenced by a class, it sends the message
        delegate?.messageFromSenderToReceiver(message)
    }
}
    
class ReceiverClass: MessagingProtocol{
    func messageFromSenderToReceiver(_ message: String) {
        print("--Receiver got the message--")
        print("Sender says: \(message)")
    }
}

let senderClass = SenderClass()
let receiverClass = ReceiverClass()
// Here is the important part, connecting the receiver to sender
senderClass.delegate = receiverClass
senderClass.sendMessage("Do you hear me?")
