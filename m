From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
Date: Mon, 6 May 2019 17:32:11 +0200
Message-ID: <20190506153211.GV1502@mail-itl>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4163486073433210775=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SrHI=TG=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hNfbG-0008PX-C3
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:32:18 +0000
In-Reply-To: <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4163486073433210775==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KqIDP7BYbqnwKRO+"
Content-Disposition: inline


--KqIDP7BYbqnwKRO+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2019 at 05:15:19PM +0200, Juergen Gross wrote:
> On 06/05/2019 16:50, Marek Marczykowski-G=C3=B3recki wrote:
> > diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
> > index ccdffc0..b0f0f7e 100644
> > --- a/xen/include/public/xen.h
> > +++ b/xen/include/public/xen.h
> > @@ -923,6 +923,8 @@ typedef struct dom0_vga_console_info {
> >              /* Mode attributes (offset 0x0, VESA command 0x4f01). */
> >              uint16_t mode_attrs;
> >  #endif
> > +            /* high 32 bits of lfb_base */
> > +            uint32_t ext_lfb_base;
>=20
> You will need to put this addition into an:
>=20
> #if __XEN_INTERFACE_VERSION__ >=3D 0x00040d00
> ...
> #endif
>=20
> section (only available from Xen 4.13 onwards).

Why exactly? I don't see this structure used in any hypercall argument.
The only externally accessible place is start_info structure, where it
has explicit struct size already.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--KqIDP7BYbqnwKRO+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzQU3sACgkQ24/THMrX
1yxvhgf/W0E+dpMj3QuSPUyAea+Z/Cr2MIxYS8Fb4AD2PAKmW6jomNCMcQIa1i2A
vtWaOfhExbEOO35cYe4dyqFHG+C+1/49fuCOuYlu3cUnR+Dhw5qXF3LhUe6PX2mm
5CKtYn6Y81HdpbL/Baz7dMd7X/U5UKJJge6evNtcqQyRogVne4SA+sFaN7UgeyLT
UuwfTVD/N0QFxna0b4kl5pWuBOP/MIRYjQQdT5kVP+6dkFWxsO2odW33dLqEVO6o
kyrBpeuU1n06AIQ0f7m3SaxEoRioPgKF6oavlVgThdBRPMmLdB89kocybdMvc+GU
7UcFy7BGhslTSntgWE+KKq6y74R0VQ==
=KbC2
-----END PGP SIGNATURE-----

--KqIDP7BYbqnwKRO+--


--===============4163486073433210775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4163486073433210775==--
