#include <stdint.h>

uint64_t eight_bytes = 0;
int main() {
    volatile uint64_t ignored = __sync_add_and_fetch(&eight_bytes, 1);
    return 0;
}
