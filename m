From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] tools: libxenstat: fix format string
	overflow
Date: Fri, 16 Feb 2018 18:55:08 +0100
Message-ID: <1518803708.3813.18.camel@suse.com>
References: <151880261167.5804.2843218804728106933.stgit@Solace.fritz.box>
 <20180216174405.z2dut66rkh3x5pnw@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7648562483950072278=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7zwx=fk=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1emkEF-0007rZ-7z
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 17:55:23 +0000
In-Reply-To: <20180216174405.z2dut66rkh3x5pnw@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7648562483950072278==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-VOVxPSyaQSAU6knI7dur"


--=-VOVxPSyaQSAU6knI7dur
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-02-16 at 17:44 +0000, Wei Liu wrote:
> On Fri, Feb 16, 2018 at 06:36:51PM +0100, Dario Faggioli wrote:
> >=20
> > --- a/tools/xenstat/libxenstat/src/xenstat_linux.c
> > +++ b/tools/xenstat/libxenstat/src/xenstat_linux.c
> > @@ -69,18 +69,20 @@ void getBridge(char *excludeName, char *result,
> > size_t resultLen)
> >  	struct dirent *de;
> >  	DIR *d;
> > =20
> > -	char tmp[256] =3D { 0 };
> > -
> >  	d =3D opendir("/sys/class/net");
> >  	while ((de =3D readdir(d)) !=3D NULL) {
> >  		if ((strlen(de->d_name) > 0) && (de->d_name[0] !=3D
> > '.')
> >  			&& (strstr(de->d_name, excludeName) =3D=3D
> > NULL)) {
> > -				sprintf(tmp,
> > "/sys/class/net/%s/bridge", de->d_name);
> > +				char *tmp;
> > +
> > +				asprintf(&tmp,
> > "/sys/class/net/%s/bridge", de->d_name);
>=20
> Need to check the return value of asprintf.
>=20
Right! And what do I do if it fails, 'continue' the while(), I guess?

Thanks and Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-VOVxPSyaQSAU6knI7dur
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqHGv0ACgkQFkJ4iaW4
c+5gqhAAsM4yljN9GP4QMnzBAu0C+RK7FGJOVSLxCRkqbLzSRCz6XPBjogoxvkde
IGn/wsQf7XI0jm1CCzsy48jB4WyfznLwvV6OgY26jHGcuE0g+kwTV9dzy8+7sn6j
CV+nOP9iYK9c0ErYN8QbJVbz9OSXAWWWULp8HYh0ArRtPvBencxTZiWeIj+1j9o7
9RKNb+Z6iDYAfocrNgs1dvrmc+ze2udLxATYrQyJb4ELPpLKyCv68XfrVQ+ifm8P
0iNJmN0iznztABh/Oy45U6zEYcivbUmpiZ5DWpvgoN4i2qvr2mBgvMZMX7KKcwGz
mZEAkJpMKuDquDm/Z/HnPOuQ/PPXn7bJuHc9VKJ78dhcj5UrDN883/EeZ5RVhzVa
oLiT5vNY0p4PnddvWPOcKBLK+DWPny9UM5Y+JB6BXCIlPo2CIKRWQH8nsEcJZxO7
0AFl3jVgKfqJQIOt7bSNkg78UBe2BWFJX92cW1BtIuWOKLEMvi+pNhHtw2ZKnqhM
lFasvcBIKOuS5Yc/pd3BMaPifIMLoa4vSv0GevHNh0Jmb2WhBMknqPdCGbx3Nh5s
6xarK1rYxUi5EuO1U8chkLnbXgmS+aYjThHmICaqjCwAqDelLTWUIjPIlPcr7Nfb
Nmpg5BRY6Y09B0FOA/mfC8+vuroRrIn68GiK6LyQMPm+GcoMPbQ=
=voU3
-----END PGP SIGNATURE-----

--=-VOVxPSyaQSAU6knI7dur--



--===============7648562483950072278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7648562483950072278==--
