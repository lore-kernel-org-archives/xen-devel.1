From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 1/1] xen: fix handling framebuffer
 located above 4GB
Date: Thu, 16 May 2019 17:45:13 +0200
Message-ID: <20190516154513.GS1502@mail-itl>
References: <cover.36e828561477c30a5472a8e9213ab0efc5484de8.1558015595.git-series.marmarek@invisiblethingslab.com>
 <cover.36e828561477c30a5472a8e9213ab0efc5484de8.1558015595.git-series.marmarek@invisiblethingslab.com>
 <93faeff91ee3e14320b5048818badc38460143e7.1558015595.git-series.marmarek@invisiblethingslab.com>
 <5CDD7AD8020000780022FC7B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0183971947327430213=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Eh32=TQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hRIZO-0004oX-8B
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:45:22 +0000
In-Reply-To: <5CDD7AD8020000780022FC7B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============0183971947327430213==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4tkssvp36SW1tyIS"
Content-Disposition: inline


--4tkssvp36SW1tyIS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 08:59:36AM -0600, Jan Beulich wrote:
> >>> On 16.05.19 at 16:07, <marmarek@invisiblethingslab.com> wrote:
> > --- a/xen/drivers/video/vesa.c
> > +++ b/xen/drivers/video/vesa.c
> > @@ -40,6 +40,11 @@ static int __init parse_font_height(const char *s)
> >  }
> >  custom_param("font", parse_font_height);
> > =20
> > +static inline paddr_t lfb_base(void)
> > +{
> > +    return (paddr_t)((vlfb_info.ext_lfb_base) << 32) | vlfb_info.lfb_b=
ase;
>=20
> I'm afraid you've misplaced the parentheses here. I wonder if
> this has worked for you at all.

Indeed it's messed up...

>     return ((paddr_t)vlfb_info.ext_lfb_base << 32) | vlfb_info.lfb_base;

This works fine.

> > --- a/xen/include/public/xen.h
> > +++ b/xen/include/public/xen.h
> > @@ -923,6 +923,11 @@ typedef struct dom0_vga_console_info {
> >              /* Mode attributes (offset 0x0, VESA command 0x4f01). */
> >              uint16_t mode_attrs;
> >  #endif
> > +#if __XEN_INTERFACE_VERSION__ >=3D 0x00040d00
> > +            uint16_t _pad;

And also compat checker don't like this name. I've changed it to "pad"
(v4 upcoming).

> > +            /* high 32 bits of lfb_base */
> > +            uint32_t ext_lfb_base;
> > +#endif
>=20
> Strictly speaking the padding field belongs ahead of the earlier
> #endif.
>=20
> Both aspects can be fixed while committing, but confirmation on
> the first wrt it working for you would still be nice. With them in
> place
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--4tkssvp36SW1tyIS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzdhYkACgkQ24/THMrX
1yzlQQf5AdkV3enTF5zr50XdDaPnFTnE8fRQYAm5w2EXS16kzZCCmi1M3Zc6ccAZ
8nBknfvFziXafzVNShgMNxKLtPxaOAz6JAu+lTdzYSUOAW5DzVAxkmZkJcRiUpCw
m6ShTl1rrUEGSKd1gqQSRVv4Qw0RVNTewSQ7Z31T3sNGFvuHQTg2xa+WS6JiWB59
GfW3Rl8ZXBdBXZGDYLIf7SqeLkmckhONbHI5MhDb6F+AcWer+qSJNPfxVk/NnubF
jtDko8Nrw9JlWxu6KapfqoP2OHdTDWLhjOd8C29+Am5sX01FqCx6r9cyZUl7nXSj
4KMisfvuyTCJD6Yp3EF6aRt2NJMzMw==
=+I7K
-----END PGP SIGNATURE-----

--4tkssvp36SW1tyIS--


--===============0183971947327430213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0183971947327430213==--
