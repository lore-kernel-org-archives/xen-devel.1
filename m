From: Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH] schedulers: validate / correct global data
 just once
Date: Fri, 29 Jun 2018 15:47:39 +0200
Message-ID: <4cb5704633cb82cfaa2293ff36d9ff3395c6a3ae.camel@suse.com>
References: <5B362FD402000078001CF26F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6319273113937134216=="
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tetx=jp=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1fYtkp-0004fC-8d
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 13:48:03 +0000
In-Reply-To: <5B362FD402000078001CF26F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org


--===============6319273113937134216==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-o3Pc94ZI7xxOudL3RoJk"


--=-o3Pc94ZI7xxOudL3RoJk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2018-06-29 at 07:10 -0600, Jan Beulich wrote:
> Also mark command line parsing routine __init.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

In fact...

> For credit2 I'm not sure the relatively verbose logging of all
> parameters should really happen upon every initialization. Otoh
> emitting
> it at boot time when the scheduler isn't actually used may also be
> confusing.
>=20
... I think it is ok to have these messages printed just once, during
boot, for all the schedulers we support (and that have been compiled
in).

The info about some parameters having been adjusted, although not
printed every time a scheduler instance is created, will always be
available in logs/xl dmesg, if one needs it.

About the confusion, perhaps adding a printk(), in each global_init
hook, saying something like "Credit Scheduler: global parameter
initialization" (and the same for Credit2, etc) would help.

My rev-by tag stands if that is added in this patch (and even if a
different wording is used). But I am also fine with the patch to go in
without that, as I consider it an improvement of the current situation
anyway.

Regards,
Dario
--=20
<<This happens because I choose it to happen!>> (Raistlin Majere)
-----------------------------------------------------------------
Dario Faggioli, Ph.D, http://about.me/dario.faggioli
Software Engineer @ SUSE https://www.suse.com/
--=-o3Pc94ZI7xxOudL3RoJk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAls2OH8ACgkQFkJ4iaW4
c+744BAAp/bcvIfLvbCIfyc6lfaaMqWvxNowPQEH/3P+hKMIGNQnRd1e/5YiE8rC
c2FC+ScBAeRo8q5MAEZn6tapJvmhMdNJqTW3fM7/TjiyLodwLnhq1tQ33c5JB39K
LpCsw3Brxr6VrMOBt6Ol1eCxjsYvyVR5OMDDTiovjgHPhbJLBa89VunmDK9Y/T5C
e0tvkuL6hiwI65YfYF3Tzx88G8lNBn0fl1/Ks0ZXZht3iY327mv39DROPIFu9csq
sGRhMrkZn86D7f/VAV/oTO+Kdw2vPZWMqrSXjTXhqH1Oyrz12uaS01SccpP5aZ0q
PD41j3WOXGC0adRCalrknhde+uEJseMVvzKk4JMgEFS2FZvnmaUPeAvoAtfVPJT/
kz8dcp9pbTHYic+9x+ZfbnfldO16DirxyWnwLN97cU1OI3QaMedMC2VZ9Tu+1Gj7
fKjHH1duut539bEjszJk5xCwbR+duyZmLYzL51LlPJY7lVDrb96mG1pcZj1bgYOS
4DWnxeZYDCU0NDcjJw0g8CnxRsjXhbDALUUZAOIPn7W00Lzl4JcRmIwnI4EdsoWu
l0hfq/QBU3ELo1VzfNeJhh8NF1VqYkZeh3AZE6PjXyGXKhyM/ACxDxH91skjQPHb
CuLREvjlA0Y8rhvTpiJyB9M5PdoiRMOZ58nsU1vhhwvUZ3AUOrI=
=VnS4
-----END PGP SIGNATURE-----

--=-o3Pc94ZI7xxOudL3RoJk--



--===============6319273113937134216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6319273113937134216==--
