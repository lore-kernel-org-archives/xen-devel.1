From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: Re: [PATCH] xen-netfront: Fix hang on device removal
Date: Thu, 19 Apr 2018 18:10:00 +0000
Message-ID: <1b07e839-5633-3b1e-1997-b86a891b2962__5015.62022041089$1524161371$gmane$org@invisiblethingslab.com>
References: <20180228122323.3914-1-jandryuk@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0396672480860812101=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i7pj=hi=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1f9E0z-0003pr-Rk
 for xen-devel@lists.xenproject.org; Thu, 19 Apr 2018 18:10:38 +0000
In-Reply-To: <20180228122323.3914-1-jandryuk@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: netdev@vger.kernel.org
Cc: Eduardo Otubo <otubo@redhat.com>, Juergen Gross <jgross@suse.com>, Jason Andryuk <jandryuk@gmail.com>, open list <linux-kernel@vger.kernel.org>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0396672480860812101==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="myGTiVextl6vFeRqaSm5HcOSlnXDVaIsW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--myGTiVextl6vFeRqaSm5HcOSlnXDVaIsW
Content-Type: multipart/mixed; boundary="gwO90y9nkFM5w1gygVmy6KSInYvYfczEg";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: netdev@vger.kernel.org
Cc: Jason Andryuk <jandryuk@gmail.com>, xen-devel@lists.xenproject.org,
 Eduardo Otubo <otubo@redhat.com>, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 open list <linux-kernel@vger.kernel.org>
Message-ID: <1b07e839-5633-3b1e-1997-b86a891b2962@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH] xen-netfront: Fix hang on device removal
References: <20180228122323.3914-1-jandryuk@gmail.com>
In-Reply-To: <20180228122323.3914-1-jandryuk@gmail.com>

--gwO90y9nkFM5w1gygVmy6KSInYvYfczEg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Jason Andryuk:
> A toolstack may delete the vif frontend and backend xenstore entries
> while xen-netfront is in the removal code path.  In that case, the
> checks for xenbus_read_driver_state would return XenbusStateUnknown, an=
d
> xennet_remove would hang indefinitely.  This hang prevents system
> shutdown.
>=20
> xennet_remove must be able to handle XenbusStateUnknown, and
> netback_changed must also wake up the wake_queue for that state as well=
=2E
>=20
> Fixes: 5b5971df3bc2 ("xen-netfront: remove warning when unloading modul=
e")

I think this should go into stable since AFAIK the hanging network
device can only be fixed by rebooting the guest. AFAICS this affects all
4.* branches since 5b5971df3bc2 got backported to them.

Upstream commit c2d2e6738a209f0f9dffa2dc8e7292fc45360d61.

Simon


--gwO90y9nkFM5w1gygVmy6KSInYvYfczEg--

--myGTiVextl6vFeRqaSm5HcOSlnXDVaIsW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAlrY27MACgkQkO9xfO/x
ly+uSxAAyh4Burc07vRFEo20sKnzrVL5x7BqgQAznYOWKsB5D6Yb1VaG11GTZfBp
G5FiaorTVm9zdqmIddxBgBZINtn2/SWvr5LwJfeYBjebBtccu+91CyeDT0P0T56l
FVut4ON195ZLYfH8eXE8y9Nvqh8M50n9dmeINrrelYzLbrkP6h9TSJ1h1tz4Jing
o+kBnjQJ9wGAuAQyWv2053ta/3oCYOI4DZsFcFhDZcCuEz6Kll4a/WeSA8QcLp9y
m3iTqIAxtbom+DHfWaZnRD9GO4nxflDJb9Xt34TxJn3RKn34XZ+NSVUPkz2l44oS
k6OowweN7/faH1SuVl2UTfcMflBNjISzQddXfHUpdfk9nNMSe9k3jnrRkWGfBmvA
FbiBhmUXcEAVYRDdiOgKMtnKboY1lWKaNE1CdoVdMBo32FgJc1eKWOwV6LiQ1Xpo
gNfjfZqmvJ8ok9Px4sg12wlSXkchtocRup48FTPHvdqdUAQXDwPM7iS1KGLKQ+QA
8OayJEV19dyLQDRPy2kqynxJzt/0qX0hp/bNWG4MPawWJmSi2h5Mt2UrFsKqXEXa
1DzGw0pmN2NaN8mdhcW1NEe098qh9qipIiEGHqN9qkYkt2wtYZF6+p/Vf6zX7lb7
7vVbIvctoeGDpN9Q8eZYTUTwuDHAZcVZed2Dikrj+nk37pDxYqo=
=a9YR
-----END PGP SIGNATURE-----

--myGTiVextl6vFeRqaSm5HcOSlnXDVaIsW--


--===============0396672480860812101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0396672480860812101==--
