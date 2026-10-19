# জনকথা v2 — Bangladesh Citizen Report Prototype

A responsive Bangla public-complaint UI for free GitHub Pages hosting.

## Included in this version
- Complaint categories and category filters
- Public-report feed with search and sorting
- Anonymous-report option (default)
- Location, title, date and description fields
- Demo support and report-flag buttons
- Mobile-friendly UI and sample reports

## Important: current limitation
`index.html` runs as a front-end demo. New reports and support clicks only change the current browser session; they are NOT shared with other visitors and are not saved to a server. Sample reports are fictional examples. Do not describe this demo as a live public complaint service.

## Publish on GitHub Pages (free)
1. Create a GitHub repository, e.g. `jonokotha`.
2. Upload `index.html`, `README.md`, and optionally `supabase-schema.sql` to the repository root.
3. Open **Settings → Pages**.
4. Select **Deploy from a branch**, branch `main`, folder `/ (root)`, then Save.
5. Your free URL will look like `https://YOUR-USERNAME.github.io/jonokotha/`.

## Enable shared reports
To make reports visible to everyone in real time, use a hosted backend such as Supabase:
1. Create a Supabase project.
2. Open **SQL Editor** and run `supabase-schema.sql`.
3. In **Project Settings → API**, copy the Project URL and anon/public key.
4. In `index.html`, replace `SUPABASE_URL` with your Project URL and `SUPABASE_ANON_KEY` with the anon/public key. The page then loads and submits reports through the Supabase REST API.
5. Add CAPTCHA, rate limits, spam prevention, moderation, privacy/retention policy and a way to report harmful content before public launch.

## Privacy and safety
- Do not collect NID, passwords, bank details or unnecessary personal data.
- Anonymous means the website does not display the submitter's name. It does not guarantee technical anonymity: hosting/backend logs may contain IP or other metadata.
- Avoid publishing allegations that identify private individuals; establish moderation and takedown procedures.
- Keep service-role/secret keys out of browser code. Only a restricted anon/public key may be used client-side with correct Row Level Security.
- Public reports can be copied and redistributed. Make that clear before submission.
- This is an independent prototype, not a government service. Do not imply official endorsement or guaranteed action.
