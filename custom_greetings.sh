#!/bin/bash

function custom_terminal_greeting() {
    echo -e "\033[1;34m"
    echo "     _______. __       ___      .______       __  ___      ___      "
    echo "    /       ||  |     /   \\     |   _  \\     |  |/  /     /   \\     "
    echo "   |   (----\`|  |    /  ^  \\    |  |_)  |    |  '  /     /  ^  \\    "
    echo "    \\   \\    |  |   /  /_\\  \\   |      /     |    <     /  /_\\  \\   "
    echo ".----)   |   |  |  /  _____  \\  |  |\\  \\----.|  .  \\   /  _____  \\  "
    echo "|_______/    |__| /__/     \\__\\ | _| \`._____||__|\\__\\ /__/     \\__\\ "
    echo -e "\033[0m"

    # Affichage de l'heure
    echo -e "\033[1;33m"
    echo "🕒 Heure locale : $(date '+%H:%M:%S')"
    echo -e "\033[0m"

    # Infos système
    echo -e "\033[1;32m"
    echo "💻 Mac Infos:"
    echo "   Nom du Mac : $(hostname)"
    echo "   Modèle     : $(sysctl -n hw.model)"
    echo "   CPU        : $(sysctl -n machdep.cpu.brand_string)"
    echo "   RAM        : $(sysctl -n hw.memsize | awk '{print $1/1073741824 " GB"}')"
    echo "   macOS      : $(sw_vers -productName) $(sw_vers -productVersion) ($(sw_vers -buildVersion))"
    echo "   Uptime     : $(uptime | sed 's/^.*up //; s/, .*//')"
    echo -e "\033[0m"

    # Infos météo
    echo -e "\033[1;36m"
    echo "🌤️ Météo actuelle :"
    city="Genève"
    api_key="api_key_openweathermap"
    weather=$(curl -s "http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=${api_key}&units=metric&lang=fr" | jq -r '.weather[0].description, .main.temp' 2>/dev/null)
    if [[ $weather != "null" ]]; then
        description=$(echo "$weather" | head -n1) # Première ligne : description
        temperature=$(echo "$weather" | tail -n1) # Deuxième ligne : température
        echo "   ${description}, ${temperature}°C à $city"
    else
        echo "   Service météo indisponible"
    fi
    echo -e "\033[0m"
}

function clear_() {
    command clear
    custom_terminal_greeting
}
