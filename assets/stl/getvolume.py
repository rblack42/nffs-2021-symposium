
import numpy
import math
import os
import stl
import sys
from stl import mesh

def find_mins_maxs(obj):
    minx = maxx = miny = maxy = minz = maxz = None
    for p in obj.points:
        # p contains (x, y, z)
        if minx is None:
            minx = p[stl.Dimension.X]
            maxx = p[stl.Dimension.X]
            miny = p[stl.Dimension.Y]
            maxy = p[stl.Dimension.Y]
            minz = p[stl.Dimension.Z]
            maxz = p[stl.Dimension.Z]
        else:
            maxx = max(p[stl.Dimension.X], maxx)
            minx = min(p[stl.Dimension.X], minx)
            maxy = max(p[stl.Dimension.Y], maxy)
            miny = min(p[stl.Dimension.Y], miny)
            maxz = max(p[stl.Dimension.Z], maxz)
            minz = min(p[stl.Dimension.Z], minz)
    print("Shape bounds are:")
    print("  X: {0} <-> {1}".format(minx,maxx))
    print("  Y: {0} <-> {1}".format(miny,maxy))
    print("  Z: {0} <-> {1}".format(minz,maxz))

def get_volume(obj):
    volume, cog, inertia = \
        obj.get_mass_properties()
    return volume, cog

    print("Shape volume: {0}".format(volume))
    print("Shape CG    : {0}".format(cog))

def main():
    try:
        fname = sys.argv[1]
        if fname.endswith('.scad'):
            fname = fname.split('.')[0]
        density = sys.argv[2]
        print("Processing {0} with density {1}".format(fname,density))
    except:
        print("No file to process")
        sys.exit(1)

    cmd = "openscad {0}.scad -o {0}.stl".format(fname)
    os.system(cmd)

    fmesh = mesh.Mesh.from_file(fname+ '.stl')
    find_mins_maxs(fmesh)
    volume, cog = get_volume(fmesh)
    print("Shape volume: {0} cubic inches".format(volume))
    print("Shape CG    : {0}".format(cog))
    weight = volume * float(density) * 453.592/1738.0
    print("Estimated weight = {0} grams".format(weight))

main()
