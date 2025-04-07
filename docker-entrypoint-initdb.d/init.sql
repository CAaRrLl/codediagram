-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS gitdiagram;

-- Connect to the database
\c gitdiagram;

-- Create extension for UUID generation if needed
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Note: The actual schema will be created by Drizzle ORM migrations
-- This script just ensures the database and extensions are ready 