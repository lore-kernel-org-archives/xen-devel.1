From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 5/6] xen/cpupool: simplify suspend/resume
 handling
Date: Wed, 27 Mar 2019 17:32:37 +0100
Message-ID: <2d6be0355efc7f38c5ab42a5b2f887cd06aab40f.camel@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-6-jgross@suse.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1935972518517821932=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/lXT=R6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1h9BTp-0006O8-AE
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:32:45 +0000
In-Reply-To: <20190318131155.29450-6-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============1935972518517821932==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-/HFghbw1BLg/HNAlfQLY"


--=-/HFghbw1BLg/HNAlfQLY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-03-18 at 14:11 +0100, Juergen Gross wrote:
> Instead of removing cpus temporarily from cpupools during
> suspend/resume only remove cpus finally which didn't come up when
> resuming.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  xen/common/cpupool.c       | 130 ++++++++++++++++++-----------------
> ----------
>  xen/include/xen/sched-if.h |   1 -
>  2 files changed, 51 insertions(+), 80 deletions(-)
>
Cool diffstat! :-)

And I'm particularly happy to see 'c->cpu_suspended' go away. ;-D

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-/HFghbw1BLg/HNAlfQLY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlybpaUACgkQFkJ4iaW4
c+5zww/9GvU4B4MaMhyE/umpehZQCToK/nuuPe4KWzWBv3qGQEWprCxmvIaNUmGb
55kOjU5piQ/TjV8WGjh+FU2/HThJhpg1bxk3e1/sgke0W3as2fIXdD4YpA8OGG9l
sD/C4eKGbnisUD/N+7S8estE1Mt/IeljffnoBbX40Sd7OgWazYYtIokqTwSfB1OI
edSlUTWHvxjx3zXWZYXPekE7FyiyZ5FbcqjxUttFBXjlNdPtgX2zoJ6WaH+I/GPf
ZNo2UpXYUHGjman7lxWas58Yx/OnCRE5NaSJG6kuI2vEvwAd27ULbkwtG2OyioNr
L7qKXvGO8N7eY6DZWawuRymyLLutdCSpynzEdIUW3O8fZWLVMb8xcbg5Plvuh3T3
LkanTmJ8flFvol57SFrQk9L2zxOD1lZ1bYPCAo1UojqxHN75GEH7g+hT+8Dtzvw1
MrZskzCcDf32VzBmb7Jde0bIObh274cWiZ11cNd75WzaeKPzJJp3zSIr9tv5bkBj
Vr+9N9kyqAqH8Kpn66krr36BIpGlrg5bRLnh5DcdmHzhUHARsfNFimvmMR7HXPT5
50wtIPQdCDswF7a2Ruenm5mFd7Vzi+X+GpmAIUtq/+XkuAUvn3LHWcSr7yWSkg3y
vW/+XvbB3E7+znsiGliJgfNcUQZcB1Y0dvhaGKL/DJmcb6nlIm8=
=3AlI
-----END PGP SIGNATURE-----

--=-/HFghbw1BLg/HNAlfQLY--



--===============1935972518517821932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1935972518517821932==--
