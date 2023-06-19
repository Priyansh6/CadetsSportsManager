import consumer from "channels/consumer"

consumer.subscriptions.create("RegistrationChannel", {
  connected() {
    console.log("Connected to registration channel.");
  },

  disconnected() {
    console.log("Disconnected from registration channel.");
  },

  received(data) {
    console.log("Received message:", data);
    // Update the view with the received data

    var splitdat = data.split("-");

    if (splitdat.length > 2 && splitdat[0] === "1") {
      const container = document.getElementById("new");
      container.innerHTML = data + container.innerHTML;
      increment_counter();
    }
  },

  send(message) {
    this.perform('receive', { message: message });
  }
});

function increment_counter() {
  const button = document.getElementById("seen");
  const counter = document.getElementById("count");

  counter.innerHTML = (parseInt(counter.innerHTML) + 1).toString();

  document.getElementById("count").style.cssText = "display: relative;";
  button.style.display = "block";
}