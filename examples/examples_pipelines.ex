# Pipelines
# 1
word |> split() |> sort() |> join()
join(sort(split(word)))

# 2
join(sort(split(word)))

word
|> split()
|> sort()
|> join()

# 3
length(split(wordlist,/\n/))

wordlist
|> split(~r/\n/)
|> length()

# 4
join(split(string,"\t"), ",")

string
|> split("\t")
|> join(",")
