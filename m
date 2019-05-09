From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
Date: Thu, 9 May 2019 02:22:39 +0200
Message-ID: <20190509002239.GD24075@mail-itl>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <5CD14ACF020000780022C643@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1315688432485235332=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOWpl-0005Xc-4L
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 00:22:49 +0000
In-Reply-To: <5CD14ACF020000780022C643@prv1-mh.provo.novell.com>
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


--===============1315688432485235332==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline


--eheScQNz3K90DVRs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 03:07:27AM -0600, Jan Beulich wrote:
> >>> On 06.05.19 at 16:50, <marmarek@invisiblethingslab.com> wrote:
> > --- a/xen/drivers/video/vesa.c
> > +++ b/xen/drivers/video/vesa.c
> > @@ -84,6 +84,7 @@ void __init vesa_early_init(void)
> >  void __init vesa_init(void)
> >  {
> >      struct lfb_prop lfbp;
> > +    unsigned long lfb_base;
> > =20
> >      if ( !font )
> >          return;
> > @@ -97,15 +98,17 @@ void __init vesa_init(void)
> >      lfbp.text_columns =3D vlfb_info.width / font->width;
> >      lfbp.text_rows =3D vlfb_info.height / font->height;
> > =20
> > -    lfbp.lfb =3D lfb =3D ioremap(vlfb_info.lfb_base, vram_remap);
> > +    lfb_base =3D vlfb_info.lfb_base;
> > +    lfb_base |=3D (unsigned long)vlfb_info.ext_lfb_base << 32;
> > +    lfbp.lfb =3D lfb =3D ioremap(lfb_base, vram_remap);
> >      if ( !lfb )
> >          return;
> > =20
> >      memset(lfb, 0, vram_remap);
> > =20
> > -    printk(XENLOG_INFO "vesafb: framebuffer at %#x, mapped to 0x%p, "
> > +    printk(XENLOG_INFO "vesafb: framebuffer at %#lx, mapped to 0x%p, "
> >             "using %uk, total %uk\n",
> > -           vlfb_info.lfb_base, lfb,
> > +           lfb_base, lfb,
> >             vram_remap >> 10, vram_total >> 10);
> >      printk(XENLOG_INFO "vesafb: mode is %dx%dx%u, linelength=3D%d, fon=
t %ux%u\n",
> >             vlfb_info.width, vlfb_info.height,
> > @@ -152,6 +155,10 @@ void __init vesa_mtrr_init(void)
> >          MTRR_TYPE_WRCOMB, MTRR_TYPE_WRTHROUGH };
> >      unsigned int size_total;
> >      int rc, type;
> > +    unsigned long lfb_base;
> > +
> > +    lfb_base =3D vlfb_info.lfb_base;
> > +    lfb_base |=3D (unsigned long)vlfb_info.ext_lfb_base << 32;
> > =20
> >      if ( !lfb || (vesa_mtrr =3D=3D 0) || (vesa_mtrr >=3D ARRAY_SIZE(mt=
rr_types)) )
> >          return;
> > @@ -167,7 +174,7 @@ void __init vesa_mtrr_init(void)
> > =20
> >      /* Try and find a power of two to add */
> >      do {
> > -        rc =3D mtrr_add(vlfb_info.lfb_base, size_total, type, 1);
> > +        rc =3D mtrr_add(lfb_base, size_total, type, 1);
> >          size_total >>=3D 1;
> >      } while ( (size_total >=3D PAGE_SIZE) && (rc =3D=3D -EINVAL) );
> >  }
>=20
> Imo the result would be better readable if, instead of the local
> variables, you introduced an inline helper lfb_base().

Not necessarily - vlfb_info is a #define to vga_console_info.u.vesa_lfb.
This means such helper would either not have any parameters, or would
need to have full struct xen_console_info as a parameter (inner
structure is anonymous). In both cases, it won't be obvious that
lfb_base live inside vlfb_info. I could add yet another #define instead
of inline function for that, but it wouldn't avoid the second (minor)
issue: a helper without a variable would mean reading the value twice in
vesa_init(). In theory it shouldn't change in the meantime, but IMO
better avoid it anyway.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzTcs8ACgkQ24/THMrX
1ywypgf9FnNpig05C6LReZHSLjSgz2S0mYHEhz9ki0UedKlFSQ+KIa0RcBG4erXr
OgevlkeZ5tRrzlRybApQoleZrGSaoe0rNN0go0K4sbKbVLnrjnqjovS9mdRsTEPQ
Izgqq9kq5dLjvOC5JatPGCO4vvX6wrvHjk0J09bC13OJxWnXqtI2bGhx683qH1ue
oH3htvWaI33YKtgxeii3HT8rlzQyX4jlXyTHig2QQFE2N+TVbisyobHJJ0/qpFr0
RRd9FiUb7AlEwaP9mG7cWZbAXsbFqOQw01NcXI8T99uYaJz9glcTqncFDGMwhhaS
XMREBvUva1ntzca77/HIOrVBrlyUKA==
=TwOw
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--


--===============1315688432485235332==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1315688432485235332==--
