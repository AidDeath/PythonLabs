import lab2_vectors as lab2


def main():
    print("Введите значения вектора. По окончании нажмите Enter")
    string = '!'
    vector = list()
    while True:
        string = input("Значние:")
        if not string:
            break
        try:
            vector.append(float(string))
        except ValueError:
            print("Это не число!")
            continue
    print("Введен вектор:", vector)

    while True:
        string = input("В которое задание передать вектор? 1, 2, 0 - выход\n")
        if string == '1':
            lab2.task1(vector)
        elif string == '2':
            lab2.task2(vector)
        elif string == '0':
            print("Выходим")
            return


if __name__ == '__main__':
    main()
