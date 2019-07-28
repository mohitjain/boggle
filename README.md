## Setup guidelines

- Update `database.yml`
- Install the gems `bundle install`
- Setup the database `rails db:create && rails db:migrate`
- Bootup the application `rails s`  

## Background

Boggle is a word game that is played on a 4x4 board with 16 letter tiles.
The goal is to find as many words as possible given a time constraint.
For this exercise, we are making one modification.
Now it is possible for one or more of the letter tiles to be blank (denoted by `*`).
When a tile is blank, it can be treated as any other letter.
Note that in one game it does not have to be the same character for each word.
For example, if the tiles C, T, and * are adjacent. The words cot, cat,
and cut can all be used.  You will be given a text file containing all
valid English words (a dictionary). You will also be given an initial board
configuration as a text file with commas separating the letters.
Use this as a guide for how to set up the board.

For example, a file may contain:

```
A, C, E, D, L, U, G, *, E, *, H, T, G, A, F, K
```

This is equivalent to the board:

```
A C E D
L U G *
E * H T
G A F K
```

Some sample words from this board are ace, dug, eight, hole, huge, hug, tide.

## Requirement

- Implement an API in the language/framework of you choice,
that lets user play a single-player game of Boggle.
- All responses of the API endpoints should be in JSON format.
- The API endpoints will be following:

### Create the game

- Endpoint

```
POST /games
```

- Parameters:
  + `duration` (required): the time (in seconds) that specifies the duration of
    the game
  + `random` (required): if `true`, then the game will be generated with random
    board.  Otherwise, it will be generated based on input.
  + `board` (optional): if `random` is not true, this will be used as the board
    for new game. If this is not present, new game will get the default board
    from `test_board.txt`

- Response:
  + Success (status 201 Created)

```json
{
  "id": 1,
  "token": "9dda26ec7e476fb337cb158e7d31ac6c",
  "duration": 12345,
  "board": "A, C, E, D, L, U, G, *, E, *, H, T, G, A, F, K"
}
```

### Play the game

- Endpoint

```
PUT /games/:id
```

- Parameters:
  + `id` (required): The ID of the game
  + `token` (required): The token for authenticating the game
  + `word` (required): The word that can be used to play the game

- Response:
  + Success (status 200 OK)

```json
{
  "id": 1,
  "token": "9dda26ec7e476fb337cb158e7d31ac6c",
  "duration": 12345,
  "board": "A, C, E, D, L, U, G, *, E, *, H, T, G, A, F, K",
  "time_left": 10000,
  "points": 10
}
```

### Show the game

- Endpoint

```
GET /games/:id
```

- Parameters:
  + `id` (required): The ID of the game

- Response:
  + Success (status 200 OK)

```json
{
  "id": 1,
  "token": "9dda26ec7e476fb337cb158e7d31ac6c",
  "duration": 12345,
  "board": "A, C, E, D, L, U, G, *, E, *, H, T, G, A, F, K",
  "time_left": 10000,
  "points": 10
}
```
