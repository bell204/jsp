package com.kh.tc.server;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class WebSocket {

   private static Set<Session> clients = Collections
         .synchronizedSet(new HashSet<Session>());

   
   @OnOpen
   public void onOpen(Session session) {
      // Add session to the connected sessions set
      clients.add(session);
   }
   
   @OnMessage
   public void onMessage(String message, Session session) throws IOException {
      String[] me = message.split(", ");
      
      String userId = me[0];
      String receveId = me[1];
      String msgContent= me[2];
      synchronized (clients) {
         // Iterate over the connected sessions
         // and broadcast the received message
         for (Session client : clients) {
            if (!client.equals(session)) {
               client.getBasicRemote().sendText(msgContent);
            }
         }
      }
   }
  
   @OnClose
   public void onClose(Session session) {
      // Remove session from the connected sessions set
      clients.remove(session);
   }
   
}