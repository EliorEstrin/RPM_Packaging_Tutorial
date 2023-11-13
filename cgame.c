#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    int random_number, guess, number_of_guesses = 0;
    time_t t;

    // Initialization of random number generator
    srand((unsigned) time(&t));

    random_number = rand() % 100 + 1; // Random number between 1 and 100

    printf("Guess the number (between 1 and 100):\n");

    // Loop until the user guesses the number
    do {
        scanf("%d", &guess);
        number_of_guesses++;

        if(guess > random_number) {
            printf("Lower!\n");
        } else if(guess < random_number) {
            printf("Higher!\n");
        }
    } while(guess != random_number);

    printf("Congratulations! You've guessed it in %d tries!\n", number_of_guesses);

    return 0;
}