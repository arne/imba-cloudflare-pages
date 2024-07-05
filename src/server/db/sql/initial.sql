DROP TABLE IF EXISTS todos;

CREATE TABLE
  todos (
    id TEXT NOT NULL PRIMARY KEY,
    title TEXT NOT NULL,
    done INT NOT NULL CHECK ((done IN (0, 1))) DEFAULT (0),
    created_at TEXT NOT NULL DEFAULT (datetime ('now')),
    updated_at TEXT NOT NULL DEFAULT (datetime ('now'))
  );