<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nuova pizza</title>
                <link rel="stylesheet" href="style.css">
</head>
<body>
    <form action="./inserisci_db.php" method="post" enctype="multipart/form-data">
        <p>
            <label for="Nome">Nome: </label>
            <input type="text" name="nome"><br/>
        </p>

                <p>
            <label for="dati">Dati: </label>
            <input type="text" name="dati"><br/>
        </p>

        <p>
            <label for="descrizione">Descrizione: </label>
            <input type="text" name="descrizione"><br/>
        </p>

        <p>
            <label for="utente">Utente: </label>
            <input type="text" name="utente"><br/>
        </p>

        <p>
            Seleziona immagine da caricare:
            <input type="file" name="fileToUploadOwn">
        </p>        
        <p>
            Seleziona immagine da caricare:
            <input type="file" name="fileToUploadOld">
        </p>

        <button type="submit" name="save">Inserisci</button>
    </form>
</body>
</html>