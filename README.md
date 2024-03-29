# MicroMorph

MicroMorph: The Microplastic Shape and Size Analyzer

![](microMorph.gif)

## Purpose

MicroMorph is originally intended for the rapid calculation of the shape morphology and the size of objects from the particle map provided by [sIMPle](https://simple-plastics.eu/) (https://simple-plastics.eu/). 
Particularly, MicroMorph is targeted towards calculating better estimates of the principal length of curvilinear particles (specifically fibers).
However, its capabilities have been extended to include "binary" images, such as binarized images from [ImageJ](https://imagej.net/ij/), to target a general
audience outside of [sIMPle](https://simple-plastics.eu/) users. 
MicroMorph provides a graphical interface to inspect particles and their respective shape characteristics. The program calculates the following size and shape descriptors:

Size:
* Area, perimeter, minor dimension, major dimension, perimeter, and maximum and minimum Feret diameter

Shape:
* Convexity, convex area, solidity, equivalent circle diameter, circularity, compactness, aspect ratio, Feret ratio, fiber length, fiber curl, average fiber diameter, fiber elongation

MicroMorph is written in C-idiomatic style C++ code with little use of C++ features (pretty much just std::vector). Any external libraries are statically linked and the only dependencies are the Microsoft runtime distributables and OpenGL libraries.

## Usage

Run MicroMorph.exe. An unfinished documentation is available in the "documentation.odf" with an explanation of the most critical features.

## Algorithms

FAN includes a number of algorithms to calculate the size and shape of Microplastic particles, including:

* Contour tracer
* Particle filling
* Convex hull
* Feret's diameter
* Zhang-suen thinning
* Skeletonization
* Breadth-first search, and more. 

The most interesting algorithms are explained below. 

### Contour tracing

First, it traverses through the array row wise and assigns the first pixel it encounters as the starting pixel of the boundary (b). Then the algorithm travels through the array in the Moore Neighbourhood until the starting pixel is reached again, see Fig. 1. The algorithm ONLY works for closed boundaries!

Algorithm:
1. Find the first non-zero pixel travelling row wise.
2. Set that index as the starting point as S.
3. Set the current index as p and add this to the boundary pixel list.
4. Set the previous index visited from p as b (backtraced pixel).
5. Go through the Moore Neighbourhood (3 * 3 pixels around p) starting from b and look for the first non-zero pixel in a clockwise rotation around p.
6. Repeat steps 3 to 5 until p is equal to S.

<p align="center">
<img src="fig01.png">
<figcaption align = "center">Figure 1: How the algorithm traverses through the particle pixel map and the resulting pixel boundary.</figcaption>
</p>





