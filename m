From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Wed, 26 Sep 2018 19:30:38 +0200
Message-ID: <8982a437b41f90128a21456de6bb7182b24fae22.camel@suse.com>
References: <20180918060309.7186=3d3def=3d3dbf=3d3dbd1=3d3def=3d3d?==?UTF-8?Q?bf=3d3dbdjgr=3f=3doss@suse.com=3f=3d>
 <5BA0D44602000078001E93EA@p?==?UTF-8?Q?rv1=ef=bf=bdmh.provo.novell.com>
 <7cb2a460-095c-27c8-a4cf-47ef8e7?==?UTF-8?Q?850d5@suse.com>
 <5BA0DF9602000078001=3d=3fUTF-8=3fQ=3fE9448@suse.?==?UTF-8?Q?com>
 <6d56ad90-7825-adb7-f4e5-6c3ceb3210f6@suse.com>
 <001ab73a-07?==?UTF-8?Q?8d-4ec1-4acd-2fb4389e8867@citrix.com>
 <20180919172818.3aksiju4s3i?==?UTF-8?Q?pw42p@zion.uk.xens=3d=3fUTF-8=3fQ=3fource.com>
 <fffd7e59-e437-8ed?==?UTF-8?Q?9-b228-b537fde050cd@suse.com>
 <20180920160629.jullgb435zi7bcbr@zi?==?UTF-8?Q?on.uk.xensource.com>
 <eba521d2-f6c5-5096-82c2-af5983ed2372@suse.com>
 <20180921085240.dqzt5pomtnfjs665@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7533845712240947628=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8mt=mi=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5Deb-0000sf-UJ
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 17:31:13 +0000
In-Reply-To: <20180921085240.dqzt5pomtnfjs665@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============7533845712240947628==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-vFR6HR/IxzPnN9jERJZT"


--=-vFR6HR/IxzPnN9jERJZT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-09-21 at 09:52 +0100, Wei Liu wrote:
> On Fri, Sep 21, 2018 at 07:23:23AM +0200, Juergen Gross wrote:
> > On 20/09/18 18:06, Wei Liu wrote:
> > >=20
> > > It appears that the implementation in patch 10 concatenates the
> > > new
> > > settings to the old ones. It is not very nice imo.
> > >=20
> > > If for the life time of the domain you set X times the same
> > > parameter
> > > you get a string of foo=3Dbar1 foo=3Dbar2 in the saved config file.
> > >=20
> > > There is probably a simple solution: make the parameter list in
> > > IDL a
> > > key value list. You then update the list accordingly.
> >=20
> > The problem with that approach are parameters with sub-parameters:
> >=20
> > par=3Dsub1=3Dno,sub2=3Dyes
> > par=3Dsub2=3Dyes
>=20
> There is another way to solve this: further parse the sub-parameters.
> This doesn't require any parameter specific knowledge and there are
> already functions to split strings.
>=20
I'm not sure whether we're saying the same thing or not, but can't we,
when parameter 'foo', which has been set to 'bar1' already, is being
set to 'bar2', search d_config.b_info.parameters for the substring
containing 'foo=3Dbar1', replace it with 'foo=3Dbar2', and save d_config
again?

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-vFR6HR/IxzPnN9jERJZT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlurwj4ACgkQFkJ4iaW4
c+4Atw//eWTcZmgb2ZitNMALGUD0pYgZK4Ci8I+EWB/afSi6Hoqm3kQ6SH5QLpzw
OK93Vd9j9jA7foEthxij2jVxLey/HjfihLDkuMF2btkML+qWlqJv39fAJhgbys6f
VAsvWe4R9PI8oC309MlWzjq9AMo7WQp3tkTzaQ4lVF7dSlfofaiy++qUl3UA+AbC
K5SNFHK9VtzgyKN90YwdabGrqEwhb0ynLNwJ974S4thOYxec/oSgjLgHBLgOOnC3
eFYF6v/C6jjkReeTVtZd/oK6R7SGYUciO7hS/3V7abqD8D9/dMYz24p7huGKRnKe
0j+xDHOMQisiYrCDs7Icr++YVioIojxx3XEaTxxRg+hVj715hhZiIR9nxebqSIHv
BVKWTZ7QXNz6upLX0N2O2ORrgnaZFHJaYGiVuQgGFKKdlsZlgrDEboPTZi6WFBod
Z3Tw1s2yFpzY8zHDykRUA9ZWtnHrABoKY1rsUqFJwE1WSamzHLl5JOIQRl9ql0Cz
nI1dlc0r+vak9hEsZ3OX2px0BK9dG5gw48c6p/Ju4aXFFRH7Y0hjGtbDiKGS8PeR
1CXDKxn8hTvOJnG+lcbYtqup57jtCHpPbYTGVQmC/MmIDOVbJwUPKiqAHObu8vld
Pg4nSiKr3Ovl2W8oJ7aqQIIrZU0kunlV2WLAeMKIj4UGUGjWENw=
=/VEb
-----END PGP SIGNATURE-----

--=-vFR6HR/IxzPnN9jERJZT--



--===============7533845712240947628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7533845712240947628==--
