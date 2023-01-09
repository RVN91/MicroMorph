# MicroMorph

MicroMorph: The Microplastic Shape and Size Analyzer


## Fibers and Numbers (FAN)

FAN calculates the shape morphology and size of objects from the particle map provided by sIMPle (https://simple-plastics.eu/). It provides a graphical interface to inspect particles and their respective shape characteristics. The program calculates the following size and shape descriptors:

Size:
* Area, perimeter, minor dimension, major dimension, perimeter, and maximum and minimum Feret diameter

Shape:
* Convexity, convex area, solidity, equivalent circle diameter, circularity, compactness, aspect ratio, Feret ratio, fiber length, fiber curl, average fiber diameter, fiber elongation


### Contour tracing

First, it transverses through the array row wise and assigns the first pixel it encounters as the starting pixel of the boundary (b). Then the algorithm travels through the array in the Moore Neighbourhood until the starting pixel is reached again, see Fig. 1. The algorithm ONLY works for closed boundaries!

Algorithm:
1. Find the first non-zero pixel travelling row wise.
2. Set that index as the starting point as S.
3. Set the current index as p and add this to the boundary pixel list.
4. Set the previous index visited from p as b (backtraced pixel).
5. Go through the Moore Neighbourhood (3 * 3 pixels around p) starting from b and look for the first non-zero pixel in a clockwise rotation around p.
6. Repeat steps 3 to 5 until p is equal to S.

<p align="center">
![This is an image](fig01.png)
<figcaption align = "center">Figure 1: How the algorithm transverses through the particle pixel map and the resulting pixel boundary.</figcaption>
</p>







