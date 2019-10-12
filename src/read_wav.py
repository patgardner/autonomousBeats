"""
Demo of reading wav files in python
"""

import click

import soundfile as sf
import matplotlib.pyplot as plt

@click.command()
@click.argument("filename")
def main(filename):
    """Read in a wav file and make plot of it."""
    sig, samplerate = sf.read(filename)
    plt.plot(sig)
    plt.show()

if __name__ == "__main__":
    main()
