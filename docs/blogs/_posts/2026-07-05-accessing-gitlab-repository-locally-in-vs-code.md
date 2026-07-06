---
layout: post
title: "Accessing a GitLab Repository Locally in VS Code Using SSH"
date: 2026-07-05
description: "Step-by-step guide to set up SSH keys for GitLab and clone repositories locally in VS Code."
last_modified_at: 2026-07-06
tags: [GitLab, SSH, VS Code, DevOps]
---

*July 5, 2026*

# Accessing a GitLab Repository Locally in VS Code Using SSH

## Step 1: Generate a new SSH key

I recommend creating a dedicated key for GitLab.

```
ssh-keygen-t ed25519-C"your_gitlab_email@example.com"
```

When asked:

```
Enter file in which to save the key
```

Specify a new name:

```
/Users/nsr/.ssh/gitlab_ed25519
```

or simply:

```
~/.ssh/gitlab_ed25519
```

Press Enter.

---

## Step 2: Passphrase

You'll see:

```
Enter passphrase (empty for no passphrase):
```

For simplicity, just press **Enter** twice.

---

## Step 3: Verify the files

Run:

```
ls-l ~/.ssh/gitlab_ed25519*
```

You should see:

```
~/.ssh/gitlab_ed25519
~/.ssh/gitlab_ed25519.pub
```

---

## Step 4: Start SSH agent

```
eval"$(ssh-agent -s)"
```

---

## Step 5: Add the key

```
ssh-add ~/.ssh/gitlab_ed25519
```

Verify:

```
ssh-add-l
```

Expected:

```
256 SHA256:xxxxxxxxxxxxxxxx gitlab_ed25519 (ED25519)
```

---

## Step 6: Copy the public key

```
cat ~/.ssh/gitlab_ed25519.pub
```

Copy the entire line.

---

## Step 7: Add it to GitLab

Go to GitLab:

**Profile → Preferences → SSH Keys**

Paste the key.

Title:

```
MacBook-Air-GitLab
```

Click **Add key**.

---

## Step 8: Configure SSH

Create or edit:

```
nano ~/.ssh/config
```

Add:

```
Host gitlab.com
    HostName gitlab.com
    User git
    IdentityFile ~/.ssh/gitlab_ed25519
    IdentitiesOnly yes
```

Save:

- **Ctrl + O**, Enter
- **Ctrl + X**

---

## Step 9: Test

```
ssh -T git@gitlab.com
```

Expected:

```
Welcome to GitLab, @username
```

# Step 10: Clone your repository

```jsx

git clone {give your ssh url}
```

---

[Notion](https://nsr6.notion.site/Accessing-a-GitLab-Repository-Locally-in-VS-Code-Using-SSH-38605b97e27e8077bcf4f5165cbe65b8?source=copy_link)
