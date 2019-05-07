From: Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 1/5] xen/bitmap: fix bitmap_fill with
 zero-sized bitmap
Date: Tue, 7 May 2019 17:19:45 +0200
Message-ID: <20190507151945.GZ1502@mail-itl>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <e54979f9ce16c254c78e4a48e3e5c0eb223f6dac.1557154206.git-series.marmarek@invisiblethingslab.com>
 <5CD13D6C020000780022C5CA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4590294856483203615=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vvNG=TH=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hO1sm-0000gX-MX
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:19:52 +0000
In-Reply-To: <5CD13D6C020000780022C5CA@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============4590294856483203615==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dA3KA1Bq6vhZBZVs"
Content-Disposition: inline


--dA3KA1Bq6vhZBZVs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 02:10:20AM -0600, Jan Beulich wrote:
> >>> On 06.05.19 at 16:50, <marmarek@invisiblethingslab.com> wrote:
> > Found while debugging framebuffer located above 4GB. In that case 32bit
> > variable for it overflows and framebuffer initialization zeroed
> > unrelated memory. Specifically, it hit mbi->mods_count, so later on
> > bitmap_fill(module_map, mbi->mods_count) in __start_xen() crashed.
>=20
> The origin of your problem being a truncation one, it seems pretty
> clear to me that if we want to be able to gracefully handle that,
> then we need to stop using plain int in all the involved functions.
> I'm curious though which bitmap_fill() it was that you saw misbehave:
> There's no such call at all in xen/drivers/video/, and I'm also having
> a hard time seeing how the address (rather than the size) of the
> frame buffer could be involved here.

Truncated framebuffer address (0x0) caused memset() in vesa_init() to
zero (among other things) mbi->mods_count. This triggered the crash as
described above.
Obviously, bitmap_fill() crash was just a fallout here, not the root
cause.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--dA3KA1Bq6vhZBZVs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzRohEACgkQ24/THMrX
1yzPsggAj2gO+ZICqYmXZHyVYEJVYaNpJjFeTvJ/yLeON6OhXQJf0a4179QMEN7t
e4KzfZR6tNSm9Tu4QDsoxn942Qzq98G7P2jg4X4/b6IDUBckB1jQ/sJJAhy/SZSc
/PaQBOH4Rb/cLlSPt4dc5sKMVEI7wdamqcb8tJBxIXsOwSFdHJdcByuQs9p/TCHj
yjAzia/+Be1WZOBW/SHf/j/On7G53VbxhxLPLca8oOllY02wkOM5ath3vcdvGuba
VngNWkFiqhtuv3uZSc+V5MzCCsa0WZBw88gobuwSYp5B9hBrL13EbaLh18iBnoxv
H+O4wv8dVyvIPrCsQHFtsuiJXeYalQ==
=Psk7
-----END PGP SIGNATURE-----

--dA3KA1Bq6vhZBZVs--


--===============4590294856483203615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4590294856483203615==--
