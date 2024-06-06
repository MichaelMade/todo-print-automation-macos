# Todoist Print Automation for Receipt Printers

This repository contains some scripts that allow you to pull tasks from Todoist and print them out on a receipt printer.

The code is configured to pull tasks that are due today or overdue, and print them out grouped by due time. The code in charge of this is fairly simple, and should be somewhat straightforward to customize for your preferences.

# Project background

I'm not fond of recurring tasks - things like remembering to do the laundry over the weekend, or unloading the dishwasher in the morning. So I wanted to have a nice system that would remind me of all of these tasks.

Years ago, I started tracking these tasks on Todoist. Each task has a recurring due date - for example "Every Saturday at 9am". The Todoist app would remind me to do each of these tasks, which was helpful.

However, as I've started to move away from smartphone use - they're just too distracting - I wanted some kind of analog equivalent.So I wrote some scripts that automatically pull my tasks using the Todoist API and print them out every morning at 6am.

This means when I wake up, whenever I feel I have some energy to do chores, I don't have to think - I just pick up the list and pick from there what I'd like to do.

For this to work well, I chose to use a receipt printer. Receipt printers are perfect for this because:

    Receipts easily fit in your pocket, so you can carry it around.

    Receipts have a dynamic height - as a result, my entire todo list is always on one page, and the length of the paper is exactly the length of the todo list itself.

The downside of receipt printers is that they're a pain in the ass to develop with.

In order for this system to know what tasks you have/have not completed, you still need to mark tasks as completed in Todoist

## How the code works

There are two scripts that work together: `index.js` (a JavaScript file) and `print.ps1`, a bash script.

The code starts by invoking `index.js`, and goes through these general steps:

1. Pulls your tasks from Todoist
2. Checks for any tasks that are either A. Overdue, or B. Due sometime today
3. Groups these tasks by the time of day they are due (if present), and saves these to a .txt file
4. Invokes `print.ps1`, which grabs the .txt file, formats it for printing using Microsoft Word, and sends it for printing to the default printer.

## Using this code

Please feel free to clone and customize this code for your own purposes. For anything public-facing, credit to me is not required but would be appreciated.

Please feel free to make pull requests, feature requests, or general suggestions, but please keep in mind that maintaining this repo is something I only do in my spare time, which can be limited. Any requests made rudely will likely be ignored.

All use of this code is at-your-own-risk. While I hope to be helpful, I cannot promise any support of this code - this repo purely exists as a starting point for others who wish to build similar projects to mine.

## System Requirements

MacOS
Node.js

This will print using your default printer

## Setting up this repository

- Make sure you have Node.js installed. If you install Node.js fresh, and it asks you if you should add it to the Path variable, say 'yes'.
- Clone this repo
- Make a copy of `exampleConfig.json` called `config.json`
- In `config.json`, modify the values `todoist-api-token` and `hour-difference-from-UTC`. The first value should contain your [Todoist API Token](https://todoist.com/help/articles/find-your-api-token-Jpzx9IIlB), and the second is a quick-and-dirty way to represent your timezone. If you live in UTC time, this value should be zero. If your time is 'later' than UTC time, this value should be a positive integer representing how many hours 'ahead' of UTC time you are. If your time is 'earlier' than UTC time, this vlaue should be a negative integer representing how many hours 'behind' UTC time you are.
- Open a terminal in the root directory of this repository
- Run `npm install` to download and install required Node modules.

## Running this code manually

To run this code manually, simply run `node index.js` from this project's root folder.

## Running this code automatically (on Mac)

I have this code configured to run automatically at the same time every morning using `lanchd`

## Potential improvements

I would love to make this software usable by as many people as possible - that means making it:

- Stable
- Cross-platform
- Configurable
- Removing Microsoft Word as a dependency
- Supporting as many printers as possible

If you would like to contribute to these improvements - or others - pull requests are welcome. If you do not have time to contribute - but have ideas on how these challenges might be addressed - please let me know as well.
