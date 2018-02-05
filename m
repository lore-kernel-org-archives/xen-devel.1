From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/3] Make credit2 the default scheduler
Date: Mon, 05 Feb 2018 17:53:21 +0100
Message-ID: <1517849601.8082.10.camel@suse.com>
References: <20180205113642.3174-1-george.dunlap@citrix.com>
 <edf342de-0dee-69c0-d239-75f928960bd4@citrix.com>
 <d9a9e4c9-1a78-ac26-0bda-cea8e842e05d@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8995976920671066494=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=jhda=e7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eik1r-0003iL-55
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2018 16:54:03 +0000
In-Reply-To: <d9a9e4c9-1a78-ac26-0bda-cea8e842e05d@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============8995976920671066494==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YVsgBTyAE9yuFZqCXasF"


--=-YVsgBTyAE9yuFZqCXasF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-02-05 at 13:01 +0000, George Dunlap wrote:
> On 02/05/2018 11:45 AM, Andrew Cooper wrote:
> >=20
> Here is a summary of data from an intern e-mail Dario sent about 6
> months ago:
>=20
> * DVDbench: On underloaded systems, credit2 outperformed credit1 by
> about 4%.  On overloaded systems, credit2 underperformed by about 3%.
>=20
> * On a range of tests (unixbench, lmbench, &c), credit and credit2
> perform within 5% of each other (up and down).
>=20
> * Credit2 fairly consistently beats credit for TCP-style workloads.
>=20
> * Credit2 is sometimes equal to, sometimes 5-15% worse than, credit
> for
> synthetic CPU workloads (e.g., Dhrystone).
>=20
> * On LoginVSI, credit2 fairly consistently outperforms credit by
> about 10%.
>=20
Thanks George for summing this up!

> Credit2, like credit, has a number of workloads / setups for which
> performance could be improved.  Personally I think networking and
> partially-loaded systems is going to be more representative of what
> Xen
> is actually used for; so I think credit2 is on the whole the better
> scheduler to use by default. =20
>
I'm sure this will sound no surprise for anyone, but allow me to say it
anyway: I agree with George. :-D

> And in any case, making those improvements
> on credit2 will be easier than on credit.
>=20
And, if possible, I agree with George on this even more!

One thing I think we should consider, though, is that we've often said
we would switch at the very beginning of a dev cycle, to get as much as
osstest and day-by-day testing from developer as possible.

Considering we're releasing in June, but freezing in March, do we think
 it is still early enough?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-YVsgBTyAE9yuFZqCXasF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlp4jAEACgkQFkJ4iaW4
c+520xAAjaozxFOmQ0C15NedZ7ERAZeXJ3SiCmhxh5qb8ptqR6n4URD+aqpXbWu1
yLKjAT8NaooLDateRMHjBsnKUBtI0N+yews9STQCWXu61cnllTZNN2X50zeX8WL4
abRUh1Lj9Ns/z157r1LSpz3EF0cabPWSO+CBTDVC2DcfpNWM5IhWcR2RlKdiHIfp
V0hjrXqhrbBGUYdLTgxL//GO89hUgSAKIuQv9uxCqJsLZNqnSY5gQx7/9lJPD8up
NpZCHXID3XBZQvYcB2eeeup32rB59EKRCKkRltbf6PTg69DKL1rYiq6VgX/0yOQg
pvdapk/JhfLeqS9/E0huwxLlx9xmYkhOWrz7+hq/Oq5VDT24FwLxZezkxxzPg5kf
5KhgmA3lmOLTtA8EmxsMuS4vymyxRuBJNf+m+EvWo0tx/8yYAB7Q705mPhd8CLoy
/HRCKi2fbP4+clxHSwqj8NOPaGRloRsG8sgW6rbokXGHu77JzVoQNX+c2EUoC5MN
a+U5v3vHCgZlyiFm2xL/eiSili0kHwSSzO6Q4USBQfEo7VGGyzgPZTXQ47U6HEyb
IJFHsDvS02qjORgXTs5WBkBNKTu8/1WHyMbncvAVNqqhoiexnjQhQt9N+xyHa9U0
PNemnxEeuEdHldAHygp553WVII5UWiyC30IvFgVDglyFyqVBXrs=
=MLEf
-----END PGP SIGNATURE-----

--=-YVsgBTyAE9yuFZqCXasF--



--===============8995976920671066494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8995976920671066494==--
