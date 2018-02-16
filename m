From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] tools: libxenstat: fix format string
	overflow
Date: Fri, 16 Feb 2018 18:55:08 +0100
Message-ID: <1518803708.3813.17.camel@suse.com>
References: <151880261167.5804.2843218804728106933.stgit@Solace.fritz.box>
 <20180216174405.z2dut66rkh3x5pnw@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3157453676228396832=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7zwx=fk=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1emkEJ-0007rY-Gl
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 17:55:27 +0000
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


--===============3157453676228396832==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-oQmgUKHe+tkKXlQkMtWr"


--=-oQmgUKHe+tkKXlQkMtWr
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
--=-oQmgUKHe+tkKXlQkMtWr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqHGvwACgkQFkJ4iaW4
c+6kZg//dbX2tb7x3LnahdGLq52/oy9hLP60+mzaWwP8i7b1LQNEbYp0NRMxbUW7
idvRHU/lNGOse4+3WuXVRsMqpD/BVU/xgsoa+0cEyZEogdzZ/t4/sA2B0kxtiF1e
Sq6Eq8F8p/pGKuSzuQ/T1AvYWEbdKyB+pjnrEyTdEZswUdBJnUVxo+hOxbPyqt3+
nHka77U0pFmsm03p041nLQRvnKk0U6F6nZEd98aZ9mG4Wm9AputpOHFAkJajP8tb
v4CLFvg45fq3EBDOGZ4F//MyFFTh7nGWsOb64aSWRPtxAyvNU2u+rbnvJNNs0/5d
4AbnUrrUcCDI4YwzBP12zrZqHUnd1IW40vQrf6UHsSEPQMXgRY20MjWVMNe07VUL
a6InxOCy9zwMIIPcC+bu1EpsYtrbiEVU/sShQmKWCVTLm3VafcxSBhrzGU4TS3Mn
xJ9BsWbUZcoNlobKq72tQJbkPzc95zj2sxRRQe6pkEcfXDbMPbTxOaG4sOCYsiqN
rV4B/GX6lwGlOiJSNn0h7BKZxK992mcFR1/1wZaMjVp2PNfvNK9LY67RJnqhYLnp
TYfpX9Ej08IUKsfV6eFGaikZCLed7aoT7r2u2F8071OA2At/iTWAOM4g1vtCNEYw
78cimm2CeRqqzEirHV8T0a5n1SBo+9LKpmAulW4aE+ya5JJbVvw=
=JY6W
-----END PGP SIGNATURE-----

--=-oQmgUKHe+tkKXlQkMtWr--



--===============3157453676228396832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3157453676228396832==--
