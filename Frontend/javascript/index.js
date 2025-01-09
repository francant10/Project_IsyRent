document.addEventListener("DOMContentLoaded", async () => {
    const userList = document.getElementById("mezzo-list");

    try {
        const response = await fetch("http://localhost:5000/mezzo");
        
        if (response.ok) {
            const users = await response.json();
            users.forEach(user => {
                const userDiv = document.createElement("div");
                userDiv.className = "mezzo";
                userDiv.textContent = `${user.modello} ${user.costo} - ${user.tipo_mezzo}`;
                userList.appendChild(userDiv);
            });
        } else {
            userList.textContent = "Nessun mezzo trovato.";
        }
    } catch (error) {
        userList.textContent = "Errore nel caricamento dei mezzi.";
        console.error(error);
    }
});
