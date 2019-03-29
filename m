From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH RFC 00/49] xen: add core scheduling support
Date: Fri, 29 Mar 2019 18:29:40 +0100
Message-ID: <e01428f68ac70badd6396c5c295e632efcbbf572.camel@suse.com>
References: <20190329150934.17694-1-jgross@suse.com>
 <5C9E3C3D0200007800222FB0@suse.com>
 <19e960b1-bcfd-45cb-7993-6af5bd407266@suse.com>
 <2d8735fa29e3c7add47b8e4c467760bfffc90b09.camel@suse.com>
 <63d8e13a-2dee-916a-61d4-7d69c7bb0a4d@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3239725379724721294=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V2gX=SA=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9vKD-0000GJ-1f
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 17:29:53 +0000
In-Reply-To: <63d8e13a-2dee-916a-61d4-7d69c7bb0a4d@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Robert VanVossen <Robert.VanVossen@dornerworks.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Joshua Whitehead <josh.whitehead@dornerworks.com>, Meng Xu <mengxu@cis.upenn.edu>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3239725379724721294==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-EQtd0msoaoGtHvDiPAaz"


--=-EQtd0msoaoGtHvDiPAaz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-03-29 at 18:00 +0100, Juergen Gross wrote:
> On 29/03/2019 17:56, Dario Faggioli wrote:
> > As said by Juergen, the two approaches (and hence the structure of
> > the
> > series) are quite different. This series is more generic, acts on
> > the
> > common scheduler code and logic. It's quite intrusive, as we can
> > see
> > :-D, but enables the feature for all the schedulers all at once
> > (well,
> > they all need changes, but mostly mechanical).
> >=20
> > My series, OTOH, act on each scheduler specifically (and in fact
> > there
> > is one for Credit and one for Credit2, and there would need to be
> > one
> > for RTDS, if wanted, etc). They're much more self contained, but
> > less
> > generic; and the changes necessary within each scheduler are
> > specific
> > to the scheduler itself, and non-mechanical.
>=20
> Another line of thought: in case we want core scheduling for security
> reasons (to ensure always vcpus of the same guest are sharing a core)
> the same might apply to the guest itself: it might want to ensure
> only threads of the same process are sharing a core.
>
Sure, as soon as we'll manage to "passthrough" to it the necessary
topology information.

> This would be
> quite easy with my series, but impossible for Dario's solution
> without
> the fixed relationship between guest siblings.
>
Well, not "impossible". :-)

As said above, that's not there, but it can be added/implemented.

Anyway... Lemme go back looking at the patches, and preparing for
running benchmarks. :-D :-D

Dario
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-EQtd0msoaoGtHvDiPAaz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlyeVgQACgkQFkJ4iaW4
c+7pwRAA66injdnBo+qIBZSFUSFbcdYzCOWrynuEU1m8gGRPoHVaERSLIfnW3csz
3u1+328mWii/jv/LKw0Dqik3s3ClnGPJO2WwWeGu5toII7NYHVl0IvSVPqIThwHM
fVU3brwvah+vI4mdEQPbfbeT3TJTV4SuxaNvuiYAxWde4VTo9wVWz/3MWp3BCDpe
sPdvhKTWjzTccsuFEz3ANrlF3PAajuzf4kdC5WmxTpbeuUxv24GBUBQKUW7JXgSu
2pM3lxyuPWm1vLDWXvmb0BxIo0MogGjY/Q3zcXC8abZq2a2Gm7Id4t8pbylBGrDW
8nHFmG2qZiFTeSComPNFfpll6vz3U0A5CdqqbN7Z23qZ4ZUBCP1Cyc565/WGEJ6I
EmFbDKMaT8o+21nyQKkzZVXjIHPDRcXAEeix8MD5miYbOqSHrO5LHfvuhbIwLYGy
LjXobnRbpRx8o1u0lQWrohlIS/1f3zQWC8JeEEJxnj+6+uF2nILdFkoYVEJpy0II
B96LhfKka9p/K5YifKaLCHOIDrUmrGps117R4LiSzGoXMsJ3qTYGyfsK3BMszWA9
hZRW5g3aBWiy1gNMPqOqlCXSw4//as1IXAFdKOL0Clw1bR2m+TpDmITW9qzYeYZx
A9UOhA1wW4JZG3TTBZhMEA4wIQtR6ZvWUddf99uZQgaKXKEu3Xw=
=OUDK
-----END PGP SIGNATURE-----

--=-EQtd0msoaoGtHvDiPAaz--



--===============3239725379724721294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3239725379724721294==--
