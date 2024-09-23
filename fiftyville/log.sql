-- Keep a log of any SQL queries you execute as you solve the mystery.

-- Starting from crime_scene_reports to get description
SELECT description FROM crime_scene_reports
WHERE year = 2023
AND month = 7
AND day = 28
AND street = 'Humphrey Street';

-- Checking the interview's transcripts for clues
SELECT transcript FROM interviews
WHERE year = 2023
AND month = 7
AND day = 28
AND transcript LIKE '%bakery%';

-- Checking ATM at said location for amount and account
SELECT account_number, amount FROM atm_transactions
WHERE year = 2023
AND month = 7
AND day = 28
AND atm_location = 'Leggett Street'
AND transaction_type LIKE '%withdraw%';

-- Checking airports to get id and abbreviation of Fiftiville airport
SELECT id, abbreviation FROM airports
WHERE full_name LIKE '%Fiftyville%'
AND city LIKE '%Fiftyville%';

-- Checking flights to get time of earliest flight, flight id and destination id
SELECT id, hour, minute, destination_airport_id FROM flights
WHERE origin_airport_id = 8
AND year = 2023
AND month = 7
AND day = 29
ORDER BY hour ASC;

-- Checking airports for destination city name with id
SELECT full_name, abbreviation, city FROM airports
WHERE id = 4;

-- Checking passengers of said flight_id to get passport numbers (and seats)
SELECT passport_number, seat FROM passengers
WHERE flight_id = 36;

-- Checking bakery security logs for license plate
SELECT activity, license_plate, minute FROM bakery_security_logs
WHERE year = 2023
AND month = 7
AND day = 28
AND hour = 10
AND activity = 'exit';

-- Checking phone_calls for caller and receiver number
SELECT caller, receiver, duration FROM phone_calls
WHERE duration < 60
AND year = 2023
AND month = 7
AND day = 28;

-- Checking people to see who made the call, left with the car from the parking lot and was on the flight
SELECT name, id, phone_number, license_plate FROM people
WHERE passport_number = 'passport_number';

-- Checking Bank Accounts to see if the people who were in those places also withdrew money from the atm
SELECT account_number, creation_year, person_id FROM bank_accounts
WHERE person_id = 'people.id';

-- Finding out who the accomplice is, by the phone number the thief called
SELECT name, phone_number FROM people
WHERE phone_number = '(375) 555-8161';
