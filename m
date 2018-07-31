From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools/gdbsx: fix 'g' packet response for
 64bit guests
Date: Tue, 31 Jul 2018 18:10:07 +0200
Message-ID: <20180731161007.GR1371@mail-itl>
References: <20180731023042.19031-1-marmarek@invisiblethingslab.com>
 <20180731090024.xbovqmyfrj6xiaid@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5363988781829150958=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180731090024.xbovqmyfrj6xiaid@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org


--===============5363988781829150958==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+GDz8FH0cDPsW8g2"
Content-Disposition: inline


--+GDz8FH0cDPsW8g2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2018 at 10:00:24AM +0100, Wei Liu wrote:
> On Tue, Jul 31, 2018 at 04:30:42AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > --- a/tools/debugger/gdbsx/gx/gx_local.c
> > +++ b/tools/debugger/gdbsx/gx/gx_local.c
> > @@ -45,8 +45,8 @@ prnt_32regs(struct xg_gdb_regs32 *r32p)
> >  static void
> >  prnt_64regs(struct xg_gdb_regs64 *r64p)
> >  {
> > -    printf("rip:"XGF64" rsp:"XGF64" flags:"XGF64"\n", r64p->rip, r64p-=
>rsp,
> > -           r64p->rflags);
> > +    printf("rip:"XGF64" rsp:"XGF64" flags:%08x\n", r64p->rip, r64p->rs=
p,
> > +           r64p->eflags);
>=20
> I think it would be better to introduce XGF32 and XGFM32 in the header.

I was inspired by prnt_32regs function, which use explicit %08x. Should
it be changed there too (to PRIx32)? Otherwise that would be
inconsistent (and maybe warrant a totally separate cleanup).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+GDz8FH0cDPsW8g2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAltgid8ACgkQ24/THMrX
1yyvPwf8DDOjdPHSpE7as4hNhFYgvbtK+K4ltpX8T1e+eEqeUvmvM7HaoIH2g1WE
+wOF57HBCX2rieaDXEF4bhTz4iRPo3vvwgsk3mCiCG6oEDdxGlisyPGa3e15vXsW
NviaIM+UAoeKd8UxuoTyfUuuIYHNHu/QYgKDHKK24UBaad1hwCATScfD/0q+3KhF
GJr4BlLrbd/IFMTq3wNPcdzNTdIPjEoW7Iidkjfn8yZ2kbHPc/mKptKlN9Aa5vqw
v2ZmFu+jJZO6ootGtNZ0H2y+vB6e5RuoExEiYGkpytZ3aDhBS9CCxfl4Y3RlD8e1
y+uru2BCJALXL5ZG1FGaFsGFahl3iA==
=IVod
-----END PGP SIGNATURE-----

--+GDz8FH0cDPsW8g2--


--===============5363988781829150958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5363988781829150958==--
