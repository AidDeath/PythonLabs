def main():
    source_dictionary = dict()
    with open("dictionary/input.txt", "r", encoding="utf-8") as infile:
        try:
            infile.read(1)
            wordcount = int(infile.readline())
        except ValueError:
            print("input file is not valid!")
            return
        for i in range(0, wordcount):
            line = infile.readline().split("-")
            key = line[0].strip()
            values = list()
            for v in line[1].split(","):
                values.append(v.strip())
            source_dictionary[key] = values
    print(source_dictionary)

    dest_dictionary = dict()
    for key, value in source_dictionary.items():
        for current_value in value:
            if current_value in dest_dictionary:
                dest_dictionary[current_value].append(key)
            else:
                dest_dictionary[current_value] = list()
                dest_dictionary[current_value].append(key)
    print(dest_dictionary)

    with open("dictionary/output.txt", mode="w", encoding="utf-8") as outfile:
        outfile.write(str(len(dest_dictionary)) + "\n")
        for key, value in sorted(dest_dictionary.items()):
            print(key, "-", ", ".join(dest_dictionary[key]), file=outfile)


if __name__ == '__main__':
    main()
