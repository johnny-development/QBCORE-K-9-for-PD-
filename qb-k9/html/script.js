window.addEventListener("message", (event) => {
    const action = event.data.action;
    if (action === "open") {
        document.getElementById("menu").style.display = "block";
    } else if (action === "close") {
        document.getElementById("menu").style.display = "none";
    }
});

document.querySelectorAll("button").forEach((button) => {
    button.addEventListener("click", (event) => {
        const id = event.target.id;
        if (id === "attack") {
            const targetId = document.getElementById("attackId").value;
            if (targetId) {
                fetch(`https://${GetParentResourceName()}/attack`, {
                    method: "POST",
                    body: JSON.stringify({ targetId }),
                });
            } else {
                alert("Please enter a valid target ID.");
            }
        } else {
            fetch(`https://${GetParentResourceName()}/${id}`, { method: "POST" });
        }
    });
});
