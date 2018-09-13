From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] Make credit2 the default scheduler
Date: Thu, 13 Sep 2018 18:51:19 +0200
Message-ID: <cc2e661cc8543353929aebf1f190abd109ff2b82.camel@suse.com>
References: <20180913163848.32216-1-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6718293843228149948=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tvlc=l3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g0UqN-0002OX-Hx
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 16:51:51 +0000
In-Reply-To: <20180913163848.32216-1-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6718293843228149948==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-RgkdKa55KUECZrNu17Wy"


--=-RgkdKa55KUECZrNu17Wy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-09-13 at 17:38 +0100, George Dunlap wrote:
> Credit2 was declared "supported" in 4.8, and as of 4.10 had two other
> critical features implemented (soft affinity / NUMA and caps).
>=20
> [..]
>
> Credit2, like credit, has a number of workloads / setups for which
> performance could be improved.  Personally I think networking and
> partially-loaded systems is going to be more representative of what
> Xen is actually used for; so I think credit2 is on the whole the
> better scheduler to use by default.  And in any case, making those
> improvements on credit2 will be easier than on credit.
>=20
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
>
After all the effort we've spent on this, I'm really, really happy to
see this (trying to) happen. Thanks for sending the patch. :-)

I fully agree with and second George's reasoning, and feel 100% like
providing my:

Acked-by: Dario Faggioli <dfaggioli@suse.com>

Of course, although we thing the scheduler is ready, the more
testing/profiling/benchmarking/... we get, the better.

So, everyone, don't be shy at throwing any kind of things against it,
and report what happens, so we can fix the problem (or revert to
Credit!) for 4.12

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-RgkdKa55KUECZrNu17Wy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlualYgACgkQFkJ4iaW4
c+43ohAAxijiuYecrvQNEd4ZTywvfwDIFI3X4gXy2+sbR3xG9Lcv0f7siNgnqao3
s39bAft4SBBLDLsH4a6Ev7sDvOT60yfqbr85CksRJ5GQ7uUZUOwFpOm6uOSSSfGa
/P93fEVC2t+JPv/9AlElnLg7U2l8897n5Dg025PuediVDm51B7edF3jy4GcA+/m/
ta3PhRcZxqFujjavE0EIDjeOWfwHDs2diXCBLKVEvRN45qhKEJfO2CNKcFvF6KJu
9Xxj29NNsRpyGckisRHuQVuG/W7l8z1GldP6WFGn0ThPA4jBXJ9UtaLmD2l+YkU+
Em6Uo8DcUiODX3A/OI/7FB7lDo0pgkv5zk4TaU3/MHkKv3GJbdy8EbFegh/zp9ri
TLvjFDH9k9+Bhvp1oD+tMqjq3Pgypz4Gel9Bg3qrjtSEMmCgShPi/6mPDVYqOzON
GtrE5W37hVLarxUwDCRzZGPamz0HYyvAa9ZiIUT7UbioX2JmuZkF3xxW1A3Czcty
fMKAVrcysZbwJat+nj4FsEgFruUh9E1GFKAIXEJ78eW7f17VPnCPmMhxU584aABr
mT5nxsT1HpcEGtwq4mIVi9DFl6t7JQwJ/vc8f1eeUl+84GoPRxP/viCDV2o5nD6j
xjCIxinP04ndTi7faKDeiBWTBZYBTveXSpzUQwYJ8vYHLMlx/6o=
=RM6y
-----END PGP SIGNATURE-----

--=-RgkdKa55KUECZrNu17Wy--



--===============6718293843228149948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6718293843228149948==--
