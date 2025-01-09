document.addEventListener("DOMContentLoaded", async () => {
    const userList = document.getElementById("user-list");

    try {
        const response = await fetch("http://localhost:5000/users");
        const users = await response.json();

        if (users.length > 0) {
            users.forEach(user => {
                const userDiv = document.createElement("div");
                userDiv.className = "user";
                userDiv.textContent = `${user.nome} ${user.cognome} - ${user.email}`;
                userList.appendChild(userDiv);
            });
        } else {
            userList.textContent = "Nessun utente trovato.";
        }
    } catch (error) {
        userList.textContent = "Errore nel caricamento degli utenti.";
        console.error(error);
    }
});
