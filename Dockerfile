FROM node:20 as frontend
WORKDIR /app
COPY website/package.json package.json
COPY website/package-lock.json package-lock.json
RUN npm install
COPY website/public/ public/
COPY website/src/ src/
COPY website/.eslintrc.js .eslintrc.js
COPY website/astro.config.mjs astro.config.mjs
COPY website/tailwind.config.js tailwind.config.js
RUN npm run build

FROM golang:1.21
WORKDIR /build
# RUN mkdir pb_public
COPY --from=frontend /app/dist /build/pb_public
COPY go.mod go.mod
COPY go.sum go.sum
RUN go mod download
COPY main.go main.go
COPY run.sh run.sh
RUN CGO_ENABLED=0 go build .
CMD ["./run.sh"]
