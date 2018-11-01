From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2 15/17] xenconsoled: add support for
 non-pty output
Date: Thu, 1 Nov 2018 18:54:00 +0100
Message-ID: <20181101175400.GC1638@mail-itl>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <ffe791977a14b8b3e06d13ac8626a25bf0530a81.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23515.14664.497790.457717@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6891203966603595945=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=7tsl=nm=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gIHAU-0004tg-IP
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 17:54:06 +0000
In-Reply-To: <23515.14664.497790.457717@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6891203966603595945==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+nBD6E3TurpgldQp"
Content-Disposition: inline


--+nBD6E3TurpgldQp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 01, 2018 at 05:35:04PM +0000, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("[RFC PATCH v2 15/17] xenconsoled=
: add support for non-pty output"):
> > Handle 'output' xenstore entry, as qemu does. Right now support only few
> > simple options:
> >  - "pty" (unchanged)
> >  - "file:path" (overwrite file)
> >  - "pipe:path" (read-write file/pipe)
> >  - "null"
>=20
> I have always thought the qemu set of console things very awkward to
> deal with.  pipe, in particular, is very awkward to use because pipes
> have poor semantics for this.

In fact libxl usage of "pipe" isn't about pipe at all. It's about
reading from normal file. This rely on a qemu fallback "pipe" handling -
first it looks for two pipes: path.in and path.out (for in- and
out-bound data). When it doesn't find them, it fallback to just "path"
opened for read and write.
And libxl use that fallback only. With normal file (see below).

> Would it be useful if I implemented a facility for xenconsoled to make
> an AF_UNIX listening socket for each console it handles ?  People who
> wanted to talk to the console would connect() to it.

This is meant to be compatible with other console backend(s) - namely
qemu-xen and qemu-xen-traditional. If xenconsoled backend for N>1
consoles would behave differently (in a way not supported by qemu one),
each place would need additional handling for that...
There are not many places though: "file:" is used to write qemu-dm (in
stubdomain) state to a file and "pipe:" is used to read it from that
file.

Note that real pipes are not used here at all. This is just awkward
naming for "read from this file".

> Multiple connections would be supported a la screen or tmux, although
> of course for your application you'd use a lock to prevent multiple
> access.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+nBD6E3TurpgldQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlvbPbgACgkQ24/THMrX
1yzdxwf/Y86WtL8L1BbVs3u/KIpDai78UFRCjmPz1Y3mPyinnO3D9QoNLjrdnEG+
LIDyl0y425yCeTfw3GX8qKi2rr7ajpyzMJHhNPkDxi5EqEb5rkCZytq3aDzcjt0q
LZ64K2YupjHibHbQqzZG94IyJ1smFCdZIllakfdCc9mEyI7nw2pFAof8cFFJqGDS
aLzFearAXYjue7V6wrvx9/oxXIfn7N7SNRDuWN7t2HfjsgHw/VXpOhaGYvweUo2w
KXVNwqhb96ye9/EPN8vRtYD8mRdncRHLjLYrqpO9uk/3kOOijHmhNhaoXLBBFIrB
sTreFw4WbNq+mKfmiNwtq/CHUT6PJA==
=bLMl
-----END PGP SIGNATURE-----

--+nBD6E3TurpgldQp--


--===============6891203966603595945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6891203966603595945==--
