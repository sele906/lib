<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>WebSocket Chat</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        #chatBox {
            width: 100%;
            height: 300px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
            overflow-y: auto;
            padding: 10px;
        }
        #inputArea {
            display: flex;
        }
        #messageInput {
            flex: 1;
            padding: 5px;
            font-size: 14px;
        }
        #sendButton, #exitButton {
            padding: 5px 10px;
            font-size: 14px;
            cursor: pointer;
        }
        #exitButton {
            margin-left: 10px;
            background-color: red;
            color: white;
        }
    </style>
</head>
<body>
    <h1>WebSocket Chat</h1>
    <div id="chatBox"></div>
    <div id="inputArea">
        <input type="text" id="messageInput" placeholder="Type a message..." />
        <button id="sendButton">Send</button>
        <button id="exitButton">Exit</button>
    </div>

    <script>
        const chatBox = document.getElementById("chatBox");
        const messageInput = document.getElementById("messageInput");
        const sendButton = document.getElementById("sendButton");
        const exitButton = document.getElementById("exitButton");

        // WebSocket 연결 설정
        const socket = new WebSocket("ws://localhost:8080/socket.ws");

        // WebSocket 연결 성공 시 호출
        socket.onopen = () => {
            appendMessage("Connected to WebSocket server!");
        };

        // 서버로부터 메시지를 받았을 때 호출
        socket.onmessage = (event) => {
            appendMessage(event.data);
        };

        // WebSocket 연결 종료 시 호출
        socket.onclose = () => {
            appendMessage("Disconnected from WebSocket server.");
        };

        // WebSocket 에러 발생 시 호출
        socket.onerror = (error) => {
            console.error("WebSocket Error:", error);
            appendMessage("WebSocket error occurred.");
        };

        // 버튼 클릭 시 메시지 전송
        sendButton.addEventListener("click", sendMessage);
        // Enter 키 입력 시 메시지 전송
        messageInput.addEventListener("keypress", (event) => {
            if (event.key === "Enter") {
                sendMessage();
            }
        });

        // "나가기" 버튼 클릭 시 WebSocket 연결 종료
        exitButton.addEventListener("click", () => {
            if (socket.readyState === WebSocket.OPEN) {
                socket.close(); // WebSocket 연결 종료
                appendMessage("You have left the chat room.");
            } else {
                appendMessage("Connection is already closed.");
            }
        });

        // 메시지 전송 함수
        function sendMessage() {
            const message = messageInput.value.trim();
            if (message && socket.readyState === WebSocket.OPEN) {
                socket.send(message); // 서버로 메시지 전송
                appendMessage("You: " + message); // 본인이 입력한 메시지 표시
                messageInput.value = ""; // 입력창 초기화
            } else {
                appendMessage("Cannot send message. WebSocket is closed.");
            }
        }

        // 메시지를 채팅창에 추가
        function appendMessage(message) {
            const messageElement = document.createElement("div");
            messageElement.textContent = message;
            chatBox.appendChild(messageElement);
            chatBox.scrollTop = chatBox.scrollHeight; // 스크롤 맨 아래로 이동
        }
    </script>
</body>
</html>
