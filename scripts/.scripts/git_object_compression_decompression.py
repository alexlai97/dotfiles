import zlib  # A compression / decompression library
def decompress(filename):
    compressed_contents = open(filename, 'rb').read()
    decompressed_contents = zlib.decompress(compressed_contents)
    return decompressed_contents


from hashlib import sha1  # SHA1 hash algorithm
def compress(decompressed_contents):
    return sha1(decompressed_contents).hexdigest()
