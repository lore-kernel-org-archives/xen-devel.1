From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 1/3] Make credit2 the default scheduler
Date: Tue, 06 Feb 2018 23:39:54 +0100
Message-ID: <1517956794.4823.27.camel@suse.com>
References: <20180205113642.3174-1-george.dunlap@citrix.com>
 <edf342de-0dee-69c0-d239-75f928960bd4@citrix.com>
 <d9a9e4c9-1a78-ac26-0bda-cea8e842e05d@citrix.com>
 <1517849601.8082.10.camel@suse.com>
 <08e59400-8187-2c06-4145-3d7f3fd2bc65@suse.com>
 <64cddb91-57ca-45ae-2308-f4f844248d5e@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6257550677920718948=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=del0=fa=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ejBuP-0004sD-R2
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 22:40:13 +0000
In-Reply-To: <64cddb91-57ca-45ae-2308-f4f844248d5e@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6257550677920718948==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-YdD21T3WN5zo627Xfe9c"


--=-YdD21T3WN5zo627Xfe9c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-02-06 at 17:02 +0000, George Dunlap wrote:
> On 02/06/2018 06:18 AM, Juergen Gross wrote:
> > On 05/02/18 17:53, Dario Faggioli wrote:
> > >=20
> > > Considering we're releasing in June, but freezing in March, do we
> > > think
> > >  it is still early enough?
>=20
> > The 4.11 release is completely dominated by Meltdown/Spectre
> > mitigation
> > work. So either 4.11 will be a security focused version or we need
> > to
> > extend the development phase.
>=20
> Personally I could go either way on this.  So unless someone wants to
> argue for switching now (or we significantly extend the development
> window), let's plan on leaving this for post-4.11.
>=20
Yes, I agree.

And if we don't switch now, I think we should say that, unless someone
argues against your reasoning in your other email, and convince us,
we'll switch as soon as 4.12 is branched (or perhaps as soon as 4.11 is
released?).

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-YdD21T3WN5zo627Xfe9c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlp6LroACgkQFkJ4iaW4
c+5v9hAA1fyAOoTTk53Fadkt8lHglpt/MEhMhp8yUOM36+AX4mq4WBRD73JbDDhw
N77Z6Ifq/IuiTKrV3uKuor3voY41+3FGj2ZgLlfyqJ+gFbm6vLW7/OKLnjtGVo0Z
n8FmGNf+NI9CMqd6KfW1xzWDro6Dj46vpHKvrBGiq84XN7vODhpcg8+iDSSr/zpS
gzNDK2kYxt//Jcn3FXFwyZEYTSe1E3FF9ZD3+1KNiJlkaZNBgQcyAoXusSL+CHlF
Xtps4jtuk3hKidKwti/GQX7RZXiHT4f64VOb+flC3Z/ZBPQVnUdGq4PVkeD1j5TG
0JjJLjPXA5ieWF4xiNzOUWiABFuaS84fL8xAMRDhY3b2iSuQD/klgd7FdAP8gVmM
ztPWUVMzG8cBgzpv7y68Z07yTyuW6ifjLEEiCPA0lKqLrL5Ifv+7xuMdtNm3Mwy8
IMqVtV4+lRkU/w7DgS4YGsVQ6CwioBjHHHyAhuqDIn1Ekg/TT4PQQIz8/8A5Av/w
tu/dAvMvu+9bxo8nK+4JsMXJRMfxlZGTvuzNAUQgJPtRCPiJLgQmzknKhZkMq1sM
oXL0+IvbCQzgJlXYMebmwnceEl2FadNAK5E78HmKMmGLFT084YvvkvfyDbtYyy8r
yTLNdGi+d+Q+8nO5D9J0dIq+5aeCufGL6GmzfThNMYSR9GX86YI=
=BtZp
-----END PGP SIGNATURE-----

--=-YdD21T3WN5zo627Xfe9c--



--===============6257550677920718948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6257550677920718948==--
