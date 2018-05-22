From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] xen: Add fake_s3 command-line option for
 testing
Date: Tue, 22 May 2018 09:47:25 +0200
Message-ID: <ac2347d4bccbe26e47fc5cce233fa288364bbde3.camel@suse.com>
References: <20180521141600.5516-1-george.dunlap@citrix.com>
 <72b85eed-79e8-25da-0558-c431e71761b9@citrix.com>
 <7328297b-69c8-3a86-633f-27a29b1f1bc1@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3685679227870698973=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gir7=ij=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1fL21Q-0005jn-PP
 for xen-devel@lists.xenproject.org; Tue, 22 May 2018 07:47:52 +0000
In-Reply-To: <7328297b-69c8-3a86-633f-27a29b1f1bc1@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@citrix.com>, Ben Guthro <benjamin.guthro@citrix.com>, Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============3685679227870698973==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-F8PbePl0x0gFRk+6z7ZH"


--=-F8PbePl0x0gFRk+6z7ZH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-05-21 at 16:33 +0100, George Dunlap wrote:
> On 05/21/2018 03:28 PM, Andrew Cooper wrote:
> > On 21/05/18 15:16, George Dunlap wrote:
> > > Most server-class hardware doesn't support ACPI S3 suspend; but
> > > most
> > > bugs we'll run across won't need actual S3 to trigger.  Add a
> > > command-line parameter for a "fake" S3, which will do everything
> > > during suspend/restore except actually calling into the ACPI S3
> > > handler.
> > >=20
> > bool_t =3D> bool, drop the redundant initialiser, and you need to
> > patch
> > xen-command-line.markdown.
>=20
> Hmm, actually -- would it make more sense to add this as an option to
> acpi_sleep?  e.g., "acpi_sleep=3Ds3_fake"?  (Along with s3_bios and
> s3_mode?)
>=20
This actually seems a good idea to me.

Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-F8PbePl0x0gFRk+6z7ZH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlsDyw0ACgkQFkJ4iaW4
c+4NQA//Y+m+Y3DAyjpI14PDTs5AsKmbH0jj3TKPUujLzxATyxdTu/AiCe2Bm3Bb
I7MdQV/c3G7/1iTQj0CqbIM6/+iZ5VpjBiumltepjpkDeUXvCh4FBcmSZub6J/vj
nGc/687llib8BSTvvHJqaHJRKuLn6yEUTn9TYfnp+QK7fU2rdsTs9R4hktIkFS5G
ARoKARwr+wBkPK2YnXagU0fAffEtPMOejaPBMjUMUqkDvEaMlyHoagkdN6K4/Hfd
V/6em7l3sioTOUwIOQ9RLpnfTEq2AwuFr3u4QTfP1f/CyiFJE8Kc7nX/0W6cbDyq
ZtL8yLm4Yoc+cvECLkOuGNkqg+oSo2Wukc5EYDObiBYiRruBruE8NEbsm5aMqKfB
ZViQdXOrVmtRWY2NTwXjaacZUvARfHYDR9L2/P/0sh2kwH1aQbMOQ8mLpn0EslkX
opGJo9rfSxGA3iMG3vT/N1SeYUFta+ZVBqLn1pfe2FlRadE7nIN0yP6UJ4WOo7jl
xH3pxyKJVAnRJi23Pu/A2A+1BXQBQIotrtlJeaZglEE8fybBBXw4n7d++9gWe374
fxzlc/mufOLbqylrTDq/nw6BcTlGDmCwZZ3yXPpYjMHcxfoxnJ2dKzBJMJIghG1+
3Ju0UOT/gqeVyT+6fq+kGfQ3dRRR0G8jNQX/OIDAMoal0L8xrbE=
=+OZ8
-----END PGP SIGNATURE-----

--=-F8PbePl0x0gFRk+6z7ZH--



--===============3685679227870698973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3685679227870698973==--
