From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] Make credit2 the default scheduler
Date: Wed, 19 Sep 2018 11:38:05 +0200
Message-ID: <73c44e93d76cf400bed6f03b4f1623448276ecf1.camel@suse.com>
References: <20180913163848.32216-1-george.dunlap@citrix.com>
 <cc2e661cc8543353929aebf1f190abd109ff2b82.camel@suse.com>
 <5B9B752F02000078001E88AD@prv1-mh.provo.novell.com>
 <4148872.qM0LCJrPQa@wopr.lan.crc.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4734905073193498449=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8f+w=mb=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g2YwP-00056X-Bb
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 09:38:37 +0000
In-Reply-To: <4148872.qM0LCJrPQa@wopr.lan.crc.id.au>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Steven Haigh <netwiz@crc.id.au>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Jan Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============4734905073193498449==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-UOUJG8RfQWlgHLWgYrqa"


--=-UOUJG8RfQWlgHLWgYrqa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2018-09-15 at 00:21 +1000, Steven Haigh wrote:
> On Friday, 14 September 2018 6:45:35 PM AEST Jan Beulich wrote:
> > > > >=20
> > And that's despite "sched=3Dcredit2 crashes system when using
> > cpupools"? While I agree that we shouldn't delay the switch for
> > much longer, in particular with there already being a fix available
> > from you I think that one should go in before the one here.
>=20
> Even though my opinion probably isn't very heavy on this matter, I've
> used=20
> credit2 exclusively for a considerable time.=20
>
Well, this is really interesting and useful to know. Can I ask what
your typical workload is (if any), and how are things going?

> If you're talking the issue I=20
> think you're talking about, then I discovered it when doing stuff
> that most=20
> people probably wouldn't bother with - evidenced that I hadn't done
> it before=20
> either.
>=20
Actually, we do expect the default scheduler not to crash if one
creates a cpupool.

Not that there hasn't been similar bug in Credit1, while it was the
default (check `git log' :-/). But what this all means is that we need
to do better at testing these things, e.g., finally adding cpupool and
CPU online/offline testing to OSSTest.

Anyway, the bugfix is in now. :-)

> I take peoples word on the performance +/- of a few percent here and
> there -=20
> so if its easier to maintain and better code, then yeah - it makes
> sense to=20
> move on with it. I certainly haven't found any normal use cases that
> would=20
> lead me to object to this.
>=20
Great, and thanks again for the feedback!

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-UOUJG8RfQWlgHLWgYrqa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluiGQEACgkQFkJ4iaW4
c+5QHA//SsrDcb4sGWVYXSTCR1V0ge1YUISocfDWq8LIFUjn756x2tfrdcHkCKN7
Ho+la96XPrn4/JNiREhj6XpUZBQIFw11lNuMe/yKQQDCpcpHoejwh7xIJ3CPtiWA
ilBFqqSPcVDW0sJW76fMu/F08qm2OqWH+jfmKQdQmnguhtE2zv2myFOOgKfjQE8G
z8yi/AC5qIA6oC7JSeh2IfsCykaFhVAAIkDXnLQVVe+ClTl8WPcNkrApzXyI/vNO
b4VQ2zj3GHjVUXXRR5krSeRZuTAoRGtt4rJ5pohlkBKMwAoKzur12xy8Wle1oXeI
hxz4WPT+kpI+6CpRfKKe2O5Tre4dsSqYQ6rixUrWNa9IcgYRQcR7/sgu4fneWkxW
7v7EY2dEl53cigHpSOk5SSFL9UElAg61dlPUErO3SoZ2sxNWsqhFtLaOFrml8CAb
4D5uUii7Hs4mGS4jSNbHmXpvaqxUApOn5cYE8m4YTv/eWzmEvDUIfAfIx/GcUfCc
naCCvyRCtsxbNln3ZizY2dF/ZH/klZapdMBOExuuRpxcUbjiBfncylhEiwNXBixt
2+KqG9QPefIrQ/greS1o67/yarVoeRvvSJYeNd128JEn6HT3yj7HuaLxh3tn+u0k
tXUVMJR72gCRG5MqydWpT+4i0LdaAob4be723cY8aiX5jTepCtw=
=KYZW
-----END PGP SIGNATURE-----

--=-UOUJG8RfQWlgHLWgYrqa--



--===============4734905073193498449==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4734905073193498449==--
