From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 5/6] xen-pt: Hide MSI-X from xen stubdoms
Date: Tue, 12 Mar 2019 13:38:08 +0100
Message-ID: <20190312123808.GG1208@mail-itl>
References: <20190311180216.18811-1-jandryuk@gmail.com>
 <20190311180216.18811-6-jandryuk@gmail.com>
 <20190312120419.2fdqh3atomnafvby@Air-de-Roger>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6615086357452751542=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VpTG=RP=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1h3gfl-0005lE-Jt
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 12:38:21 +0000
In-Reply-To: <20190312120419.2fdqh3atomnafvby@Air-de-Roger>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: James McKenzie <james.mckenzie@bromium.com>, Stefano Stabellini <sstabellini@kernel.org>, Jason Andryuk <jandryuk@gmail.com>, qemu-devel@nongnu.org, Paul Durrant <paul.durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============6615086357452751542==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kjpMrWxdCilgNbo1"
Content-Disposition: inline


--kjpMrWxdCilgNbo1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 12, 2019 at 01:04:19PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 11, 2019 at 02:02:15PM -0400, Jason Andryuk wrote:
> > MSI-X is not supported in Xen stubdoms, so it must be disabled.  Use the
> > existing xen_pt_hide_dev_cap to hide when running under -xen-stubdom.
>=20
> I'm afraid this requires some more context. What's the actual issue
> that prevents MSI-X from working?

At least missing "Fix PCI passthrough for HVM with stubdomain" series,
but that's mostly on Xen side (+ one change how QEMU enable MSI-X in
config space).
Some of it can be worked around by enabling permissive mode. Jason, did
you had a chance to test it with any MSI-X device?
I'm not aware of anything thing particular that breaks MSI-X but not
MSI. Besides much less devices lying around to test MSI-X...

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--kjpMrWxdCilgNbo1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlyHqDAACgkQ24/THMrX
1yzeHwf/XwPA0FMRHQyU0ATNE2XUKqTI+lAsyHxVwkR21yAGdnkYvejhpgZVHeDS
3y3U6k3k+SMrL8LEqDQn7iwnE07DXElvG3ZDQogs0kFMKQKcXDtQiBv+nIK1tFjy
Uaa1CRqrs3t0cn+CAuqIB34jvP1K8vM0ikKPnu25CxoNKQKeKMiotzjLReaUuPWw
5PI0380B0+cvj7PiOgtCVpd3ru7aHVCl/9AJ3TfQXBL4S3m5uT8857q76peQp3Aj
T6hj5yhvT010LSBxhpTr/ed5vCMMp09XWv/onHHmvdPhBNmghchle6MhZ0k7pg5H
NYfN2ghhV++qZQG8ye/jOC5WI9JhqA==
=zGf1
-----END PGP SIGNATURE-----

--kjpMrWxdCilgNbo1--


--===============6615086357452751542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6615086357452751542==--
