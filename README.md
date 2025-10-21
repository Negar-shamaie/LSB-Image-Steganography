# MATLAB-LSB-Image-Steganography
## Image Cryptography and Steganography Exercise (Signals & Systems)

This repository contains MATLAB code developed for a computer assignment (Part I of CA3) focusing on **Steganography**—the art of concealing a message within an image. The project implements a custom coding and decoding scheme to embed an English message into a black-and-white image using the **Least Significant Bit (LSB)** technique.

The core objective is to demonstrate understanding of information hiding principles and implement custom functions for signal processing tasks.

---

### Key Concepts and Implementation

#### 1. Character Mapping (Mapset)
* A custom **`Mapset`** (32x2 cell array) is created to map 32 permissible characters (lowercase English letters, space, and 6 specific punctuation marks) to their unique **5-bit binary codes**.
* A special end-of-message marker is used to indicate the message termination.

#### 2. Message Encoding (`coding` function)
The **`coding`** function is responsible for embedding the binary message string into the image.

* **Input:** The English message, the original black-and-white image, and the `Mapset`.
* **LSB Embedding:** Each bit of the binary message is embedded into the **Least Significant Bit (LSB)** of a selected pixel in the image.
* **Block Selection Strategy:** To ensure the message is indiscernible, the image is divided into blocks (e.g., 5x5), and specific, suitable blocks are chosen for embedding the message.
* **Error Handling:** The function includes a check to ensure the length of the binary message does not exceed the total number of LSB pixels available in the selected blocks.

#### 3. Message Decoding (`decoding` function)
The **`decoding`** function extracts the hidden message from the steganographic image.

* **Input:** The coded image, the `Mapset`, and the block selection strategy used during encoding.
* **Process:** The function extracts the LSBs from the corresponding block pixels, reconstructs the 5-bit binary sequences, and uses the `Mapset` to translate the binary back into the original English characters.

### Requirements and Running the Code

* **Technology:** MATLAB Environment.
* **Focus:** The implementation emphasizes custom function writing (e.g., `coding` and `decoding`) and block selection strategy.
