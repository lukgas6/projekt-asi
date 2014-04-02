for i in 0..10
  Gist.create(
      lang: "js",
      description: "Some java script code",
      snippet:
      "Function.prototype.implementsFor = function( parentClassOrObject ){
      if ( parentClassOrObject.constructor === Function )
      {
          // Normal Inheritance
          this.prototype = new parentClassOrObject();
          this.prototype.constructor = this;
          this.prototype.parent = parentClassOrObject.prototype;
      }
      else
      {
          // Pure Virtual Inheritance
          this.prototype = parentClassOrObject;
          this.prototype.constructor = this;
          this.prototype.parent = parentClassOrObject;
      }
      return this;
  };   ")
end

for i in 0..10
  Gist.create(
      lang: "html",
      description: "Some HTML snippet",
      snippet:
          '    <div class="vevent">
    <h3 class="summary"><a class="url" href="http://www.event.url/" title="Event Title">Event Title</a></h3>
    <p class="description">Event Description</p>
    <ul>
    <li>Datetime: <abbr class="dtstart" title="20060615T1900+0900">June 15, 2006 - 19:00</abbr> to <abbr class="dtend" title="20060615T2100+0900">21:00</abbr></li>
    <li>Location: <span class="location">Location</span></li>
    </ul>
    </div>')
end

for i in 0..10
  Gist.create(
      lang: "java",
      description: "Java code",
      snippet:
          '	private volatile boolean connected = true;
private List<ServerClient> clients = Collections.synchronizedList(new ArrayList<ServerClient>());
private int port;

public Server(int port) {
this.port = port;
}

public boolean isConnected() {
return connected;
}

public void setConnected(boolean connected) {
this.connected = connected;
if (!this.connected) {
for (ServerClient client : this.clients) {
client.disconnect();
}
}
}

public void start() {
try {
ServerSocket server = ServerSocketFactory.getDefault()
.createServerSocket(this.port);
while (server.isBound() && this.isConnected()) {
Socket client = server.accept();
System.out.printf("Cliente conectado: %s%n", client.getInetAddress());
ServerClient serverClient = new ServerClient(client, this);
this.clients.add(serverClient);
}
} catch (Exception e) {
throw new RuntimeException(e);
}
}

public void onMessage(String message, ServerClient source) {
for (ServerClient client : this.clients) {
if (!client.equals(source)) {
client.onMessage(message);
}
}
}')
end