From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v6 11/13] xen: support the Null scheduler
Date: Thu, 28 Jun 2018 09:27:08 +0200
Message-ID: <fc748ba73ec2eacc38613883d7a80ea748cf4d37.camel@suse.com>
References: <alpine.DEB.2.10.1806131409300.14695@sstabellini-ThinkPad-X260>
 <1528924492-6579-11-git-send-email-sstabellini@kernel.org>
 <5B22706A02000078001CB4C2@prv1-mh.provo.novell.com>
 <3881fbda-d34b-caf2-23d7-5f6e0a956748@citrix.com>
 <alpine.DEB.2.10.1806141318080.14695@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3430765716071650660=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1806141318080.14695@sstabellini-ThinkPad-X260>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============3430765716071650660==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-F7VnsJM5CMFnmpRfdMw9"


--=-F7VnsJM5CMFnmpRfdMw9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2018-06-14 at 13:20 -0700, Stefano Stabellini wrote:
> On Thu, 14 Jun 2018, Andrew Cooper wrote:
> > On 14/06/18 14:40, Jan Beulich wrote:
> > I don't think its reasonable to alter the support status with this
> issue
> > outstanding.
>=20
> I completely missed this report, probably because I haven't paid
> attention to PV-shim. Do you have any more information about this?
> The
> report is a bit vague. If I can't repro it, I can't fix it.
>=20
> Couldn't it be that is normal because after a while you ran out of
> pcpus?
>=20
> Dario, do you have any opinion on this?
>
The issue that I know of is that the null scheduler does not properly
support CPU hotplug/hotunplug.

This is an issue on, let's say, baremetal, if you use null, and try to
do CPU hotplug/hotunplug. When trying to use null as the scheduler of
the shim, we run into that same issue, even if not specifically doing
CPU hotplug/hotunplug (because the shim use the same path for CPU
bringup, IIRC).

In fact, I'm Cc-ing Roger as he's the one that found out the issue, and
we've discussed already a plan to fix it (that was mostly on IRC, so I
don't have a link, sorry).

FWIW, I am a little bit pressed with something right now, but fixing
this is very high in my todo list.

I think we should definitely aim at having null as supported for 4.12,
but I wouldn't mark it as such with known outstanding bugs.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-F7VnsJM5CMFnmpRfdMw9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAls0jcwACgkQFkJ4iaW4
c+6mgBAA2z5C1AtYnMiFpojvJ4kCetmgfKKtX9RJkv5n+PdDFFKmvTnTL8DZHOGU
qgBbDbZ8bijtDupTXQCKLRz8UjmQC1jmg47q1iT9gves0Hg8i+jhDL9JnIBlLSKX
rJEwMUBVSkGpPr6MQwOsm1ZBui9AN7Lm4DvqU2IyonkHHKhxaKOhCaJqcmvli82i
gm0Ui8o7eIJ4eaH0UBJ/4z0YBg1yH0edTzEBFDJEq+GGlpnVXS8rJU0IheiUrvmf
eb4m7TCl6ELIH0JtfjyD+1toc72Lx/26C9VeD8/dbv/xFvJVLwg6vjG+OnGStgQH
Qz4jPzRDV0jKlBC8oCM3HXqnyzKYEgSaltDdFzn6pJUQ+V1Ze2WYHD+FDYuF0SO5
l4P76sSQE2o9Q8YGTRBB+G5ttA5OaQn20L0t1ALhJqhzzh4MfrDEJPAzxJtjTVF/
t37C3uvA7qb4txHAP122BgamliDsTTjXGfpRM3Fjjw8M/vnijusXN/YL4FCxFVxw
ogwO+KM65jTtROLaKxmCF7jo1JbcLNr9RlCtPdEenu0c+sJ3/+v9joHhEnXn6FBy
JBoIB55ltRWrJLEso23Cb6h8OwklQT3lCusejOl9Lqu9LEyFvevA13dqz467+0Co
fvua7TvbxkT7bvr1zHVXUlXEJWUqP/znJ+U+R89rDCy/KJqDby4=
=HuBn
-----END PGP SIGNATURE-----

--=-F7VnsJM5CMFnmpRfdMw9--



--===============3430765716071650660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3430765716071650660==--
