# lizard-template-grafana

Wrapper image for the **Grafana** one-click template on [Lizard](https://lizard.build).

Deploying the template gives you Grafana backed by a managed Postgres addon —
dashboards, users and API keys live in Postgres, so they survive redeploys
without a persistent volume.

## Why this repo is only a Dockerfile

A Lizard template spec has no `image` field: every app is built from a git repo.
So the template points here, and this builds `grafana/grafana` unchanged.

## What the template wires up

| env | value |
|---|---|
| `GF_DATABASE_TYPE` | `postgres` |
| `GF_DATABASE_HOST` | `${{postgres.PGHOST}}:${{postgres.PGPORT}}` |
| `GF_DATABASE_NAME` / `USER` / `PASSWORD` | from the Postgres addon |
| `GF_SERVER_ROOT_URL` | `https://${{LIZARD_PUBLIC_DOMAIN}}` |
| `GF_SECURITY_ADMIN_USER` | `admin` |
| `GF_SECURITY_ADMIN_PASSWORD` | **you choose it at deploy time** |

The admin password is a deploy-time input rather than a baked default, so a
fresh Grafana is never briefly reachable on a public URL with `admin/admin`.

## Updating Grafana

Bump the tag in the `Dockerfile` and redeploy. Grafana migrates its own schema
in Postgres on start.
