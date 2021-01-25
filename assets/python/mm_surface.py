import math

class Surface(object):

    def __init__(self,
        span,           # with dihedral
        chord,          # root chord
        camber,         # root camber
        tip_radius,     # outer LE tip radius
        center_span,    # center section span (<= span)
        tip_elevation   # dihedral tip elevation
    ):
        self.root_chord = chord
        self.root_camber = camber * chord / 100
        self.center_span = center_span
        self.tip_radius = tip_radius
        self.span = span
        self.tip_elevation = tip_elevation

    def radius(self, c, t):
        return c**2/(8*t) + t/2

    def arc_height(self, x_percent, chord, camber):
        xr = x_percent * chord
        rad = self.radius(chord, camber)

        cx = chord/2
        cy = -(rad-camber)

        fact = math.sqrt(rad**2 - (xr - cx)**2)

        xh = cy + fact
        print(xr,xh, rad, camber, cx,cy,rad,fact)
        return xh

    def get_chord(self, y):
        r = self.tip_radius
        c = self.root_chord
        yt = y - (self.span/2 - r)
        print("->",y,r, yt)
        if yt < 0:
            return c
        f = r**2 - yt**2
        print("F:",f)
        return c - r + math.sqrt(f)

    def gen_mesh(self,nx, ny):
        dx = 1.0/nx
        dy = 1.0/ny
        print(dx,dy)
        for y in range(ny+1):
            yr = y * dy * self.span/2   # 0-span
            ch = self.get_chord(yr)
            x0 = self.root_chord - ch;
            for x in range(nx+1):
                xr = x0 + x * dx * ch

                print("(%3.2f,%3.2f)" % (xr,yr), end="")
            print()

    def run(self):
        tip_span = (self.span - self.center_span)/2
        self.dihedral_angle = \
                math.atan2(self.tip_elevation, tip_span)

        print (self.dihedral_angle * 180/math.pi)

        self.gen_mesh(nx=5,ny=50)


if __name__ == "__main__":

    s = Surface(18,5,6,2,10,1.75);
    s.run()
