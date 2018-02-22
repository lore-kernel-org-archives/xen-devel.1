From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 5/5] xen/libxc: suppress direct access to
 Credit1's migration delay
Date: Thu, 22 Feb 2018 18:39:27 +0100
Message-ID: <1519321167.5547.79.camel@suse.com>
References: <151931759370.5408.3600378338263227885.stgit@Solace.fritz.box>
 <151931853231.5408.9342065801393552631.stgit@Solace.fritz.box>
 <20180222173028.muupn7gtdmld72s3@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2465408041682946183=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dhkj=fq=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1eouqW-00068U-TE
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2018 17:39:52 +0000
In-Reply-To: <20180222173028.muupn7gtdmld72s3@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org


--===============2465408041682946183==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-uIvLpbO9m2owcJIkf5Qq"


--=-uIvLpbO9m2owcJIkf5Qq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-02-22 at 17:30 +0000, Wei Liu wrote:
> On Thu, Feb 22, 2018 at 05:55:32PM +0100, Dario Faggioli wrote:
> > Removes special purpose access to Credit1 vCPU
> > migration delay parameter.
> >=20
> > This fixes a build breakage, occuring when Xen
> > is configured with SCHED_CREDIT=3Dn.
> >=20
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > ---
> > Ian Jackson <ian.jackson@eu.citrix.com>
> > Wei Liu <wei.liu2@citrix.com>
> > Andrew Cooper <andrew.cooper3@citrix.com>
> > George Dunlap <George.Dunlap@eu.citrix.com>
> > Jan Beulich <jbeulich@suse.com>
> > Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> > Stefano Stabellini <sstabellini@kernel.org>
> > Tim Deegan <tim@xen.org>
> > George Dunlap <george.dunlap@eu.citrix.com>
>=20
> Forgot to prepend "Cc: ". :-)
>
Indeed! :-/

In this one only... Which I don't know if it's better or worse.

Sorry,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-uIvLpbO9m2owcJIkf5Qq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlqPAE8ACgkQFkJ4iaW4
c+5RJRAAyDvZQzK3IjsMeiYmIEW1QE1vgTj3AisEmUJlscCWUjQMzqTaVTd5b1k4
j6lYpK3B+pkMMWcXZrE+19pJ2gjpEMZ48Phlmlyag1NJX7L+4JTJuPR97PE3ZrZd
ALJeuDC5r7M9FnP8AVY1CgCgDI/i/DkJZgozfreW26R2bxj5VF+XMd/ZLMHDGih9
ndezloZkIonQhkuhgIhvCgxD24JiYAKCKuwzllLMyBroxjWD7/0pEWwuNwMm4wCG
OQpogp2WEJqiArQuagT3YN3jnwI3josEGYd3WSV4DSFsyx2EPScu+mWhoewC7ULy
hfe25w+n1LK9opxxy94oQL/YerN+UTK/Q6hOjy730iHcDjOb4M3Uc+dIkds9NuzV
co1LPB1dZ9EXMPvJKm3hRZjd6kzUhtanRzmrWyIurTZaw90zDqJ/2LDYOLT8dC7v
H3b6Q/Q2cX9uCo1OG33w0UXG9EJRNjPqWtP1G6DnhHy5KygOXAblvP7HrIxQvCZ2
1vGBpBKzKKl4m+CEeZcIApm47gV3EOYNMzGF3QnnysA2AMQpuq0c+mPuGeGbrLh6
czLw1dLTBBbIa2nz/sD2QC9UJiR3JoZowca07KcAukJHVJ6HcKs9anHYLP/lzL3b
QFkbukvc59Ue1Lu1Cv5gB5ZTwXwPEuGbbmAo/0bPUdkX76OZtyE=
=JIpG
-----END PGP SIGNATURE-----

--=-uIvLpbO9m2owcJIkf5Qq--



--===============2465408041682946183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2465408041682946183==--
