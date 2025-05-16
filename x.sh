#!/bin/bash

BOLD="\e[1m"
RESET="\e[0m"
INVERTED="\e[7m"
GREEN_BOLD="\e[1;32m"
GRAY="\e[38;5;245m"
RED_BOLD="\e[1;31m"

PROFILE="navajogit"

get_projects() {
    curl -s "https://github.com/$PROFILE" |
        grep -oP "/$PROFILE/\K[^\"/]+" |
        sort -u
}

show_readme() {
    local project_name="$1"
    local readme_url="https://raw.githubusercontent.com/$PROFILE/$project_name/main/README.md"

    echo -e "\n${INVERTED} Showing README for project: ${GREEN_BOLD}$project_name${RESET}${INVERTED} ${RESET}"
    echo -e "${BOLD}File:${RESET} ${GREEN_BOLD}README.md${RESET}\n"

    curl -s "$readme_url" || echo -e "${RED_BOLD}ERROR:${RESET} README.md not found in project: ${GREEN_BOLD}$project_name${RESET}"

    echo -e "\n${GRAY}Press any key to return to menu...${RESET}"
    read -n 1 -s
}

while true; do
    echo -e "\n${INVERTED} GitHub README Viewer ${RESET}"
    echo -e "${BOLD}GitHub user:${RESET} ${GREEN_BOLD}$PROFILE${RESET}\n"

    projects=($(get_projects))

    if [ ${#projects[@]} -eq 0 ]; then
        echo -e "${RED_BOLD}ERROR:${RESET} No projects found for user ${GREEN_BOLD}$PROFILE${RESET}"
        exit 1
    fi

    echo -e "${BOLD}Available projects:${RESET}"

    index=1
    for project in "${projects[@]}"; do
        echo -e "${GRAY}[$index]${RESET} ${GREEN_BOLD}$project${RESET}"
        ((index++))
    done

    echo -e "${GRAY}[$index]${RESET} ${BOLD}Exit${RESET}"
    echo -ne "${BOLD}Select a project by number:${RESET} "
    read -r selection

    if [[ "$selection" =~ ^[0-9]+$ ]]; then
        if [ "$selection" -ge 1 ] && [ "$selection" -lt "$index" ]; then
            show_readme "${projects[$selection-1]}"
        elif [ "$selection" -eq "$index" ]; then
            echo -e "\n${BOLD}Goodbye!${RESET}"
            exit 0
        else
            echo -e "${RED_BOLD}Invalid selection. Please try again.${RESET}"
        fi
    else
        echo -e "${RED_BOLD}Invalid input. Please enter a number.${RESET}"
    fi
done
