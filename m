From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v2] new config option vtsc_khz_tolerance to
 avoid TSC emulation
Date: Mon, 5 Mar 2018 15:18:35 +0100
Message-ID: <20180305151835.6d36d52e.olaf@aepfle.de>
References: <20180305113555.8467-1-olaf@aepfle.de>
 <5A9D51A902000078001AE868@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0191532364985545712=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A9D51A902000078001AE868@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Marek =?UTF-8?B?TWFyY3p5a293c2tp?= =?UTF-8?B?LUfDs3JlY2tp?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

--===============0191532364985545712==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/i3Kus254lhe=0HvR8SRBYrt"; protocol="application/pgp-signature"

--Sig_/i3Kus254lhe=0HvR8SRBYrt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 05 Mar 2018 06:18:17 -0700
schrieb "Jan Beulich" <JBeulich@suse.com>:

> >>> On 05.03.18 at 12:35, <olaf@aepfle.de> wrote: =20
>=20
> One thing I'm missing in the description (or the added documentation)
> is a discussion of the conditions under which it is safe to make use of
> the new setting.

The same rules as tsc_mode=3Dnative apply, I think.
xen-tscmode(7) has to be updated as well to cover the new knob.


> > +    case XEN_DOMCTL_set_vtsc_khz_tolerance:
> > +        if ( d =3D=3D currd )
> > +            ret =3D -EINVAL; =20
> Why? There's e.g. no domain_pause() involved here.

I have thought about that. Now I think that part can be even simpler,
just like the following XEN_DOMCTL_suppress_spurious_page_faults:
just change that read-only value unconditionally. There is no obvious
harm in changing that value.

> Also throughout the patch I wonder if it wasn't more natural to
> put the unit last in the parameter / field names.

That was just to keep the diff slightly smaller.


> > +            printk(XENLOG_WARNING "%s: d%u: host has %lu kHz,"
> > +                   " domU expects %u kHz,"
> > +                   " difference of %u is %s tolerance of %u\n",
> > +                   __func__, d->domain_id, cpu_khz, gtsc_khz, khz_diff,
> > +                   diff_tolerated ? "within" : "outside", vtsc_khz_tol=
erance); =20
> Leftover debugging message?

I think it is worth to log that event, perhaps not with WARNING level.


Olaf

--Sig_/i3Kus254lhe=0HvR8SRBYrt
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCWp1RuwAKCRBdQqD6ppg2
fprlAJ9rgwvfYhphmPIM332meSeS3bRcNwCeM+Wk/3p0RFIVSULxyn7SsKeBzuY=
=HlHl
-----END PGP SIGNATURE-----

--Sig_/i3Kus254lhe=0HvR8SRBYrt--


--===============0191532364985545712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0191532364985545712==--
