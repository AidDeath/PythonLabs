import string
# Разработать программу, которая удаляет все цифры из исходного текста, подсчитыва-ет
# количество гласных букв и удваивает каждую букву латинского алфавита. На печать вы-дать
# исходный текст, количество гласных букв и преобразованный текст.


def main():
    numbers = {'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'}
    vowels_ru = {'а', 'у', 'о', 'ы', 'и', 'э', 'я', 'ю', 'ё', 'е'}
    tmp_set = set()
    for i in vowels_ru:
        tmp_set.add(i.swapcase())
    vowels_ru = vowels_ru.union(tmp_set)
    vowels_en = {'a', 'e', 'i', 'o', 'u', 'y'}
    tmp_set = set()
    for i in vowels_en:
        tmp_set.add(i.swapcase())
    vowels_en = vowels_en.union(tmp_set)

    text = input("Введите текст для изменения: ")
    new_text = str()
    vowels_count = 0
    for i in text:
        if i not in numbers and i not in string.ascii_letters:
            new_text += i
        elif i in string.ascii_letters:
            new_text += i * 2
        if i in vowels_ru or i in vowels_en:
            vowels_count += 1
    print("Исходный текст: ", text, "Количество гласных - ", vowels_count)
    print("Итоговый текст", new_text)


if __name__ == '__main__':
    main()
