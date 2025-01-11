document.addEventListener("DOMContentLoaded", async () => {
    const tipoMezzoSelect = document.getElementById("tipo-mezzo"); // Correzione qui
    const cercaButton = document.getElementById("cerca");  // Aggiungi questa riga per selezionare il bottone "Cerca"
    const mezzoList = document.getElementById("mezzo-list");  // Assicurati che mezzoList sia definito

    // Gestisce il click sul bottone "Cerca"
    cercaButton.addEventListener("click", async () => {
        const tipoMezzo = tipoMezzoSelect.value;
        const dataRitiro = document.getElementById("data-ritiro").value;
        const dataConsegna = document.getElementById("data-consegna").value;

        if (!tipoMezzo || !dataRitiro || !dataConsegna) {
            alert("Per favore, compila tutti i campi.");
            return;
        }

        try {
            const response = await fetch("http://localhost:5000/filtra_mezzi", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({
                    tipo_mezzo: tipoMezzo,
                    data_ora_ritiro: dataRitiro,
                    data_ora_consegna: dataConsegna,
                }),
            });

            if (response.ok) {
                const mezzi = await response.json();
                mezzoList.innerHTML = ""; // Pulisce i risultati precedenti

                if (mezzi.length > 0) {
                    mezzi.forEach(mezzo => {
                        const mezzoDiv = document.createElement("div");
                        mezzoDiv.className = "mezzo";
                        mezzoDiv.textContent = `${mezzo.modello} - ${mezzo.costo}€ - ${mezzo.n_posti} posti`;
                        mezzoList.appendChild(mezzoDiv);
                    });
                } else {
                    mezzoList.textContent = "Nessun mezzo disponibile per i criteri selezionati.";
                }
            } else {
                mezzoList.textContent = "Errore durante il caricamento dei mezzi.";
            }
        } catch (error) {
            console.error("Errore durante la richiesta di filtro:", error);
            mezzoList.textContent = "Errore durante il caricamento dei mezzi.";
        }
    });
});
