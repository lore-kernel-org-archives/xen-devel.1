From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH v2 0/2] xen: credit2: rb-tree for
 runqueues
Date: Fri, 18 Jan 2019 08:00:50 +0100
Message-ID: <dc59c26edbc30533fb298ebf4d7111ede017ae2a.camel@suse.com>
References: <20181223142134.7857-1-kpraveen.lkml@gmail.com>
 <CABcWhv4njWab=ikYOM0fSWV6PJug4tfttwQVquCJKdSNqB7qJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0204591175818072209=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=c7wu=P2=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1gkOB9-0005FL-FG
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 07:02:59 +0000
In-Reply-To: <CABcWhv4njWab=ikYOM0fSWV6PJug4tfttwQVquCJKdSNqB7qJA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Praveen Kumar <kpraveen.lkml@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============0204591175818072209==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-WisqG4TYFz7wryZ2WKbD"


--=-WisqG4TYFz7wryZ2WKbD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-01-18 at 11:14 +0530, Praveen Kumar wrote:
> Hi All,
>=20
Hi Praveen,

> On Fri, Jan 4, 2019 at 3:21 PM Praveen Kumar <kpraveen.lkml@gmail.com
> > wrote:
> > Hi All,
> >=20
> > This is the continued work with respect to rb-tree usage in
> > Credit2, as
> > mentioned in previous conversations
> >=20
> > https://lists.xen.org/archives/html/xen-devel/2017-06/msg01968.html
> > https://lists.xen.org/archives/html/xen-devel/2018-04/msg00119.html
> >=20
> > The patch optimized the Credit2 runqueue from sorted queue to rb-
> > tree.
> > This will help in performance and scalability, when we have huge
> > number of
> > vCPUs.
> >=20
> > Please provide your comments over the changes done.
> >=20
>=20
> Please provide your comments on the changes.
> Thanks in advance.
>=20
Yes, I am actually looking at this series right now.

Sorry it's taking a bit, but you hit the combination of Winter vacation
and freeze for the next Xen release. :-P

I'll let you have my comments latter today.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-WisqG4TYFz7wryZ2WKbD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlxBeaIACgkQFkJ4iaW4
c+4PLQ//SByTaMn3KiPHJgBRJKqcNLn6TiiOi3ckkXXl/dOzmREiVGAsBqorbfSG
8mpUV7JAAJEsG+thUlEEA/10OzO7r6J6lg3TQPApvWL9R4ofLpjorrlBExV1ynxt
q4Nq1FCNm7nP7V0sL+VChKfMjPPmvRTy4E1a8l80ZyJV9qjVYgMRvnqJGrkzktrY
a241DEjTxUSfcEt+bdz8vgls2VkL7eMda12IL6OTkGssiwLlpoPJmhwHwtinFOYF
IrNS4lwuN7utMDCzs5by/aVVZk5wovw6H/Oa0IC/CIc+PUvBVdVDeEhMsyMj5LMf
iXJ9IWCoHVPXFypmH3zOADwIWBZlPEAmpebp9NuKZI0M1NSY/fQXhj+Xr+JN5hm8
Drh7YFSweY500PDYM+a9L8mOnXymlCGYUHbe59+a5pYH9g3pQnB26p4AFhM2U6/0
G8sKQsLnv/eglD4E2BKXhHGQrwL4PsxHIjGlJ8OeHwCxefN1JsC20kejKeQNWo2U
ianvVzdmbX27TjJVzb+LD1x0NNHdMIuzSZsO1Hme9kFHrcdhM0VJyAdLLEQOSEYN
ggbPOCHi1Qu2v7aKl1Za6xLoPoHiT0rOQedPPDHgneOjiU0EEXGosFhjvZrhDhT0
I2jiXaSFXqjDp+GVVdU7mPrpqPAoDpTUcge0LSztvv6Szm6ifnE=
=mh9/
-----END PGP SIGNATURE-----

--=-WisqG4TYFz7wryZ2WKbD--



--===============0204591175818072209==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0204591175818072209==--
