# go-containerization

## Building & Running the Docker Image

Build with:
`docker build . -t sebinalbert/go-containerized-api:latest`

`docker build --compress -t sebinalbert/go-containerized-api:latest -f <action>.Dockerfile`

/_--compress is used to compress the build context before sending it to the Docker daemon._/

docker build --compress -t go-containerized-api:latest -f ping.Dockerfile .

Run with:
`docker run -e PORT=9000 -p 9000:9000 sebinalbert/go-containerized-api`

## Commit the docker image to the registry

- Login to the registry with `docker login`
- Tag the image with `docker tag sebinalbert/go-containerized-api registry.digitalocean.com/zebdron/sebinalbert/go-containerized-api`
- Push the image with `docker push registry.digitalocean.com/zebdron/sebinalbert/go-containerized-api`

git remote set-url origin https://new_username:new_password@github.com/username/repo.git
