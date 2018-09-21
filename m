From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Fri, 21 Sep 2018 18:20:23 +0200
Message-ID: <b9c1a71c455e8a1682bb13527503c7c0f0135887.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
 <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
 <CADJ6SV2G=51BK2p-bouNGfiS5sP2tiV6ztZZ7PFGjiptRw_P3w@mail.gmail.com>
 <44174941bcd8f250a6ecd42ea10a78bf12453134.camel@suse.com>
 <CADJ6SV2wis2kOz9j4OGTzRLd+2O2f_SuxktFWRq2A_tbng_3Ug@mail.gmail.com>
 <529d38d04b140d90d33e424a064d401cf06f14cf.camel@suse.com>
 <CADJ6SV09MS1x+qGJOu71W8M6cVhRaVuODBYDReHWmOm4c1NEfQ@mail.gmail.com>
 <CADJ6SV0+O5c52_qwOUEakuX82C2+8Z-M4mKj0x+13GXjaiJjvw@mail.gmail.com>
 <a468e3dfc55bb6a421d47b908f89d9112075cc04.camel@suse.com>
 <CADJ6SV0=p3efMNmdx5ud8BAPscOZpSBqBZ2LJieE3M+Rq3phNQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5927686786034817607=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gatc=md=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g3OAx-0000ny-VN
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 16:21:03 +0000
In-Reply-To: <CADJ6SV0=p3efMNmdx5ud8BAPscOZpSBqBZ2LJieE3M+Rq3phNQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, stefano@stabellini.net
List-Id: xen-devel@lists.xenproject.org


--===============5927686786034817607==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-HxAldq1LCiF1nN5cmMuA"


--=-HxAldq1LCiF1nN5cmMuA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding Julien as well.

Julien, this seems related to the RCU issue we fought on ARM when using
Credit2, although this is null, but it's being even more weird...]

On Fri, 2018-09-21 at 16:14 +0200, Milan Boberic wrote:
> Hey,
> yes, I can see prink's outputs on console and in xl dmesg. Also added
> timestamps, here are the results (created and destroyed domU a few
> times, just to get more values), this is from xl dmesg:
>=20
> NULL SCHEDULER - Not stressed PetaLinux host domain.
>=20
> (XEN) t=3D218000327743:End of a domain_destroy function
> (XEN) t=3D218000420874:End of a complete_domain_destroy function
> (XEN) <G><3>memory_map:add: dom2 gfn=3Dff0a0 mfn=3Dff0a0 nr=3D1
> ...
>=20
> Stressed PetaLinux host with command: yes > /dev/null &
>=20
> (XEN) t=3D3247747255872:End of a domain_destroy function
> (XEN) t=3D3247747349863:End of a complete_domain_destroy function
> ...
>
> CREDIT SCHEDULER - not stressed PetaLinux host
>=20
> (XEN) t=3D86245669606:End of a domain_destroy function
> (XEN) t=3D86245761127:End of a complete_domain_destroy function
> ...
>=20
> Stressed PetaLinux host with yes > /dev/null &
>=20
> (XEN) t=3D331229997499:End of a domain_destroy function
> (XEN) t=3D331230091770:End of a complete_domain_destroy function
> ...
>
Which, if I'm doing the math properly, tells us that
complete_domain_destroy() is called within ~90us, for both schedulers,
and in all stress/load conditions. That wouldn't be too bad, I think.

And in fact, if I remember correctly, you're saying that adding the
printk()s fixes the issue in null. I wonder why that is... Can you like
kill the printks, store 5 or so of the timestamps (or just the delta)
in a static array or something, and print it from somewhere else (like
a debug-key handler in the same file)?

What I'm after, is how log, after domain_destroy(),
complete_domain_destroy() is called, and whether/how it relates the the
grace period idle timer we've added in the RCU code.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-HxAldq1LCiF1nN5cmMuA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlulGkwACgkQFkJ4iaW4
c+5gdBAAlldca+BrclweOX18E8cQpsKRb6vv3T1MgXLBrdIgBRLdvnCmA3iRSpfQ
XCmjoTxuvf5onULzxbyYlN3gq299UdxbqmfLxlZ0Oz4GUttVLjIwZxQfbeulb+zb
WIiJW4P7rFBZMQWUtGSAsUkgksbw7FB5d/wO9SVMw0P0Rr01gx3XUalUaJcy/IYB
fLa4iy2Hpn4V5EO8f52eXRHiFhEc71sIRx+nfDFZInDzPYApkj6ql+vuWbJT4SPD
FSLft6GSHiHT6Vt2WUf6x8hPcRt5pYhb34aIgNA+JW0rVQlQ1I5kbtBdZFuR21rq
c50lwinTrUTMM0He1+7fAGNcWLqcrrzrKyxMRyE6e6vMc5VnC4BS9slBYVCIVthn
fDAJ7JY4YVNaChf3OFp02RlDMHftqJ1eWydIiElyN8Tkf52ah5Tvb1GLG3D/V4eu
RES+tqfT67LxyvbXHkJcSonxgRzccEMN+dmkpLuZaIly3sJyAhMh9SG1zD1+ML/k
DwSmGPIqUgRkxoCZBpWLe9XOe3zgn7ajGIo/5ACx+WXqcENa2ObvCoPok4N2hax+
MRTbx2ce33nALAgJooQgLK1/x4cWnu4H70HwYiMU1PuoGoIo2mW1dfV5Bq5amce5
ZL7DWhmiLB2VtweQinHSkhIRRnYAXArRC3ZarjEK8BFSVJ9clww=
=4Mui
-----END PGP SIGNATURE-----

--=-HxAldq1LCiF1nN5cmMuA--



--===============5927686786034817607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5927686786034817607==--
