# ❄️ NixOS configuration
This repo contains my ever evolving NixOS flake for the systems in my home, including an Asus 14 inch OLED laptop, a custom gaming pc, and a Lenovo Legion Go! It is not intended to be a universal template for others to use, but feel free to look through and use whatever you'd like. As of right now comments and explanations are very minimal, so it isn't very beginner friendly.

# 📸 Screenshots
![image](assets/screenshot-2.png) ![image](assets/screenshot-3.png)

# ✔️ To Do
- [x] Enable secrets implimentation using either sops-nix or agenix
- [ ] Update documentation and comments
- [ ] Remove hardcoded bus ID's in favor of using mkOption

# Motivation
After having worked in help desk wearing different hats for the previous 7 years I have had endless exposure to the issues that arise with imperative systems (e.g dependency hell, configuration drift, "It works on this machine"). Last year I finally decided to learn how to use NixOS and flakes to build consistent and reproducible systems, as well as have granular control over my operating system.