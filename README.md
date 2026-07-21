# Custom Terminal Greeting

This is a small Bash script I originally wrote for my own terminal setup and decided to upload to my GitHub as a simple personal utility.

It displays:

- A custom ASCII banner
- Current local time
- Basic macOS system information
- Current weather using the OpenWeather API

## Requirements

- Bash
- `curl`
- `jq`

## Setup

Before using the script, replace the following values with your own:

```bash
city="YourCity"
api_key="YOUR_OPENWEATHER_API_KEY"
```

You can get a free API key from https://openweathermap.org/api.

## Run

```bash
chmod +x custom_greeting.sh
./custom_greeting.sh
```

This is a simple personal script shared for convenience rather than a full-featured project.
