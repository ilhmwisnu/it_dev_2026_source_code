# Dumpi API Documentation

A dummy REST API built with Express.js and TypeScript. Useful for prototyping and testing HTTP clients.

**Base URL:** `http://localhost:3000`  
**Interactive docs:** `GET /api-docs`

---

## Authentication

Protected endpoints require a `Bearer` token in the `Authorization` header. Any non-empty value is accepted — the token is not validated.

```
Authorization: Bearer --token--
```

---

## Auth

### POST /api/login

Validates email & password and returns a dummy token.

**Request body**

| Field    | Type   | Required | Description           |
|----------|--------|----------|-----------------------|
| email    | string | yes      | Valid email format    |
| password | string | yes      | Min 8 characters      |

```json
{
  "email": "john.doe@example.com",
  "password": "secret123"
}
```

**Responses**

`200 OK`
```json
{
  "message": "Login successful",
  "token": "--token--"
}
```

`400 Bad Request`
```json
{
  "message": "Login failed",
  "error": {
    "email": ["Invalid email"],
    "password": ["String must contain at least 8 character(s)"]
  }
}
```

---

### POST /api/register

Validates email, password, and confirmation password. Passwords must match and be at least 8 characters.

**Request body**

| Field                 | Type   | Required | Description           |
|-----------------------|--------|----------|-----------------------|
| email                 | string | yes      | Valid email format    |
| password              | string | yes      | Min 8 characters      |
| confirmation_password | string | yes      | Must match password   |

```json
{
  "email": "john.doe@example.com",
  "password": "secret123",
  "confirmation_password": "secret123"
}
```

**Responses**

`200 OK`
```json
{
  "message": "Registration successful",
  "token": "--token--"
}
```

`400 Bad Request` — same shape as login validation error.

---

## Users

> **Note:** Write operations (create, update, delete) are simulated. Data is not persisted and the list resets on every server restart.

### GET /api/users

Returns a paginated list of users.

**Query parameters**

| Parameter | Type    | Default | Description              |
|-----------|---------|---------|--------------------------|
| page      | integer | 1       | Page number (1-indexed)  |
| limit     | integer | 6       | Records per page         |

**Response** `200 OK`

```json
{
  "page": 1,
  "limit": 6,
  "total": 12,
  "total_page": 2,
  "data": [
    {
      "id": 1,
      "name": "John Doe",
      "email": "john.doe@example.com",
      "avatar": "https://picsum.photos/id/1/200/200"
    }
  ]
}
```

---

### GET /api/users/:id

Returns a single user by integer ID.

**Path parameters**

| Parameter | Type    | Description |
|-----------|---------|-------------|
| id        | integer | User ID     |

**Responses**

`200 OK`
```json
{
  "data": {
    "id": 1,
    "name": "John Doe",
    "email": "john.doe@example.com",
    "avatar": "https://picsum.photos/id/1/200/200"
  }
}
```

`404 Not Found`
```json
{ "message": "User not found" }
```

---

### POST /api/users

Simulates creating a user and returns what the new record would look like.

**Request body**

| Field  | Type   | Required | Description        |
|--------|--------|----------|--------------------|
| name   | string | yes      | Full name          |
| email  | string | yes      | Valid email format |
| avatar | string | no       | Image URL          |

```json
{
  "name": "Alice Walker",
  "email": "alice.walker@example.com",
  "avatar": "https://picsum.photos/id/13/200/200"
}
```

**Responses**

`201 Created`
```json
{
  "data": {
    "id": 13,
    "name": "Alice Walker",
    "email": "alice.walker@example.com",
    "avatar": "https://picsum.photos/id/13/200/200"
  }
}
```

`400 Bad Request` — validation error (missing required fields).

---

### PUT /api/users/:id

Simulates a partial update and returns what the user would look like after the change.

**Path parameters**

| Parameter | Type    | Description |
|-----------|---------|-------------|
| id        | integer | User ID     |

**Request body** — all fields optional

| Field  | Type   | Description        |
|--------|--------|--------------------|
| name   | string | Full name          |
| email  | string | Valid email format |
| avatar | string | Image URL          |

**Responses**

`200 OK` — updated user object (same shape as `GET /api/users/:id`)

`404 Not Found`
```json
{ "message": "User not found" }
```

---

### DELETE /api/users/:id

Simulates deleting a user. The record is not actually removed.

**Path parameters**

| Parameter | Type    | Description |
|-----------|---------|-------------|
| id        | integer | User ID     |

**Responses**

`200 OK`
```json
{ "message": "User deleted successfully" }
```

`404 Not Found`
```json
{ "message": "User not found" }
```

---

## Profile

### GET /api/profile

Returns the logged-in user's profile. Requires a non-empty `Authorization` header — any value is accepted.

**Headers**

| Header        | Required | Description            |
|---------------|----------|------------------------|
| Authorization | yes      | `Bearer <any-token>`   |

**Responses**

`200 OK`
```json
{
  "id": 1,
  "name": "John Doe",
  "email": "john.doe@example.com",
  "avatar": "https://picsum.photos/id/1/200/200"
}
```

`401 Unauthorized`
```json
{ "error": "Unauthorized" }
```

---

## Error Reference

| Status | Meaning                                  |
|--------|------------------------------------------|
| 400    | Validation failed — check `error` field  |
| 401    | Missing or empty Authorization header    |
| 404    | Resource not found                       |
| 500    | Internal server error                    |
