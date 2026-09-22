# Lizard one-click template: Grafana.
#
# A thin wrapper over the official image — the platform builds every app from a
# git repo (a template spec has no `image` field), so this repo exists only to
# give that build something to do.
#
# Pinned, not :latest. A template is deployed by other people long after it is
# written, and a floating tag turns "deploy the template that worked yesterday"
# into a different Grafana every time.
FROM grafana/grafana:11.3.0

# Grafana defaults to 3000 and the template spec sets the same containerPort.
EXPOSE 3000
