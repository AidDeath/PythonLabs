# Дан текст. Создать новый текст, в котором все слова нечетной длины заменены на слово минимальной длины.


def main():
    text = "This is how it goes! And nobody, no one of you can change it."  # input("Введите текст:")
    print("Исходный текст:", text)
    text = text.replace(',', ' ,').replace('.', ' .').replace('!', ' !').replace('?', ' ?')
    splitted = text.split()
    # Определю первое слово минимальной длины, не считая знаков препинания.
    min_len_word = splitted[0]
    for word in splitted:
        if len(word) < len(min_len_word) and word not in [',', '.', '!', '?']:
            min_len_word = word
    result_text = list()

    for word in splitted:
        if len(word) % 2 != 0 and word not in [',', '.', '!', '?']:
            result_text.append(min_len_word)
        else:
            result_text.append(word)
    result_text = " ".join(result_text).replace(' ,', ',').replace(' .', '.').replace(' !', '!').replace(' ?', '?')
    print("Итоговый текст:", result_text)


if __name__ == '__main__':
    main()
