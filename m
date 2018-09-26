From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 00/12] add per-domain and per-cpupool
 generic parameters
Date: Wed, 26 Sep 2018 17:10:16 +0200
Message-ID: <7785b4d9724db9224ca8bed58d0f061ce1d67b71.camel@suse.com>
References: =?UTF-8?Q?<20180918060309.7186=ef=bf=bd1=ef=bf=bdjgross@suse.com?=
 =?UTF-8?Q?>
 _<5BA0D44602000078001E93EA@prv1=ef=bf=bdmh.provo.novell.com>
 _<7c?= =?UTF-8?Q?b2a460-095c-27c8-a4cf-47ef8e7850d5@suse.com>
 _<5BA0DF9602000078001?= =?UTF-8?Q?E9448@suse.com>
 _<6d56ad90-7825-adb7-f4e5-6c3ceb3210f6@suse.com>
 _<?= =?UTF-8?Q?001ab73a-078d-4ec1-4acd-2fb4389e8867@citrix.com>
 _<0a89246d-00a6-d?= =?UTF-8?Q?04a-4bce-3f0b98839d39@suse.com>
 ?= <d698d8c9-2582-6314-10cb-ecb9535f62e0@citrix.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5793675318275163494=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=n8mt=mi=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1g5BSd-0005k3-3D
 for xen-devel@lists.xenproject.org; Wed, 26 Sep 2018 15:10:43 +0000
In-Reply-To: <d698d8c9-2582-6314-10cb-ecb9535f62e0@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============5793675318275163494==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-TkUI/uz3zoLB+XKzIJFF"


--=-TkUI/uz3zoLB+XKzIJFF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Hey, is it me/my mailer, or threading is weird for this series? :-O]

On Tue, 2018-09-18 at 14:57 +0100, George Dunlap wrote:
> On 09/18/2018 02:36 PM, Juergen Gross wrote:
> >=20
> > The string variant is much more flexible.
> >=20
> > It is easy possible to e.g. add a per-domain trace parameter to
> > specify
> > rather complex trace instrumentations. Doing something like that
> > via a
> > struct based interface is in the best case complicated.
>=20
> ...or, for instance, specifying the runqueue layout of a cpupool (for
> schedulers like credit2 which allow such things).  Yes, that is true;
> but probably a very niche case.
>=20
Exactly. As another example, I want to follow up on this:

https://lists.xenproject.org/archives/html/xen-devel/2018-08/msg01644.html

More precisely, I want to add a per-cpupool "smt=3D[on|off|force]" (or
cpupool-smt, or something like that), with the following meaning:
- smt=3Don: cpus that are hyperthread siblings can be added to the=20
  cpupool. Adding a cpu whose sibling is in another pool would fail;
- smt=3Doff: only one cpu per core can be added to the cpupool. Adding a=
=20
  cpu whose sibling is already in the pool would fail. Adding a cpu=20
  whose sibling is in another pool would also fail;
- smt=3Dforce: (and I particularly dislike the name, but let's ignore it=
=20
  for now) any cpu can be added to any pool

What I was putting together was something along the lines of:

https://lists.xenproject.org/archives/html/xen-devel/2017-09/msg01552.html

And then there will be the support for having a line like this, in a
cpupool config file:

 smt =3D "off"

With this approach, instead, there will have to be a line like this in
there:

 parameters =3D "smt=3Doff"

Is that right?

And when we will also have the support for, say, per-cpupool runqueue
arrangement for Credit2, it will look like this:

 parameters =3D "credit2_runqueues=3Dsocket smt=3Doff"

Right again?

If yes, I think I'm fine with this.

The per-cpupool parameters case is, I think, probably less
controversial than the per-domain case. In facte, the parsing of, e.g.,
credit2_runqueue=3D, happens in Xen already. And most (if not all) of the
scheduling parameters that we allow as command line options, also make
sense as per-cpupool parameters, so... :-)

I'm not sure where to draw the line, assuming we even want to draw one.
I.e., if we take this approach and these patches, _any_ new parameter
will have to be handled like this? If no, how do we decide which ones
better use the "hypervisor centric" string blobs, and which ones better
use the current "toolstack centric" one? About this (and especially for
per-domain params), I've much less clear ideas.

But as far as per-cpupools parameters are concerned, I do like this.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/

--=-TkUI/uz3zoLB+XKzIJFF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAluroVwACgkQFkJ4iaW4
c+4TwxAAuJHDu9KEcGEaYTdzjwnCMRoGCUWKc+2HmP7CL/Is7/3Hv9x9h2Rp4rgo
GFZvTYDo18hrYrQlayYfMP8IGhJx0O7/yLwsLzPbk4PYvo5Y3UadqWzOvLwxcCRF
YevDkeceAQmG+CVTTtUuo9AY9lEq/k6ZlcAUnm+Iwnb9wkqSSeoOmoiN+XZCGU7/
/VsDBfK1CgIgsnx6tjm/DszDjbrJXsE/P1MErIBUi0ehO76qQETC57RC+P3CthSe
MiA7BlOjZ4s0ZYxagiBshIfKceW7CbXNyrCc4z8KgBVhNNH5OTecj8m+KPA2yB1N
nMLynpc+0ZlzwztISQN1Hv7z5THXY+ZHxTd3wx/GwCxbaHH0qllz883cfJW63ExU
TfTTfE5m7PBhIb4/on1PyWZ/3sBHC1cQF/l7CJbLQZHllf6yMiXcwrILamoYtL0W
BlIOaPqtBSUiYKDu1g4EGi8sO5YUrJTmrodFH3UGXDdIqr7/SF7BWENI2xWn9t5m
9eE1dnokpFRsuyIcw7LCBWg0bmZA3J7GI7AFv9Pa+dufWKCkzUxq2RXUwDwzIoyT
II4aeGKjjT84pE+pjlhrh1/paPHf7nm5wk/rTp+rpW063WOLWEHZ8zDbme+hEQP3
AWCSQhhwSggpo8FUjLmCGW0SNUd2SDxHq2RDhl3J4FmuA3SBSZM=
=n3fE
-----END PGP SIGNATURE-----

--=-TkUI/uz3zoLB+XKzIJFF--



--===============5793675318275163494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5793675318275163494==--
