From: Steven Haigh <netwiz@crc.id.au>
Subject: Re: Xen release cycle revisited
Date: Tue, 19 Dec 2017 23:25:39 +1100
Message-ID: <5204240.rhRYlsoWYG@wopr.lan.crc.id.au>
References: <63cf216a-71af-bd35-55e7-88c69b773e52@suse.com>
 <3091712.73UAgB5JZV@wopr.lan.crc.id.au>
 <113051ed-cdd5-cf4d-374b-6e29efb79a7e@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0207456798680248316=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=jtcn=dp=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1eRGxu-00068N-2P
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 12:25:46 +0000
In-Reply-To: <113051ed-cdd5-cf4d-374b-6e29efb79a7e@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, George Dunlap <dunlapg@umich.edu>, Julien Grall <julien.grall@linaro.org>, xen-devel@lists.xen.org, "committers@xenproject.org" <committers@xenproject.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

--===============0207456798680248316==
Content-Type: multipart/signed; boundary="nextPart2800510.cViNDkOHev"; micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2800510.cViNDkOHev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, 19 December 2017 10:44:04 PM AEDT George Dunlap wrote:
> On 12/19/2017 10:42 AM, Steven Haigh wrote:
> > On Tuesday, 19 December 2017 7:47:14 PM AEDT Jan Beulich wrote:
> >>>>> On 19.12.17 at 07:58, <jgross@suse.com> wrote:
> >>> My proposal addresses the 4.10 experience. I see the following
> >>> alternatives (assuming we want to keep the two releases per year
> >>> scheme):
> >>>=20
> >>> 1. Leave everything as is
> >>>=20
> >>>    Pro: seems to work for the June release
> >>>    Con: release date for the December release is risky
> >>>=20
> >>> 2. Move releases one month earlier, freeze dates as well (my proposal)
> >>>=20
> >>>    Pro: more time for release at end of the year
> >>>    Con: freeze date end of February at end of Chinese New Year holida=
ys
> >>>   =20
> >>>         in some years (2018 not applicable, as we would move that
> >>>         release by 2 weeks only, so next time this will really hit us
> >>>         will be 2026, maybe a little bit in 2021)
> >>>=20
> >>> 3. Move releases one month earlier, freeze dates before holidays
> >>>=20
> >>>    Pro: developers won't have to let feature slip due to holiday
> >>>    Con: shorter development time for _all_ developers
> >>>=20
> >>> 4. Keep the June release like today, move the December release 2 or 4
> >>>=20
> >>>    weeks earlier
> >>>    Pro: all Pros of 1-3
> >>>    Con: every second release will have shorter development cycle
> >>=20
> >> 5. Go to a yearly release cycle, with June as expected release date.
> >> At the risk of (still) being the only one to dislike the 6-month cycle,
> >> I have to say that there, at the moment, being 4 actively maintained
> >> stable branches and 6 security maintained ones is - just like I did
> >> anticipate back when we discussed the shortening of the cycle - a
> >> significant burden. And we haven't even reached the point yet
> >> where all security maintained branches are from the 6-month cycle.
> >=20
> > I've gotta agree here - I've already been skipping releases to keep up.
> > 4.8
> > was a complete non-starter for me, and 4.10 might be the same. Its
> > exhausting.
> FWIW the CentOS Virt SIG had already decided to only consider updating
> every other release, back when the release cadence was 9 months (leaving
> a year and a half between upgrades).

Understandable.
=20
> But of course, that's in part  because CentOS is meant to be "stodgy and
> reliable".  Fedora and Ubuntu, for instance, have 6-month release
> cycles.  It looks like Ubuntu 17.10 has Xen 4.9 in it; and there's no
> reason to think Ubuntu 18.04 LTS won't have 4.10 in it.

Agreed - but things like Fedora evolve pretty rapidly. I'm not sure Xen is =
in=20
the same rapid development model - so I don't think we should follow suit i=
n=20
this. It would be more than reasonable to have, say, Xen 4.10.0 in one vers=
ion=20
of Fedora - and 4.10.2 in the next...

> Steven, when I glanced at your site it looked like you're actively
> supporting all versions of Xen you've ever released -- is that right?
> If so it's a lot more work than I think anyone else is doing. :-)

Correct. The only versions I don't support are EOL'ed versions and 4.8 - wh=
ich=20
I skipped due to workload.

This means the current build list is 4.5, 4.6, 4.7, 4.9 for both EL6 and EL=
7.

4.2 and 4.4 got EOL'ed a while back and I don't make them available anymore.

If I didn't miss a 4.8 and already had 4.10 out the door, then I'd be=20
publishing 4.5, 4.6, 4.7, 4.8, 4.9 and 4.10. I'm not sure if that's feasibl=
e=20
for anyone - let alone how it'd be managed effectively by the security team!

=46or me personally, December release dates for builds is horrible - so its=
=20
likely just about any December release would be on the ignore list - hence =
I=20
feel a single yearly release in July (+/- up to 2 months) would be fine as =
a=20
target.

=2D-=20
Steven Haigh

=F0=9F=93=A7 netwiz@crc.id.au       =F0=9F=92=BB http://www.crc.id.au
=F0=9F=93=9E +61 (3) 9001 6090    =F0=9F=93=B1 0412 935 897
--nextPart2800510.cViNDkOHev
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEFHf0gfgNrH6ofcYGQa811Xp9MdwFAlo5BUMACgkQQa811Xp9
MdwCzg//aNNxh+o1rkr05JArTzWDIBEe1GfAUg2cOUW3PPb/tQ+o/JGSwPJLZHiX
joya+AKGdG40V32wCUQ86x8SlVLGj2IwapZNFrXVOWqb25m/JNBJZ2WRTHPicA95
o1eg91AcUZ2Y6w9XvR7/Ym+2y/daOXUcQXnBbmxaYLYDmKIEkXKM7A65b5RDGpmf
A90uUZcEyK2aY5Er6tWh9GccNpXIkPbS9LmhNojAP44hGYWQ2x0a4zFwaHLniY5D
g/odyo/lsDEBP0WylfeeDhEtNsjIKD3lGmwL7uINwUyCoApXTPGJvKJhbnsPlJmU
PCBJsolhwAeqNKuX5DjD6jivx6PYbUaM3GMfMiRG806rdusNLXunQHIn2I10HJOb
e8AWl6Vx8ckQWzXxRIN4gSeMoQsDvACSJmec5JKO0eJ5U2pF+ROegkO8V6G0WflC
kdMGATsfg3iDzMZcbtwxeao1PzAGfsnzpNevIsmRdrcLQBAG42UjrnMfZeiThNqU
TGpcU46GIRtORcfT0wbHH8UgW1LKNrg5kY7+Cmwtr7XA3gx1XlaV3MifjeFU/c6P
SbRadz/L4FAsV5cfUUJOttw47phwgixTjcPsHZ3MOVbsx/QCRudR7xRJg8A+WV66
yL8lKOKYVg1JXAgk1izXmHgXXm8GLev+99Pxs01puTCA5Tcvrh4=
=vPkO
-----END PGP SIGNATURE-----

--nextPart2800510.cViNDkOHev--





--===============0207456798680248316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0207456798680248316==--
