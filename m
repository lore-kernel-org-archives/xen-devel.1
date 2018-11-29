From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 11/11] tools/libvchan:
 libxenvchan_client_init: use ENOENT for no server
Date: Thu, 29 Nov 2018 01:01:32 +0100
Message-ID: <20181129000132.GJ2580@mail-itl>
References: <20181108170805.12774-1-ian.jackson@eu.citrix.com>
 <20181108170805.12774-12-ian.jackson@eu.citrix.com>
 <20181110090647.GC4051@mail-itl>
 <23529.34225.339196.925833@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4759316649967946209=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cl6A=OI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gS9m0-0005wJ-GA
 for xen-devel@lists.xenproject.org; Thu, 29 Nov 2018 00:01:40 +0000
In-Reply-To: <23529.34225.339196.925833@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4759316649967946209==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HSQ3hISbU3Um6hch"
Content-Disposition: inline


--HSQ3hISbU3Um6hch
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 12, 2018 at 01:52:49PM +0000, Ian Jackson wrote:
> Marek Marczykowski-G=C3=B3recki writes ("Re: [Xen-devel] [PATCH v2 11/11]=
 tools/libvchan: libxenvchan_client_init: use ENOENT for no server"):
> > Since xtl_log now accepts NULL, it should be fine. Thanks!
> > Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
>=20
> Thanks.
>=20
> I am reluctant to commit this series without having been able to test
> it.  There's the libvchan node.c and node-select.c but they seem a bit
> raw.
>=20
> Do you have a script or something to wrap them up ?

Not really. I've done a manual test, in two domains:

server:    vchan-node2 server $xid2 /local/domain/$xid1/data/vchan/$xid2/12=
34

client:    vchan-node2 client $xid1 /local/domain/$xid1/data/vchan/$xid2/12=
34

($xid1 and $xid2 are domains ID of server and client respectively)

When start it in this order, it works fine. But if I start the client
earlier, I get libxenvchan_*_init: Permission denied. That makes sense -
before server setup permissions on xenstore, the client can't read the
entries but not because of ENOENT, but EACCESS.

> Ideally I guess this would be run by osstest somehow.

I've tried... But stumbled across a bunch of problems:
1. Xen tools are not installed in guest
2. vchan-node* are not installed at all
3. I need two domUs for this (or maybe dom0 and domU?) and processes
running in parallel (this is where my perl ends).

I gave up after point 2. Do you want patches for point 1 and 2 anyway?
New ts-guest-xen-install assume the build for dom0 is fine for domU too
(which is true for Debian)...
As for the second point, I've installed it into $(bindir) as a quick
hack, but not sure if this is the best option.
I'm not jet sure how to put all those pieces together. I guess I need to
edit sg-run-job, but that's jet another language...

BTW vchan doesn't like loopback connections (within the same domain), as
gnttab doesn't like it. Is it something fixable, or is it working as
designed? If the latter, I think at least kernel shouldn't panic in that
case... More details:
https://github.com/QubesOS/qubes-issues/issues/951

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--HSQ3hISbU3Um6hch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlv/LFwACgkQ24/THMrX
1yz80Af9Haj4vMpWccEfH+PySr2d7vSA4KImtSkC1/8h0b+//tQhs2/djDcpYTrQ
YD41t1FtIFhn2udC7s6dy6LYihVBvHsRBgP0zqYQEObMJO8uwqF1xopBhLwa9Bri
6Xs80JqjzgYBEfVp9Oak7ZbUQKnxaqaly+A0B7kKEO0xZy4NU7pZ7LinlXaRHIiw
fEwJ/5NmNcEZWlVFBSjYUvoJBT7xqRUnkURBvBv3BX8fs2bRcLqVNbDqiIbML/I4
oZWOA2j4BhsrWmptbyUhVvB9mzGUmbKuctQJ8GApg16QHWTYW/9fJpfoSzrkvfME
/+clG+9+9wZFkVNZxTwl8zwnwKeF+g==
=05Mn
-----END PGP SIGNATURE-----

--HSQ3hISbU3Um6hch--


--===============4759316649967946209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4759316649967946209==--
