package camix.service;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;

import java.lang.reflect.Field;
import java.util.Hashtable;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.spy;

public class CanalChatTestEx1Mockito {
    private ClientChat clientChat;

    private CanalChat canalChat;

    private CanalChat canalChatPartiel;

    private final String id = "ID";

    @BeforeEach
    public void setUp() {
        clientChat = Mockito.mock(ClientChat.class);
        canalChat = new CanalChat("Test");
        canalChatPartiel = Mockito.spy(new CanalChat("test"));
    }


    @Test
    public void testAjoutClient_nonpresent_v1() {

        Mockito.when(clientChat.donneId()).thenReturn(id);

        canalChat.ajouteClient(clientChat);

        assertTrue(canalChat.estPresent(clientChat));
        assertEquals(1,canalChat.donneNombreClients());

        Mockito.verify(clientChat, Mockito.times(3)).donneId();
    }

    @Test
    public void testAjoutClient_present_v1() {
        Mockito.when(clientChat.donneId()).thenReturn("10");
        //pré-condition
        canalChat.ajouteClient(clientChat);
        //test
        canalChat.ajouteClient(clientChat);

        assertTrue(canalChat.estPresent(clientChat));
        assertEquals(1,canalChat.donneNombreClients());

        Mockito.verify(clientChat, Mockito.times(4)).donneId();
    }


    @Test
    public void testAjouteClient_nonPresent_v2() throws NoSuchFieldException, IllegalAccessException {
        Mockito.when(this.clientChat.donneId()).thenReturn(id);

        canalChat.ajouteClient(this.clientChat); // 2 appels

        Field field = CanalChat.class.getDeclaredField("clients");
        field.setAccessible(true);
        Hashtable clients = (Hashtable) field.get(canalChat);

        assertEquals(1, clients.size());
        assertTrue(clients.contains(clientChat));

        Mockito.verify(this.clientChat, Mockito.times(2)).donneId();
    }

    @Test
    public void testAjouteClient_Present_v2() throws NoSuchFieldException, IllegalAccessException {
        Mockito.when(this.clientChat.donneId()).thenReturn(id);

        canalChat.ajouteClient(this.clientChat);
        canalChat.ajouteClient(this.clientChat);

        Field field = CanalChat.class.getDeclaredField("clients");
        field.setAccessible(true);
        Hashtable clients = (Hashtable) field.get(canalChat);

        assertEquals(1, clients.size());

        Mockito.verify(this.clientChat, Mockito.times(3)).donneId();
    }

    @Test
    public void testAjoutClient_nonpresent_v3() throws NoSuchFieldException, IllegalAccessException {

        Mockito.when(clientChat.donneId()).thenReturn(id);

        Mockito.when(this.canalChatPartiel.estPresent(clientChat)).thenReturn(true);
        canalChat.ajouteClient(clientChat);

        Field field = CanalChat.class.getDeclaredField("clients");
        field.setAccessible(true);

        Hashtable<String, ClientChat> clients = (Hashtable) field.get(canalChat);

        assertEquals(1, clients.size());

        Mockito.verify(this.clientChat, Mockito.times(3)).donneId();
    }

    @Test
    public void testAjouteClient_present_v3() throws NoSuchFieldException, IllegalAccessException {
        Mockito.when(this.clientChat.donneId()).thenReturn(id);
        Mockito.when(this.canalChatPartiel.estPresent(this.clientChat)).thenReturn(true);

        canalChat.ajouteClient(this.clientChat); // 1 appel

        Field field = CanalChat.class.getDeclaredField("clients");
        field.setAccessible(true);
        Hashtable<String, ClientChat> clients = (Hashtable) field.get(canalChat);

        assertEquals(1, clients.size());

        Mockito.verify(this.clientChat, Mockito.times(3)).donneId();
    }
}