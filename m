From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 2/2] xen: sched: we never get into
 context_switch() with prev==next
Date: Fri, 26 Apr 2019 17:13:50 +0200
Message-ID: <f136a702e983d174613238619acb2f64bf914fdc.camel@suse.com>
References: <155577364571.25746.11988517450711182732.stgit@wayrath>
 <155577388740.25746.3780283868034526234.stgit@wayrath>
 <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7195325543815925688=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9dDU=S4=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hK3G9-0003NL-UR
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 15:59:33 +0000
In-Reply-To: <e877f9f5-ea44-47cd-a974-971768a17735@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7195325543815925688==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Qya4sY0pOsb5RKC9AF51"


--=-Qya4sY0pOsb5RKC9AF51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-04-23 at 12:13 +0300, Andrii Anisov wrote:
> Hello Dario,
>=20
> On 20.04.19 18:24, Dario Faggioli wrote:
> > In schedule(), if we pick, as the next vcpu to run (next) the same
> > one
> > that is running already (prev), we never get to call
> > context_switch().
>=20
> And what about `if ( prev !=3D current )` in
> arm/domain.c:schedule_tail() ?
>=20
You're suggesting that's redundant too, aren't you?

=46rom a quick look, it seems to me as well that it would be. I'm ok
taking care of it, not sure if in this patch, or in another one.

I'm open to suggestions from ARM maintainers...

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-Qya4sY0pOsb5RKC9AF51
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzDIBEACgkQFkJ4iaW4
c+62sw/9EGBfsTcE7wmc64VwHDbpoYxfFhkL0YMuZB3yeZefV0EWIY4Ok3kzVOYu
hBMSlJW9LsllUBzAxTRWVPFsFWqo7/HjoJ1PkpBJSzwElIq/VEvH3//MzLwdD35v
7fND8ytY4NA+N55SAPsX0sQqA21/C2LfqlbguWu4+tL32mzkDyYtLlE+5+wAAiNB
ZnapmikiIn7LFfdYQ9kxseyioZWeF35msEKVeq/sIw6tQgxkK1j+00sSQxpqBGW2
jAAOwoTt4ybTnKhGCBLiCwYjZ45fQh+ZO4wGTIJku4Rkq8u2uLZIxh3tRWjmmC0s
G1UAXH/yiRGK3ipYK6YmBGvCNyntTDsDyNRNKSp6wqG65muXuoCB9ZqHmjQ+XnpL
ZA4a1fD2Vf2RR601hNXBqmhTGIuiMpq2fVIDMCYzCObra7kK3BkAtbmUC7e7eohG
mkqOOGUsRXo0iwzLpaklFSKJ44yj/3yFefzU6LEeBRLVY2yK60gMN1a0qg07Z05Q
fTgVtvaG9UcBYx95p6aldimGlGBj9h4liB/IHefIYjCx5lAdgoLA7rHTOBpYjLhF
JMB4BYmIqDCmLLE+ircGZf/tWmfw7YP9ZZarg47UPBUzeNR4bp8/hFBD1a8PuSEy
fOmsIykoOizycBb5yCD+fmvev//4mz636CNgLwMQEc6XRW/KifQ=
=HVcJ
-----END PGP SIGNATURE-----

--=-Qya4sY0pOsb5RKC9AF51--



--===============7195325543815925688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7195325543815925688==--
