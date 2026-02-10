# Setup steps:
1. Provision a machine with Ubuntu 24.04LTS and check out the repository in ~
2. Fill in environment variables in `stacks/.env`
3. Deploy stacks/core.yaml manually with `docker-compose -f /path/to/stacks/core.yaml up -d`
5. Paste your TransIP private key in `stacks/traefik/transip.key`
6. Change your e-mail address in `stacks/traefik/traefik.yml`
7. Use Portainer to create the rest of the stacks as desired. At this point Traefik and SSL certificates aren't working yet so you may need to open port 9000 on Portainer to access it.
8. Ensure SSL certificates are working. Portainer should be available as https://portainer.mydomain.com
9. Set up scripts like `backup-docker-volumes.sh` in your crontab

# Assumptions made:
This repository is rather naively assuming that your setup is equal to mine by assuming:
1. NAS shares are mounted under /data (e.g. /data/backup, /data/media/movies, etc)
2. You're using TransIP as a registrar and using their API for DNS/SSL stuff
3. You want all services to be available with a wildcard under *.mydomain.com (only a wildcard SSL certificate is requested) and you actually have this domain registered

# Full layout directory for /data
/data
    /backup: Target for backups
    /media
        /tv: TV shows
        /movies: Movies
        /music: Music
        /youtube: Downloaded Youtube channels
    /torrents: Download target for transmission
    /usenet: Download target for SABnzbd
