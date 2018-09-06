From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] xen/balloon: add runtime control for
 scrubbing ballooned out pages
Date: Thu, 6 Sep 2018 22:59:09 +0200
Message-ID: <20180906205909.GK1353__2265.06438707492$1536267485$gmane$org@mail-itl>
References: <20180906153355.25363-1-marmarek@invisiblethingslab.com>
 <bf287a28-5e40-1ea2-a983-3d6a8e9a9869@oracle.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4509824061444755804=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n4la=lu=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1fy1Mx-0001jG-Uz
 for xen-devel@lists.xenproject.org; Thu, 06 Sep 2018 20:59:16 +0000
In-Reply-To: <bf287a28-5e40-1ea2-a983-3d6a8e9a9869@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org


--===============4509824061444755804==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IR1Y5IvQhrKgS4e6"
Content-Disposition: inline


--IR1Y5IvQhrKgS4e6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2018 at 04:14:50PM -0400, Boris Ostrovsky wrote:
> You can also use cmdline_find_option() in the balloon driver.

This looks to be x86 only (?!), which doesn't sound right in
drivers/xen/. I'll use core_param() for now...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--IR1Y5IvQhrKgS4e6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAluRlR0ACgkQ24/THMrX
1yww7wf/ZnwHnaM/MC9JRClrMN7zchfCYYQiaeU53sYzyH/l7HTU0sIrL/x43ZE1
vVRGH+Bb9rv/8JUaBGnAnQVVLIEuo1F9Pr53eVlawclnsgTKxOm1C0YBd5lnomCA
CxJCbBB2iEON4pSKQxoDZYi/X/iddawWqY2g49KcZ+1baP4PVDpXOsxq6rprYLQ3
4CrJpgxfG43V0rFrjNxNnogckJSOfZjGXnIyfwW/3tUgkOmLrzO/TLi+dhWJQuHS
jTyEEwGteZMDv53HTQZY8Ys+G9KKWkli2kPGbtnECnCuNhuuu19yo+EPT0YUpLUR
vuuY0Bv2g0g8/OTZ09DonYzszQYbKA==
=t/AJ
-----END PGP SIGNATURE-----

--IR1Y5IvQhrKgS4e6--


--===============4509824061444755804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4509824061444755804==--
