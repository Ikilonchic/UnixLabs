# Отчёт по лабораторной работе №3

по дисциплине "Unix-подобные операционные системы"  
студента группы ПА-18-2  
Куца Никиты Юрьевича

## Постановка задачи

* Написать Bash-скрипт, который работает с некоторыми аргументами;
* Написать программу на языке С/C++, которая будет работать с некоторыми консольными аргументами. Скомпилировать с помощью компилятора gcc/g++;
* Установить ещё 3 произвольные компилятора/интерпретатора, для проверки их работы создать аналогичные программы на соответствующих языках.
  
## Выполнение

Для всех задач будем писать алгоритм, принимающий два значения из аргументов командной строки и выводящий их произведение в формате:

`$1 * $2 = $result`

### Bash-скрипт

Первым напишем Bash-скрипт:

1. Создадим файл с помощью команды `touch main.bash` (все следующие скрипты созданы таким же образом)
2. Откроем с помощью встроенного текствого редактора `nano`
3. Скрипт:

    ```Bash
    #!/bin/bash

    if (( $# == 2 ))
        then echo "$1 * $2 = $(($1 * $2))"
    else
        echo "Not enough args!"
    fi
    ```

4. Стоит убедиться, что у скрипта есть права на запуск, для этого введем команду: `chmod 755 main.bash`
5. Протестируем работу `main.bash`:

![][screenshot-1]

[screenshot-1]: img/1.png

### Программа на C++

Сначала проверим был ли предустановлен gcc компилятор в систему:

![][screenshot-2]

Напишем аналогичную программу на языке С++.

Программа:

```Cpp
#include <iostream>

using namespace std;

double Mltp(const double first, const double second) {
    return first * second;
}

int main(int argc, const char** argv) {
    if (argc < 3) {
        std::cout << "Not enough args!" << std::endl;
        return EXIT_SUCCESS;
    }

    char* error;
    const auto first  = strtod(argv[1], &error);
    const auto second = strtod(argv[2], &error);


    if (*error != 0 && !isspace((unsigned char)*error)) {
        std::cout <<  "Parse error..." << std::endl;
        return EXIT_FAILURE;
    }

    std::cout << first << " * " << second << " = " << Mltp(first, second) << std::endl;
    return EXIT_SUCCESS;
}  
```

Скомпилируем программу с помощью команды `g++ main.cpp -o main`. Запустим созданный исполнительный файл под названием `main`:

![][screenshot-3]

[screenshot-2]: img/2.png
[screenshot-3]: img/3.png

### Программа на Go

Перепишем эту же самую программу на язык программирования Go. Компилятор которого можно найти в открытом доступе в качестве apt-пакета.

Программа:

```Go
package main

import (
    "fmt"
    "os"
    "strconv"
)

func Mltp(first, second float64) float64 {
    return first * second
}

func main() {
    if (len(os.Args) < 3) {
        fmt.Println("Not enough args!")
        return
    }

    first, error1  := strconv.ParseFloat(os.Args[1], 64)
    second, error2 := strconv.ParseFloat(os.Args[2], 64)

    if (error1 != nil || error2 != nil) {
        fmt.Println("Parse error...")
        os.Exit(1)
    }

    fmt.Printf("%v * %v = %v\n", first, second, Mltp(first, second))
}
```

Запустим программу командой `go run main.go`:

![][screenshot-4]

[screenshot-4]: img/4.png

### Программа на JS

Программу на JS будем запускать на платформе Node.js, которую так же без проблем можно установить как пакетный менеджер. Так же для удобства можно установить NVM (Node Version Manager).

Программа:

```JS
const { argv } = require('./argv');

const mltp = (first, second) => {
    return first * second;
};

if (argv.length < 2) {
    console.log('Not enough args!');
} else {
    const first = Number(argv[0]);
    const second = Number(argv[1]);
    
    console.log(`${first} * ${second} = ${mltp(first, second)}`);
}
```

Запустим программу командой  `node main.js`:

![][screenshot-5]

[screenshot-5]: img/5.png

### Программа на Python

Программу на Python можно запустить на стандартном интерпретаторе языка, который предустанавливается с любыми дистрибутивами Linux.

Программа:

```Python
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
```

Запустим программу командой  `python3 main.py`:

![][screenshot-6]

[screenshot-6]: img/6.png
