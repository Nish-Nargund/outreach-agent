# Tabhi Supplier Outreach Agent (demo)

A small app you run on your own computer. It drafts supplier emails from Tabhi's built-in templates (New, Extend and Finish), lets you edit each one, sends them from **nnargund@mondee.com**, and logs every send.

There's no database: templates are saved in `templates.json` and the log is written to `logs/email_log.jsonl`.

## 1. One-time setup (about 5 minutes)

You need Python 3.9 or newer (`python --version`).

**Get an App Password for nnargund@mondee.com.** The app signs in to the mail server with it. Your normal password won't work.

- **Google Workspace / Gmail:** go to myaccount.google.com → Security → turn on 2-Step Verification → search "App passwords" → create one called "Outreach agent" → copy the 16-character code.
- **Microsoft 365 (Outlook):** your IT admin has to allow "Authenticated SMTP" for the mailbox. Then create an app password under My Account → Security info.

If you can't create an App Password, mondee IT has probably turned them off. Ask them to allow SMTP sending for nnargund@mondee.com.

**Fill in `config.env`.** On first run, the run script copies `config.env.example` to `config.env`. Open it and paste the code:

```
SMTP_PASSWORD=abcd efgh ijkl mnop
```

If mondee mail is on Microsoft 365, switch `SMTP_HOST` to `smtp.office365.com` (the lines are already in the file).

## 2. Run it

- **Windows:** double-click `run_windows.bat`
- **Mac / Linux:** run `./run_mac_linux.sh` in Terminal

Your browser opens **http://localhost:5050**. Go to **Settings → Send a test email to myself** and check that it arrives.

## 3. Use it

1. **New outreach:** upload an Excel or CSV file, or enter suppliers by hand. The only required columns are **Supplier name** and **Email**. Optional columns: Type (New / Extend / Finish), Contact name, Category, Markets, Stage, Cc, Owner and Notes. `sample_suppliers.xlsx` in this folder is a ready-to-use demo sheet. All its rows use your own email.
2. **Review and edit:** every email is pre-filled from the template. You can change To, Cc, the subject or the message, switch the template, or reset a draft to the template.
3. **Send:** either send everything you've ticked, or send one email at a time.

**Demo mode is on by default.** Every email goes to nnargund@mondee.com only, with the intended supplier address noted at the top of the message, and Cc is dropped. Untick Demo mode in the bottom bar when you want real suppliers to receive the emails.

**Email templates:** edit the three Tabhi scripts, the "About Tabhi" paragraph and the signature. New drafts use whatever you save. "Reset to original" brings back the GTM tool's wording.

**Logs dashboard:** shows every send attempt with the time, supplier, email type, address, subject, status, whether it was a demo, and whether you edited it. Click a row to see the full email. **Export CSV** downloads the whole log.

## Notes

- The sender is hard-coded to `nnargund@mondee.com` in `app.py` (`SENDER_EMAIL`). To switch to suryatejal@mondee.com later, change that line and the username and password in `config.env`.
- Gmail limits Workspace accounts to about 2,000 emails a day. The app also waits 0.4 seconds between emails.
- `config.env` holds a password, so don't share or commit it.
