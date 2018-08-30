From: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH 0/2] MMIO emulation fixes
Date: Thu, 30 Aug 2018 10:10:34 +0200
Message-ID: <20180830081034.GA20226@aepfle.de>
References: <e8cff3ca6c154b67a2a932af83719354@AMSPEX02CL03.citrite.net>
 <fdf19f7d-1b92-a9c0-3602-b1c9807bf610@citrix.com>
 <a735b4359ccc4b278330204d9790c6ac@AMSPEX02CL03.citrite.net>
 <5B6DAF9F02000078001DD040@prv1-mh.provo.novell.com>
 <e2f77af0b2394b8f859a1f2dc1a91797@AMSPEX02CL03.citrite.net>
 <5B6DB69D02000078001DD06A@prv1-mh.provo.novell.com>
 <eaab5a73-2910-7fb6-e1fc-08537e63088c@citrix.com>
 <92ca69e5-98b1-61e4-817a-3868f829471a@citrix.com>
 <5B712A3502000078001DD514@prv1-mh.provo.novell.com>
 <20180829103614.GA31376@aepfle.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0855821332266535982=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ntoh=ln=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fvI2N-0006wZ-CF
 for xen-devel@lists.xenproject.org; Thu, 30 Aug 2018 08:10:44 +0000
In-Reply-To: <20180829103614.GA31376@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============0855821332266535982==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Content-Disposition: inline


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 29, Olaf Hering wrote:

> On Mon, Aug 13, Jan Beulich wrote:
>=20
> > And hence the consideration of mapping in an all zeros page
> > instead. This is because of the way __hvmemul_read() /
> > __hvm_copy() work: The latter doesn't tell its caller how many
> > bytes it was able to read, and hence the former considers the
> > entire range MMIO (and forwards the request for emulation).
> > Of course all of this is an issue only because
> > hvmemul_virtual_to_linear() sees no need to split the request
> > at the page boundary, due to the balloon driver having left in
> > place the mapping of the ballooned out page.

So how is this bug supposed to be fixed?

What I see in my tracing is that __hvmemul_read gets called with
gla=3D=3Dffff880223bffff9/bytes=3D=3D8. Then hvm_copy_from_guest_linear fil=
ls
the buffer from gpa 223bffff9 with data, but finally it returns
HVMTRANS_bad_gfn_to_mfn, which it got from a failed get_page_from_gfn
for the second page.

Now things go downhill. hvmemul_linear_mmio_read is called, which calls
hvmemul_do_io/hvm_io_intercept. That returns X86EMUL_UNHANDLEABLE. As a
result hvm_process_io_intercept(null_handler) is called, which
overwrites the return buffer with 0xff.

Olaf

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCW4emdgAKCRBdQqD6ppg2
fuOdAJsFHjshIUBXZ6ws0mvKSCwTdflfygCcCI4UeHOFsmRs4315k6ud32e9tC4=
=wFfC
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--


--===============0855821332266535982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0855821332266535982==--
