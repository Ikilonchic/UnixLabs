from sys import argv

def mltp(first, second):
    return first * second

def main():
    if len(argv) < 3:
        print('Not enough args!')
    else:
        first = float(argv[1])
        second = float(argv[2])

        print(f"{first} * {second} = {mltp(first, second)}")

if __name__ == '__main__':
    main()
