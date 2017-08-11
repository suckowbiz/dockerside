# idea

[IntelliJ IDEA Ultimate](https://www.jetbrains.com/idea/download/#section=linux) **free trial** version baked together with Java development related dependencies such as Git, Maven, Java Runtime.

## Volumes

- `~/IdeaProjects` to persist/ load IDEA workspace.
- `~/.IntelliJIdea` to persist IDEA settings.
- `~/.java` to persist e.g. license acceptance.
- `/home/tobias/.m2` to persist Maven dependencies.
- `/home/tobias/.ssh` to use local SSH configuration.
- `/home/tobias/.gitconfig` to use local Git configuration.

# Run

Download run script to have `idea` available:

```bash
curl -fLSs -o - https://raw.githubusercontent.com/suckowbiz/dockerside/master/idea/idea > /var/tmp/idea && sudo mv /var/tmp/idea /usr/local/bin/ && sudo chmod +x /usr/local/bin/idea
```

Notes: 
- https://resources.jetbrains.com/assets/products/intellij-idea/IntelliJIDEA_ReferenceCard.pdf
