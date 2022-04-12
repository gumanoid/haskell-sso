Simple user directory service. A toy project to learn Haskell basics.

To start server: `stack run`.

To run tests: `stack test`.

# Endpoints

## /status
Always returns 200 OK. Requires no auth. Usable for monitoring.

## /users
Returns list of all users