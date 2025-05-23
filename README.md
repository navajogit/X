# Terminal-Based GitHub README Lister

If you're building a linux or windows VM and need a fast list of files and drivers to install without a brovser and you're tired of navigating through GitHub's web interface just to find a project README or script with this actions in a raw url verssion, this tool is exactly what you need.

With this approach, you can instantly access all your project README files or scripts directly from the terminal, without having to remember or manually type paths. Plus, you can run scripts and access resources quickly without ever leaving your terminal.


- Scans all visible repositories in your GitHub profile
- Builds direct raw url to README.md file for each project
- Displays a clean, interactive list in your terminal
- Enables running scripts or any other predefined terminal commands

---

## Why It's Useful

- **No More Manual URL Typing**  
  You no longer need to memorize or type out long raw URLs for each project. The script dynamically fetches the URLs, saving time.

- **Quick Access to Projects**  
  Forget opening your browser and manually finding each repository. Use the terminal to instantly view all your projects in a list. This allows you to focus on your code, not navigation.

- **Run Scripts with Ease**  
  You can easily run predefined scripts from your GitHub projects directly from the terminal. No need to hunt through files or search for specific scripts in a repository. Just execute them with a simple command.

- **Fully Customizable**  
  You can adapt the script to your needs by modifying the list of files, adding shortcuts for frequently used scripts, or even customizing the way the menu is displayed.

---

## How It Works

1. Add this line to your GitHub profile bio:

   ```RUN curl https://raw.githubusercontent.com/YOURUSERNAME/X/main/x.sh | bash,```

   Alternatively, you can use any recognizable placeholder like:

   ```LAUNCH curl https://raw.githubusercontent.com/YOURUSERNAME/X/main/x.sh | bash,```


**OR IF YOU WANT INSTANT ACCES TO LIST OF COMMANDS:**

- those will work if you add a 'list' file with those commands to some of your projects and add fallowing string to your bio:
```RUN curl -s https://raw.githubusercontent.com/YOURUSERNAME/X/main/list , curl -k https://github.com/YOURUSERNAME | findstr "RUN"```

Then to get them in termianal you need only typpe:

**4 LINUX:**

to display:

```curl -s https://github.com/YOURUSERNAME | grep -oPm 1 "curl[^*]+list" | bash```

to show command:

```curl -s https://github.com/YOURUSERNAME | grep -oPm 1 "curl[^*]+list" ```

**4 WIN:**

```curl -k https://github.com/YOURUSERNAME | findstr "RUN"```

and curl your output


**3. REBEMBER ONLY YOUR USERPROFILE AND ONE OF EACH COMMANDS TO GET WHAT YOU NEED IN YOUR TERMIANAL:**



**TO RUN:**

**In the terminal, go:**

   ```curl -s https://github.com/YOURUSERNAME | grep -oPm 1 'RUN \K[^,]+' | bash```

**or to display command without running it:**

   ```curl -s https://github.com/YOURUSERNAME | grep -oPm 1 'RUN \K[^,]+'```

**or better run:**

   ```bash <(curl -s https://github.com/YOURUSERNAME | grep -oPm 1 'RUN \K[^,]+')```

   This will:
   - Fetch your GitHub profile page
   - Look for the `RUN` command placeholder stoping at the "," sign
   - Automatically execute it or diplay it in the terminal


**you can add this command as an alias:**
alias xv='bash <(curl -s https://raw.githubusercontent.com/YOURUSERNAME/X/main/x.sh)'
**or as s custom command in /usr/local/bin**

3. The script will:
   - Extract your GitHub username
   - Detect all vivible in the main profile projects 
   - Generate a dynamic list of raw README links (you can cutomize it to detect some other files like scripts with a specific name)
   - Allow you to view any README or launch a script with one simple selection

---

## Example Use Case

Imagine you have multiple projects like:

- `X-terminal-tool`
- `X-image-scraper`
- `X-audio-processor`

You add this line to your GitHub profile bio or README:

```RUN bash <(curl -s https://raw.githubusercontent.com/YOURUSERNAME/X/main/x.sh)```

The name of the project and file depends on your needs. 

**Now, from any terminal, you can run:**

```eval $(curl -s https://github.com/YOURUSERNAME | grep -oP 'RUN \K.*')```

And instantly:
- See a full list of all your projects
- View a README for any project
- Modify and view scripts on the fly

---

## Additional Features and Customization to be done:

- **Filter the Projects**  
  Customize the script to list only certain types of projects (e.g., ```-projects`, `.sh` files, or `.json` files). You can filter based on project names, file types, or any other attribute.

- **Access Multiple File Types**  
  Instead of just README files, you can modify the script to fetch `.sh` scripts, `.env` configuration files, or `.json` data directly from the raw GitHub link.

- **Organize by Project Type**  
  Group similar projects together based on your own structure, such as `Web Apps`, `Terminal Tools`, `Data Scrapers`, and more. The script can display these categories dynamically, allowing you to navigate your profile more efficiently.

- **Run Commands Directly from Terminal**  
  After listing your projects, you can configure the script to automatically run specific commands or scripts for any selected project. This might include running build scripts, tests, or deployment commands directly from the terminal.

- **Project-Specific Shortcuts**  
  For power users, you can set up shortcuts for specific actions, such as starting a development server, running a test suite, or opening documentation, directly from your terminal. This eliminates the need to manually search for these files.

---

## How to Make It Even More Powerful

Once you have the basic script working, you can enhance it by adding the following:

- **Dynamic Menu with Project Groups**  
  Organize your projects into categories or tags, so when you run the script, you can select the project group you're interested in (e.g., `Web Projects`, `Scripts`, `Data Analysis`).

- **Rbuild this project to view all you need in fzf menu**
  No need to explain

- **Script Execution**  
  Include specific scripts inside your projects that can be executed from the terminal. For example, you could have a `deploy.sh` script in each repo, and when you select a project, the script could automatically run that deployment.

- **Further Personalization**  
  You can personalize the script to show extra information, such as project descriptions or the last commit message, making it easier to decide which project you want to work with next.

---

## TL;DR

- Use `curl -s https://github.com/YOURUSERNAME | grep -oPm 1 'RUN \K[^,]+' | bash` or `curl -s https://github.com/YOURUSERNAME | grep -oPm 1 'RUN \K[^,]+'` or `bash <(curl -s https://github.com/YOURUSERNAME | grep -oPm 1 'RUN \K[^,]+')` from your terminal
- Access all your projects, view their README files, and run scripts easily from the terminal
- Customize the script to suit your workflow and streamline your GitHub experience

