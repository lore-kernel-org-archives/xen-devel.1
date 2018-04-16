From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] tools/kdd: silence gcc 8 warning a
 different way
Date: Mon, 16 Apr 2018 14:43:32 +0200
Message-ID: <20180416124332.GK27518@mail-itl>
References: <5ACF678102000078001BAA8E@prv1-mh.provo.novell.com>
 <20180416103332.jqap6zhrsm3aul3z@citrix.com>
 <5AD4906502000078001BBABF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6857069312579491840=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uc13=hf=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1f83Vc-0007c3-Lg
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 12:45:24 +0000
In-Reply-To: <5AD4906502000078001BBABF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============6857069312579491840==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fjX3cMESU3XgGmZ"
Content-Disposition: inline


--2fjX3cMESU3XgGmZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 16, 2018 at 06:00:37AM -0600, Jan Beulich wrote:
> >>> On 16.04.18 at 12:33, <wei.liu2@citrix.com> wrote:
> > On Thu, Apr 12, 2018 at 06:04:49AM -0600, Jan Beulich wrote:
> >> Older gcc doesn't like "#pragma GCC diagnostic" inside functions.
> >>=20
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>=20
> >> --- a/tools/debugger/kdd/kdd.c
> >> +++ b/tools/debugger/kdd/kdd.c
> >> @@ -695,10 +695,10 @@ static void kdd_handle_read_ctrl(kdd_sta
> >>              KDD_LOG(s, "Request outside of known control space\n");
> >>              len =3D 0;
> >>          } else {
> >> -#pragma GCC diagnostic push
> >> -#pragma GCC diagnostic ignored "-Warray-bounds"
> >> -            memcpy(buf, ((uint8_t *)&ctrl.c32) + offset, len);
> >> -#pragma GCC diagnostic pop
> >> +            /* Suppress bogus gcc 8 "out of bounds" warning. */
> >> +            const uint8_t *src;
> >> +            asm ("" : "=3Dg" (src) : "0" ((uint8_t *)&ctrl.c32 + offs=
et));
> >> +            memcpy(buf, src, len);
> >=20
> > The code looks correct to me:
> >=20
> > Reviewed-by: Wei Liu <wei.liu2@citrix.com>
> >=20
> > This will hopefully also fix the issue Boris reported that some older
> > gcc (<4.6) doesn't support push and pop.
> >=20
> > This is the first time I see inline assembly is used to silence gcc.
> > ;-)
>=20
> And I'm not overly happy about it, but couldn't think of a better way
> without disabling said warning (or -Werror) altogether for the CU. If
> Ian's sketched out approach worked, I'd be quite happy to drop the
> patch here.

What about changing offset type to uint32_t (or similar), which also
mute the warning?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--2fjX3cMESU3XgGmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlrRrLIACgkQ24/THMrX
1yy71Af+OxLjE/Po2BOXJTR19xR/cyGqf/Se340J+BUVgNEabpWDyd7qKf1lB/n6
U2HIE98RRdxLPE0HFQfL+bOfED/XbFgrbCuFyDgcIhCU5jXW0LFY3xZlch1sByB6
a8MDiKmHy+0buoYZmbtXoFPGyH9RVHynfMUDJrPIU3YTaZwHT2mHwlTT6L1GJUYN
3IEIysIf0EjNsESH2+XTu6UlENNUKO6yK63loBOBUUXyg37qihQ9nuXUXIz6XOD8
s8QKqjaED0IMUHJAotOlZnLHLfuQZFzXgU8Ek64y58qPvR+TW4lvj/X8aq5ngl6m
76IaA7SMFWe8AuZwCCDzeg9H7QwbtA==
=5GLz
-----END PGP SIGNATURE-----

--2fjX3cMESU3XgGmZ--


--===============6857069312579491840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6857069312579491840==--
