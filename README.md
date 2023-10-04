This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app). and docker

## Development setup

Install dependencies

```bash
npm i
```

Run dev server

```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Deployment

1. Clone project repo to the server
2. ```bash cd ``` into project dir
3. (Optional) configure ssh/server bind port in ```docker-compose.yml``` 
4. Run
    ```bash
    sudo docker-compose up -d 
    ```
5. Enjoy!
