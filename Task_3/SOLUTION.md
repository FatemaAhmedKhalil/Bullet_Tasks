# Solution

### **Fix and Debugg the Server**
1. for Test Each Test 
```bash
cargo test test_client_add_request -- --nocapture
cargo test -- --test-threads=1
```

2. for Enhanceing the server to handle multiple clients.
```bash
# Spawn a new thread to handle each client connection
let is_running = Arc::clone(&self.is_running);
thread::spawn(move || {
    let mut client = Client::new(stream);
    while is_running.load(Ordering::SeqCst) {
        if let Err(e) = client.handle() {
            error!("Error handling client: {}", e);
            break;
        }
    }
});
```

3. 1. for Enhanceing the server to handle Diffrent Messages `Echo Message` and `Add Requst`.
```bash
# Decode the incoming message
if let Ok(decoded_message) = ClientMessage::decode(&buffer[..bytes_read]) {
    match decoded_message.message {
        # if the message is Echo Messege
        Some(client_message::Message::EchoMessage(echo_msg)) => {
            info!("Received EchoMessage: {}", echo_msg.content);
            # Echo back the message
            let payload = ServerMessage {
                message: Some(server_message::Message::EchoMessage(echo_msg)),
            };
            let encoded_message = payload.encode_to_vec();  # Encoding the message
            self.stream.write_all(&encoded_message)?;
        }
        # if the message is Add Request
        Some(client_message::Message::AddRequest(add_request)) => {
            info!(
                "Received AddRequest: a={}, b={}",
                add_request.a, add_request.b
            );
            # Prepare the AddResponse
            let add_response = ServerMessage {
                message: Some(server_message::Message::AddResponse(AddResponse {
                    result: add_request.a + add_request.b, # Prepare the Result of Add Request
                })),
            };
            let encoded_response = add_response.encode_to_vec();  # Encoding the response
            self.stream.write_all(&encoded_response)?;
        }
        # if the message is unknown Messege Type
        _ => {
            warn!("Received unknown message type");
        }
    }
} else {
    error!("Failed to decode message");
}

self.stream.flush()?;
Ok(())
```

After that the Server can Handle Tests in Single-Threaded Mode
```plaintext
running 5 tests
test test_client_add_request ... ok
test test_client_connection ... ok
test test_client_echo_message ... ok
test test_multiple_clients ... ok
test test_multiple_echo_messages ... ok
```

### **Transition the Server to Multi-threaded**
1.