From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 5/5] formats: print time values as decimals
Date: Wed, 12 Sep 2018 09:54:53 +0200
Message-ID: <6d9633125b46460c8200c848c81212cba34b9a04.camel@suse.com>
References: <1536597679-8303-1-git-send-email-andrii.anisov@gmail.com>
 <1536597679-8303-6-git-send-email-andrii.anisov@gmail.com>
 <34420b79-4e2a-6ae4-7838-039e6dd7ee94@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3579765923754361739=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kpmf=l2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g00L7-0001ta-1N
 for xen-devel@lists.xenproject.org; Wed, 12 Sep 2018 08:17:33 +0000
In-Reply-To: <34420b79-4e2a-6ae4-7838-039e6dd7ee94@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============3579765923754361739==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-qN9oZH5F+9G6vgjrJ1GX"


--=-qN9oZH5F+9G6vgjrJ1GX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-09-11 at 11:33 +0100, George Dunlap wrote:
> On 09/10/2018 05:41 PM, Andrii Anisov wrote:
> > From: Andrii Anisov <andrii_anisov@epam.com>
> >=20
> > For convinience, print RTDS budget and deadline values as decimals.
> >=20
I agree, this is a lot better.

> > Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
>=20
> Acked-by: George Dunlap <george.dunlap@citrix.com>
>=20
Not strictly necessary, I now. Still:

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Andrii, if you decide to make the patch that turns timestamps into
secs.nsecs, can we also convert these to such format (again, in case we
have MHz)?

Or, in general, what I think would be useful, is to have the timestamps
and the scheduling parameters in the same domain (when possible).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-qN9oZH5F+9G6vgjrJ1GX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluYxk0ACgkQFkJ4iaW4
c+7CeBAAwl0gFtMlbvktO2BaAHOoErrCGh3FW89ijAamvd0eH3EKrLMkX4BxSxZa
G3TtZrwLbq57l/dEQFzJIUbWFL5/PtXC2OPSOsMIM/Plooyg4iKSwvAYcfDZL8pD
Wyej3mCU4cGIRteePWh1A5skAS8ddXaSp5VsGVBvuJY96hfLVnh4RxtYOj0LZUjW
hUJ7c7+RGBorClg6ZCLdDjGt6dGpexsP1IfxpI1PM8BKNkcqnUDvOhZ03AoxGzU/
Yg/PCR6yw9j0gixFrOslmldmNew8dd/wCm7G/DKoUUDjSzzcj5mKj/1U1lmbNOCq
eASRzOn3E79EKwyuEPPl30zWofSXQ8DGTIPPVKUxHFnDtsBmM2yANftNycL4nP3S
NJIMFllcZV1GtM762uJe6iVimCZOrI0xvymUWGz3vvGPj097gUa7kdpKWalxGUst
CvTUg484dCz/uM9lKx/ggPjBkCFswx1au2ZtbbcY0chAQq68JsT+U/PotD5cKWHl
Z7Fay/+m9zugHCzF2VRezpxfosYPNuqXhwGqGgFtU1ZSBASbglL6Jxwwh9o5s2d1
eytPilkeRfZPnNx2IGd0ihwOlnHLfVIUwJBFKv611WGYDc7BPcc1+hCKj3bP56u0
6BZV8Xp/zMMARFkNSk5yqW5prTmh3vzWtIiRrcJatCIhgXpJqwk=
=Mh4J
-----END PGP SIGNATURE-----

--=-qN9oZH5F+9G6vgjrJ1GX--



--===============3579765923754361739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3579765923754361739==--
