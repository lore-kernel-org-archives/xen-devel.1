From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools/kdd: use mute -Warray-bounds only on
 new gcc version
Date: Sat, 7 Apr 2018 00:39:15 +0200
Message-ID: <20180406223915.GO3176@mail-itl>
References: <20180406151246.c5s6zig3m73bcmb4@citrix.com>
 <20180406153258.29262-1-marmarek@invisiblethingslab.com>
 <20180406171250.23jdnyrg25ft4yhv@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5255238401600378611=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180406171250.23jdnyrg25ft4yhv@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============5255238401600378611==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cmVHo2jXx4bdYlgS"
Content-Disposition: inline


--cmVHo2jXx4bdYlgS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 06, 2018 at 06:12:50PM +0100, Wei Liu wrote:
> On Fri, Apr 06, 2018 at 05:32:57PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > "#pragma GCC diagnostic push" is supported only on gcc >=3D 4.6. But si=
nce
> > muting this the warning is needed only on gcc >=3D 8, do it only then,
> > instead of tricking the compiler about this code (and making it less
> > readable to the human too).
> >=20
> > This fixes 5888eecca0 "tools/kdd: mute spurious gcc warning".
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  tools/debugger/kdd/kdd.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/tools/debugger/kdd/kdd.c b/tools/debugger/kdd/kdd.c
> > index 61d769ece9..95c3a949ec 100644
> > --- a/tools/debugger/kdd/kdd.c
> > +++ b/tools/debugger/kdd/kdd.c
> > @@ -695,10 +695,14 @@ static void kdd_handle_read_ctrl(kdd_state *s)
> >              KDD_LOG(s, "Request outside of known control space\n");
> >              len =3D 0;
> >          } else {
> > +#if __GNUC__ >=3D 8
> >  #pragma GCC diagnostic push
> >  #pragma GCC diagnostic ignored "-Warray-bounds"
> > +#endif
> >              memcpy(buf, ((uint8_t *)&ctrl.c32) + offset, len);
> > +#if __GNUC__ >=3D 8
> >  #pragma GCC diagnostic pop
> > +#endif
>=20
> Oh thanks for the quick turnaround.
>=20
> Since Tim thinks it is better to not disable the warning -- how about
> using assert() to give the compiler a hint? Would that work?

No, it doesn't.

Changing offset type to uint32_t, or unsigned int works. Also adding
"offset &=3D 0x2ff" helps (but changes behavior). And now I wonder if
this warning isn't legitimate - maybe there is some int overflow case
that I don't see?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--cmVHo2jXx4bdYlgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrH9xMACgkQ24/THMrX
1yymyAf/bxY3WMp/ozmEz4vhtALya/GM6QW+azIhZH0df/Yhm/lwMNxEtEzwooR8
KcR7FDunRqZ5EJ9UGNuXplWPC075Ji1WhSbsr8KEDFyZjRNhN6hBmeFhBYZ+UvM2
RQLXCNSQEd8yY1AOgotMrYBSy89pqqxgBp0U17ZEG0o/djOaeygpsauv9p0CelU+
VimL6DkKmLVxl8VZ336fgR5IBw+m3VFcSOiArb0Q6HJr2MpPPvRz3V67HkxhzPOW
5jsKjzttYIcFxrpdsekhQHDplUK69JTAQzPeCucV+yW5hGhgcxpODS1UAjskuQHT
9Qzf9qArGYIHWTqszFSzicDPvsVBqA==
=ziGq
-----END PGP SIGNATURE-----

--cmVHo2jXx4bdYlgS--


--===============5255238401600378611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5255238401600378611==--
