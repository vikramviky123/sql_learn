def bin(n):

    if n > 1:
        bin(n//2)

    print(n % 2, end="")


# Driver Code
if __name__ == "__main__":

    bin(22)
