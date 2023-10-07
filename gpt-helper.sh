#!/bin/bash

# Funktion zur rekursiven Durchsuchung von Python- und HTML-Dateien
search_files() {
    local folder="$1"
    local depth="$2"
    local script_path="$3"

    # Durchsuche alle Dateien und Verzeichnisse im aktuellen Ordner
    for item in "$folder"/*; do
        if [ -d "$item" ]; then
            # Ausschließen von "__pycache__", "venv" und "uploads"
            if [ "$(basename "$item")" != "__pycache__" ] && [ "$(basename "$item")" != "venv" ] && [ "$(basename "$item")" != "uploads" ]; then
                # Rufe die Funktion rekursiv auf
                search_files "$item" "$((depth + 1))" "$script_path"
            fi
        elif [ -f "$item" ] && ([[ "${item##*.}" == "py" ]] || [[ "${item##*.}" == "html" ]]); then
            # Dateiname ohne Erweiterung
            local filename="$(basename "$item" .${item##*.})"
            # Pfad relativ zum Startordner des Skripts
            local relative_path="${item#$script_path}"
            
            # Füge 5 Zeilen Abstand zwischen den Dateien hinzu
            for ((i = 1; i <= 5; i++)); do
                echo "" >> output.txt
            done
            
            # Überschrift mit Dateiname und Pfad
            echo "Datei: $filename ($relative_path)" >> output.txt
            echo "--------------------------------------------------" >> output.txt
            
            # Kopiere den Inhalt der Datei in die Ausgabedatei
            cat "$item" >> output.txt
        fi
    done
}

# Startordner des Bash-Skripts
script_start_folder="$(pwd)"

# Ausgabedatei
output_file="output.txt"

# Lösche die Ausgabedatei, falls sie existiert
rm -f "$output_file"

# Starte die Suche nach Dateien
search_files "$script_start_folder" 0 "$script_start_folder"

# Füge den Verzeichnisbaum mit "tree" am Ende der Ausgabedatei hinzu
tree -I '__pycache__|venv' >> "$output_file"

echo "Die Inhalte der Dateien und der Verzeichnisbaum wurden in $output_file geschrieben."
