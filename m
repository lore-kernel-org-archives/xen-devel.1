From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC 08/49] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
Date: Mon, 01 Apr 2019 17:15:03 +0200
Message-ID: <811e761e59f10c7545b959a18f09af847c2fde5a.camel@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <20190329150934.17694-9-jgross@suse.com>
 <4570eeac-64a8-f424-28df-883347c69f15@citrix.com>
 <bcbe39bc-fc79-d401-13fc-69bf34ffa17d@suse.com>
 <7c1a66e4-f95e-ba79-e76a-d721cf838a64@suse.com>
 <18bf2961fcb586dc74f1ea972acf62e001ea8c58.camel@suse.com>
 <f6a6f044-8147-0c9d-edf9-d7d3c6044296@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4140002476988959177=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=skML=SD=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hAyeb-0001eb-SH
 for xen-devel@lists.xenproject.org; Mon, 01 Apr 2019 15:15:17 +0000
In-Reply-To: <f6a6f044-8147-0c9d-edf9-d7d3c6044296@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <george.dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>, Robert VanVossen <robert.vanvossen@dornerworks.com>, Julien Grall <julien.grall@arm.com>, Josh Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org


--===============4140002476988959177==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-MvrEtTipCUxmPL44deQG"


--=-MvrEtTipCUxmPL44deQG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-04-01 at 09:19 +0100, Andrew Cooper wrote:
> On 01/04/2019 08:05, Dario Faggioli wrote:
> > On Mon, 2019-04-01 at 08:06 +0200, Juergen Gross wrote:
> > > The
> > > wrappers could then call the related specific scheduler function
> > > based
> > > on the scheduler Id using a chain of if ... else if ...
> > > statements.=20
> > >=20
> > I guess we'd have to see how the final code will look, but I like
> > the
> > idea, and I think it's well worth a try.
>=20
> Normally, the result is put together with PGO rather than manually,
> because the effects are quite subtle.
>=20
> The base case which might be good enough for Xen is:
>=20
> if ( sched =3D=3D default )
>     sched_foo();
> else
>     sched->foo();
>=20
Yep, and this was exactly what I had in mind, before a full 'if..else'
was mentioned here. And if that's as far as it's sane to get, I'm fine
with that.

> which for the common case of the default cpupool only, or multiple
> groups with the same scheduler, will always take the direct path
> rather
> than the indirect path.
>=20
Yeah, and as far as I've been seeing, using default scheduler and
pretty much ignoring cpupool is common enough (and I'm not saying it's
too great a thing! :-/)

> Beyond that, the best length of the if/else chain can only reasonably
> be
> determined with profiling.  It depends on the relative frequencies of
> each call, and blindly doing an if/else chain to the end of the
> scheduler list will probably make worse performance if you're using
> the
> final scheduler than using a retpoline would. =20
>
Yeah, makes sense.

And anyway...

> I think its useful to consider optimisations potential optimisations,
> but I'd advise against trying to merge everything into this series.
>=20
...yes, let's keep this for later.

Regards,
Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-MvrEtTipCUxmPL44deQG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyiKvgACgkQFkJ4iaW4
c+57Aw/+KWhvBfDQI6yks62pqXZUPF/b6HkwUO99dOo3ZjDJAgeLUTilNueBUn2x
mlGbOLlfQpx2ztvpOFCkPcjPjdzq3EHg66BRnqbW4x5aOaKG0N8KRbPq6aP7/n/6
YTvUm6ciEoBSaTZR2e6pgPUZJ6sTQAXtNxmiDaZFNI6X7xoQ13VjqyP4/lwQHDAB
KizrR0SRLbDuwkJpuMhKyxxX/G20ju2LYStB/TLwdH/+mWDSvzvXlT8lkXoGD6qW
fWWA84y8GJ85gGDSBu4N+xNI2EozFK2lE7qEi7uSQAcRk601qHBnlP1U4cLWtUF2
4r8LyQWYaHrIj/TiFdd8hjDt5OU+OcxsLvT7KdreQe+DG9JpGcQJUOt9O2sFBX6m
EebQetf0rRfaanzEapcO4tPBuCWQ/hVNo9Ra1OLshco7w2WIkiYDM1uTmKr92HCf
p63c9OOyMOYrouYiBRAvZM+RPcqYz4y8qLtQD3tNBCuJWmdBSnPfIX6hjTPDJBjX
/t4xdqI5qtvBQWl+mqqyF7u1iHfN2QiNfNl9DO1/tr7l1QpNRbHWfsDPW1VVBRQ9
WMagCEqyDVNGzNhFW6ynwzv22ON+vrfvleydraCZ+fY/TeQaUMCRej4n9H8Y96iE
7deGPgOnxf6AV8i2/sBykMtBANYupn4oKiKGT9J6favTfeal6VQ=
=TkGa
-----END PGP SIGNATURE-----

--=-MvrEtTipCUxmPL44deQG--



--===============4140002476988959177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4140002476988959177==--
