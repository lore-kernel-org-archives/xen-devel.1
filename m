From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: null scheduler bug
Date: Thu, 13 Sep 2018 09:04:51 +0200
Message-ID: <a938e477609ae123ae61aec515daa34ccaf0b8f3.camel@suse.com>
References: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5817879500308225806=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tvlc=l3=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g0Lgg-0006LE-Bv
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 07:05:14 +0000
In-Reply-To: <alpine.DEB.2.10.1809121559330.4255@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, milanboberic94@gmail.com
List-Id: xen-devel@lists.xenproject.org


--===============5817879500308225806==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-wmr2crqEB+1PXR/kQF69"


--=-wmr2crqEB+1PXR/kQF69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-09-12 at 16:03 -0700, Stefano Stabellini wrote:
> Hi Dario,
>=20
> Milan has just found a bug in the null scheduler: apparently it is
> not
> possible to start a VM again after it has been destroyed.
>=20
> My initial suspicion was that the VM wasn't properly destroyed, but I
> asked Milan to double check with xl list, and the VM doesn't show in
> the
> list anymore.
>=20
Ok. With what version of Xen? Is PCI passthrough/device assignment
involved? I'm asking because this highly reminds me of this:

https://lists.xen.org/archives/html/xen-devel/2017-07/msg00501.html

Which then led to this:

https://www.mail-archive.com/xen-devel@lists.xen.org/msg105388.html

And to the following changes (related to RCU, which is how complete
destruction of a domain occurs):

2b936ea7b "xen: RCU: avoid busy waiting until the end of grace period."
38ad8151f "xen: RCU: don't let a CPU with a callback go idle."
...

Are these commit there?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-wmr2crqEB+1PXR/kQF69
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluaDBMACgkQFkJ4iaW4
c+5mphAA41OYs3Lt2oxYHYxY3JSZf8XBkFVu9RN5IayNQcQCFsnPCzFwEtRvwOwH
0/+ZN2E2QZ5mrVVfW/8e94mqZR1AQsTRgGxklO8o0659hw1NU/i+MGXHMeKoqibI
8j2vo96T3sj5eC0h+92KTZhCw/Soyrn+tiC9NN1oPmYzQ0/gmLZYv2Wvxyr4NUUA
eD/AvRzpK0hHvTQTnnmh4+cKaYYwmau4Q8sjaTiTDG1hcPQ/06VgAApCco5mJuPN
neUh839rA9rysIf7quhGKr9WHBF0XBl/hPavPDoOPnkrR5MU7sph4FnWvwENtbwA
VegdYCUa3gno2yRNLSXCoiqrrdCV0PoSdvVXdZ4yIAFg3eIlUV2zo8m7E8CZwHvp
Xx+QYYkejmxjx72jYC3uEvS5hAPvAGGYcuP2Od0h9+2zvwcEU0JSiFazsj2ls80E
NTf4MYFNRnRwtgKdBUjdqvQOuTonsbKOD7pOQxpLLtJYW+v4ufE9fYABeVM49+Nx
66q6WPchqfDAoG/6VK3+CTqxtTDSnDxEWfnMMO/9GCaebR7nf2J4tZQg5I+vcw6s
aVxBL/7uiROpTpWlmQkFAdLn8eEIbvb/++HBj2a9YB4UqrDDpFwngWRh0gxkoKjz
UZkfxu0a6ZBDy1bk0i49rO01VTu/F5QCvm/mi2WwsgHUgubnSAs=
=aHgB
-----END PGP SIGNATURE-----

--=-wmr2crqEB+1PXR/kQF69--



--===============5817879500308225806==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5817879500308225806==--
