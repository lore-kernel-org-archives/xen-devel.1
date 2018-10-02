From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [xen-unstable test] 128240: regressions - FAIL
Date: Tue, 02 Oct 2018 11:58:28 +0200
Message-ID: <5f8fec40caa6c8dbd194b96938f60fdf9fd29597.camel@suse.com>
References: <osstest128240mainreport@xen.org>
	 <5BB1E30202000078001ED16E@prv1mh.provo.novell.com>
	 <20181001143324.n6ghsnarvq6xslqt@zion.uk.xensource.com>
	 <5BB238E102000078001ED56E@prv1mh.provo.novell.com>
	 <20181001151716.snpgmxh77crrmihq@zion.uk.xensource.com>
	 <15ad853fb9acba0b3cc6457b61ec787e@citrix.com>
	 <20181001153557.y4jgo37xzbaa5tgg@zion.uk.xensource.com>
	 <fc2bbc89cfc7d9066fe0b1fd76ddd2ff@citrix.com>
	 <26110706a1830c111efd93ec76accd40@citrix.com>
	 <ffd0c284„c1c9„680c„564a„ce066a1fb210@suse.com>
	 <5BB32C7802000078001ED8FA@suse.com>
	 <dd29bed2a805194f2319ffe209790b6f5d7ac56d.camel@suse.com>
	 <5BB33C3202000078001ED99C@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5852677106539976103=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hhua=mo=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g7HRs-0006FJ-OE
 for xen-devel@lists.xenproject.org; Tue, 02 Oct 2018 09:58:36 +0000
In-Reply-To: <5BB33C3202000078001ED99C@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, osstest service owner <osstest-admin@xenproject.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org


--===============5852677106539976103==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-p7KGt/dqGX6FB3eUB80S"


--=-p7KGt/dqGX6FB3eUB80S
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2018-10-02 at 10:36 +0100, Jan Beulich wrote:
> > > > On 02.10.18 at 11:24, <dfaggioli@suse.com> wrote:
> >=20
> No. See J=C3=BCrgen's response. The default scheduler (irrespective of
> whether it was chosen via command line option) should not matter.
> Any means to force a non-default scheduler (and it indeed looks
> like CPU pools are the only way) should imo retain that specific
> scheduler.=20
>
Right, but the scheduler is a Xen/host (or cpupool) property, not a VM
one. Do we handle like that the other similar ones? Like, do we fail
migration if one host use the default setting wrt autoballooning and
the other doesn't? Or wrt XPTI and the other mitigations?

I mean, I think I see your point, and I'm still making up my mind about
this, but I'm starting to think that this is the user responsibility to
know what he's doing, and all we should do is, in this case, if we
notice the mismatch between the schedulers, to print a warning and
avoid setting the scheduler params...

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-p7KGt/dqGX6FB3eUB80S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluzQUUACgkQFkJ4iaW4
c+7h6BAA0SPN2Uo5jFhxgtCLrkcVAnq5vARPlJGGAaPuHgAw5pGy5g1yLl5Qpz2y
voKgL5/sIpEAybqtiqDM8KDE5m7D8+sPNfnrR1IcwPnOShWvAC8wvlAOhJfVwh4K
cV8Vd0xHRCSlDcNyQoI1yJme5pm8IQC8s4Q2TYx2GNzKvA1pgxYaAddXeSdoNeey
LaRopbemmpklq/VF6Z/s4NhYUKZt56MIaxmW/s4qvQwv727+bZaxvRXcxf0iHOp+
Hsu39wf/t++iT/DKfK5u9/Xz50S6CkmgR9nEYh05HD3ojGXs/CnaSAlYKGbFgiYU
x2amClElaL99DXZtxQpYppLDCFYEDspz1o05ymXZK3ssRE4mYT+58JgOE59QYeKS
yJbxyW0p3dRo0Jlv+JJIaG3POnIX9QayA/lB13yWPGk7vfmqIkRtiAnwYME0VJRN
GGy3dCbiW6iUQVMTffSpgWqexdUlZ/U8NqVn7Bu6cWQVeEYWRZWxgV5Uw3ksUvWq
sg0oT6/QDLV4FBLYkpyTQHWGEzUArCLMm+67X74I6k0EjOXw3h9G5C/Tpt51lOPA
13Rxuvc+nStVbjhxtXxfvURDa58EaurBjl+46cwXPZFmZn4USDCwPGPMgV2Av2NQ
nGEoo++XPybHkYUnPaBDzFSWRaMiEKa7Ek9E395uHBZmIkkB9/g=
=lib3
-----END PGP SIGNATURE-----

--=-p7KGt/dqGX6FB3eUB80S--



--===============5852677106539976103==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5852677106539976103==--
