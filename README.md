This procees is easy to maintain for all components

One Dockerfile to maintain.

One TeamCity pipeline.

Each component gets its own Docker image + tag.

Saves time with yarn install caching (only once).



             ┌───────────────────────────┐
             │         TeamCity CI/CD     │
             └───────────────┬───────────┘
                             │
                   Checkout + Identify Env
                             │
                ┌────────────┴────────────┐
                │                         │
          ┌─────▼─────┐             ┌─────▼─────┐
          │  Build    │             │  Build    │
          │ wlheader  │             │ wlfooter  │
          │  dist/    │             │  dist/    │
          └─────┬─────┘             └─────┬─────┘
                │                         │
       ┌────────▼────────┐        ┌───────▼─────────┐
       │ Dockerize Image │        │ Dockerize Image │
       │ wlheader        │        │ wlfooter        │
       └────────┬────────┘        └────────┬────────┘
                │                         │
        ┌───────▼────────┐         ┌──────▼─────────┐
        │   Deploy to     │         │   Deploy to    │
        │ wlheader-server │         │ wlfooter-server│
        └────────────────┘         └────────────────┘
